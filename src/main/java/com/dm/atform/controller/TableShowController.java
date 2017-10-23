package com.dm.atform.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.atform.model.AtField;
import com.dm.atform.model.AtTable;
import com.dm.atform.service.AtFieldService;
import com.dm.atform.service.AtTableService;
import com.dm.atform.service.MongoService;
import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsContent;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsContentService;
import com.dm.importmanage.model.ExclImportConf;
import com.dm.importmanage.service.ImportManageService;
import com.dm.platform.model.UserAccount;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SearchConditionUtil;
import com.dm.platform.util.UserAccountUtil;
import com.github.pagehelper.PageInfo;
import com.mongodb.DBObject;

@Controller
@RequestMapping("show")
public class TableShowController {

	@Autowired
	private AtFieldService colService;

	@Autowired
	private AtTableService table;

	@Autowired
	private MongoService mongo;

	@Autowired
	CmsContentService cmsContentService;
	@Autowired
	CmsChannelService cmsChannelService;
	@Autowired
	ImportManageService importManageService;
	@Value("${spider.publish.contentKey}")
	private String CONTENT_KEY;
	public static Map<String,String> map = new HashMap<String,String>();
	{
		map.put("url", "网址");
		map.put("name", "名称");
		map.put("title", "标题");
		map.put("insertTime", "插入时间");
		map.put("updateTime", "更新时间");
		map.put("content", "内容");
		map.put("description", "简介");
		map.put("content_html", "内容代码");
		map.put("subTitle", "子标题");
		map.put("publishTime", "发布时间");
		map.put("author", "作者");
		map.put("origin", "来源");
	}
	
	@RequestMapping("/page")
	public String page(Model model) {
		return "/atform/grid/page";
	}

	@RequestMapping("list")
	@ResponseBody
	public Object list(
			HttpServletRequest request,
			@RequestParam(value = "tableId", required = false) String tableId,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") Integer pageSize,
			@RequestParam(value = "sort", required = false, defaultValue = "") String sort) {
		AtTable atTable = this.table.findOne(tableId);
		if (atTable == null || atTable.getTableName() == null) {
			return PageConvertUtil.emptyGrid();
		}
		Map searchMap = SearchConditionUtil.packageSearchCondion(request);
		PageInfo<AtField> page = this.mongo.queryMulti(atTable, pageNum,
				pageSize, searchMap, sort);
		return PageConvertUtil.grid(page);
	}

	@RequestMapping("beforlist")
	@ResponseBody
	public Object beforlist(HttpServletRequest request,
			@RequestParam(value = "tableId", required = false) String tableId) {
		if (tableId == null)
			return ResponseUtil.error("tableId参数必须的!");
		AtTable atTable = this.table.findOne(tableId);
		if (atTable == null)
			return ResponseUtil.error("tableId参数错误!");
		Map searchMap = new HashMap();
		AtField f = new AtField();
		f.setTableId(tableId);
		searchMap.put("model", f);
		Map m = this.getColConf(searchMap, atTable);
		m.put("info", atTable);
		return m;
	}

	private Map getColConf(Map searchMap, AtTable atTable) {
		Map m = ResponseUtil.success();
		List<AtField> list = this.colService.findAll(searchMap);
		List<Map> gridItem = new ArrayList();
		List<Map> formItem = new ArrayList();
		List<Map> searchItem = new ArrayList();
		for (AtField a : list) {
			if (a.getGridShow()) {
				gridItem.add(a.toGridItem());
			}
			if (a.getDetailShow()) {
				formItem.add(a.toFormItem());
			}
			if (a.getaSearch()) {
				searchItem.add(a.toSearchItem());
			}
		}
		m.put("id", atTable.getIdField());
		if (atTable.getIdField() == null)
			m.put("id", "_id");
		if (list.size() == 0) {// 如果没有配置 查询集合的所有字段 //初始化配置
			// return ResponseUtil.error("未配置!");
			String tableName = atTable.getTableName();
			ExclImportConf conf = this.importManageService
					.selectByTableName(tableName);
			if (conf == null) {
				gridItem = formItem = this.mongo.findOne(atTable);
				if (gridItem.size() != 0) {
					initCol(gridItem, atTable.getId());// 初始化
					return getColConf(searchMap, atTable);// 重新读取
				}
			} else {
				initCol(conf, atTable.getId());
				return getColConf(searchMap, atTable);// 重新读取
			}
		}
		m.put("gridItem", gridItem);
		m.put("formItem", formItem);
		m.put("searchItem", searchItem);
		return m;
	}

	private void initCol(ExclImportConf conf,String tableId) {
		String[] names = conf.getCollectionNames().split(",");
		String[] titles = conf.getCollectionTitles().split(",");
		int i = 0;
		for (String col : names) {
			AtField atField = new AtField();
			atField.setaType("text");
			atField.setaField(col);
			atField.setaTitle(titles[i]);
			atField.setTableId(tableId);
			atField.setDetailShow(true);
			atField.setGridShow(true);
			if(i>6) atField.setGridShow(false);
			atField.setaSeq(i++);
			if (col.equalsIgnoreCase("id") || col.equalsIgnoreCase("objectid")
					|| col.equalsIgnoreCase("insertDate")
					|| col.equalsIgnoreCase("importTime")
					|| col.equalsIgnoreCase("doflag")
					|| col.equalsIgnoreCase("XZC_CODE")
					|| col.equalsIgnoreCase("url")
					) {
				atField.setGridShow(false);
				atField.setDetailShow(false);
			}

			this.colService.saveOrUpdate(atField);
		}
		
	}

	private void initCol(List<Map> gridItem, String tableId) {
		int i = 0;
		for (Map co : gridItem) {
			String col = (String) co.get("id");
			AtField atField = new AtField();
			atField.setaType((String)co.get("type"));
			atField.setaField(col);
			atField.setaTitle(getTitle(col));
			atField.setTableId(tableId);
			atField.setDetailShow(true);
			atField.setGridShow(true);
			atField.setaSeq(i++);
			if (col.equalsIgnoreCase("id") || col.equalsIgnoreCase("objectid")
					|| col.equalsIgnoreCase("insertDate")
					|| col.equalsIgnoreCase("exchange_time")
					|| col.equalsIgnoreCase("doflag")
					|| col.equalsIgnoreCase("XZC_CODE")
					|| col.equalsIgnoreCase("url")
					|| col.endsWith("_html")
					|| atField.getaType().equalsIgnoreCase("datepicker")) {
				atField.setGridShow(false);
				atField.setDetailShow(false);
			}

			this.colService.saveOrUpdate(atField);
		}
	}

	private String getTitle(String col) {
		String title = map.get(col);
		return title==null?col:title;
	}

	@RequestMapping("load")
	@ResponseBody
	public Object load(String tableId, String id) {
		if (tableId == null)
			return ResponseUtil.error("tableId参数必须的!");
		AtTable atTable = this.table.findOne(tableId);
		if (atTable == null)
			return ResponseUtil.error("tableId参数错误!");
		return this.mongo.findOne(atTable, id);
	}

	@RequestMapping("publish")
	@ResponseBody
	public Object publish(HttpServletRequest request, String tableId,
			Integer channelId, String id) {
		if (tableId == null)
			return ResponseUtil.error("tableId参数必须的!");
		AtTable atTable = this.table.findOne(tableId);
		if (atTable == null)
			return ResponseUtil.error("tableId参数错误!");
		DBObject o = (DBObject) this.mongo.findOne(atTable, id);
		// Iterator<String> iter = o.keySet().iterator();
		if (o == null) {
			return ResponseUtil.error("未找到该数据");
		}
		CmsContent content = new CmsContent();
		Object cont = o.get(CONTENT_KEY);
		if (cont == null) {
			return ResponseUtil.error("数据不正确");
		}
		content.setContentText((String) cont);
		content.setAuthor((String) o.get("author"));
		content.setTitle((String) o.get("title"));
		// content.setPublishDate(publishDate);
		content.setOrigin((String) o.get("origin"));
		content.setChannelId(channelId);// TODO 发布到默认频道
		content.setContentType(0);
		content.setTemplateId(12);// TODO 获取模板
		content.setSeq(1);
		content.setFiled1((String) o.get("url"));
		content.setCreateTime(new Date());
		insert(content);
		boolean succ = this.cmsContentService.updateContentState(request,
				content.getId(), new Short("2"));
		if (succ)
			return ResponseUtil.success("发布成功");
		return ResponseUtil.success("操作失败");
	}

	private void insert(CmsContent cmsContent) {
		CmsChannel cmsChannel = cmsChannelService.findOneById(cmsContent
				.getChannelId());
		cmsContent.setSiteDomain(cmsChannel.getSiteDomain());
		cmsContent.setChannelEnName(cmsChannel.getEnName());
		cmsContent.setIsDelete(false);
		UserAccount user = UserAccountUtil.getInstance()
				.getCurrentUserAccount();
		cmsContent.setCreateUser(user.getCode());
		cmsContent.setCreateUserName(user.getName());
		if (cmsContent.getTitleStyle() != null
				&& !cmsContent.getTitleStyle().equals("")) {
			String titleStyleArray[] = cmsContent.getTitleStyle().split(",");
			cmsContent.setTitleStyle("color:" + titleStyleArray[0]
					+ ";font-size:" + titleStyleArray[1]);
		}
		cmsContentService.insertCmsContent(cmsContent);
	}

	@RequestMapping("insertOrUpdate")
	@ResponseBody
	public Object addOrUpdate(HttpServletRequest request, String tableId) {
		if (tableId == null)
			return ResponseUtil.error("tableId参数必须的!");
		AtTable atTable = this.table.findOne(tableId);
		if (atTable == null)
			return ResponseUtil.error("tableId参数错误!");
		Map record = SearchConditionUtil.packageSearchCondion(request);
		record.remove("tableId");
		this.mongo.saveOrUpdate(atTable, record);
		return ResponseUtil.success();
	}

	@RequestMapping("delete")
	@ResponseBody
	public Object delte(String tableId, String id) {
		if (tableId == null)
			return ResponseUtil.error("tableId参数必须的!");
		AtTable atTable = this.table.findOne(tableId);
		if (atTable == null)
			return ResponseUtil.error("tableId参数错误!");
		this.mongo.delete(atTable, id);
		return ResponseUtil.success();
	}
}
