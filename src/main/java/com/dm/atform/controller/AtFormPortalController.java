package com.dm.atform.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.atform.model.AtField;
import com.dm.atform.model.AtTable;
import com.dm.atform.service.AtFieldService;
import com.dm.atform.service.AtTableService;
import com.dm.atform.service.MongoService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
import com.dm.platform.service.LogService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SearchConditionUtil;
import com.github.pagehelper.PageInfo;

/**
 * Created by
 */
@Controller
@RequestMapping("/portal")
public class AtFormPortalController {

	@Autowired
	private AtFieldService colService;

	@Autowired
	private AtTableService table;
	
	@Autowired
	private CmsSiteService siteService;

	@Autowired
	private MongoService mongo;
	
	@Autowired
	private MongoTemplate mongoTemplate;

	@Autowired
	private LogService logService;
	
	@RequestMapping("/datagrid")
	public String page(Model model) {
		return "/atform/grid/frontpage";
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
			gridItem = formItem = this.mongo.findOne(atTable);
			if (gridItem.size() != 0) {
				initCol(gridItem, atTable.getId());// 初始化
				return getColConf(searchMap, atTable);// 重新读取
			}
		}
		m.put("gridItem", gridItem);
		m.put("formItem", formItem);
		m.put("searchItem", searchItem);
		return m;
	}

	private void initCol(List<Map> gridItem, String tableId) {
		for (Map co : gridItem) {
			String col = (String) co.get("id");
			AtField atField = new AtField();
			atField.setaType("text");
			atField.setaField(col);
			atField.setaTitle(col);
			atField.setTableId(tableId);
			atField.setDetailShow(true);
			atField.setGridShow(true);
			if (col.equalsIgnoreCase("id") || col.equalsIgnoreCase("objectid")) {
				atField.setGridShow(false);
			}
			this.colService.saveOrUpdate(atField);
		}
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

	@RequestMapping("tree")
	@ResponseBody
	public Object tree(
			@RequestParam(value = "tableId", required = false) String tableId,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "type", required = false) String type) {
		Map map = new HashMap();
		map.put("pId", tableId);
		map.put("status", status);
		map.put("type", type);
		return this.table.getTree(map);
	}

	@RequestMapping("tablevisit")
	@ResponseBody
	public Object tablevisit(
			@RequestParam(value = "tableId", required = true) String tableId) {
		AtTable record = this.table.findOne(tableId);
		if (record == null)
			return "error";
		record.setVisitCount(record.getVisitCount() + 1);
		this.table.nologUpdate(record);
		return "success";
	}

	@RequestMapping("/data/grid/{tableId}_{pageNum}.htm")
	public String grid(
			Model model,
			Device device,
			@PathVariable("tableId") String tableId,
			@PathVariable(value = "pageNum") Integer pageNum,
			@RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize,
			@RequestParam(value = "param", required = false) String param) {
		CmsSite site = this.siteService.findOneById(1);
		AtTable t = this.table.findOne(tableId);
		model.addAttribute("superChannelId", 1);
		model.addAttribute("own", 1);
		model.addAttribute("typeId", tableId);
		model.addAttribute("site", site);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("table", t);
		model.addAttribute("param", param);
		return "/template/sn_datagrid";
	}

	@RequestMapping("/data/info/{tableId}.htm")
	public String info(Model model, Device device,
			@PathVariable("tableId") String tableId,
			@RequestParam(value = "param", required = false) String param) {
		Map map = new HashMap();
		AtTable record = new AtTable();
		record.setpId(tableId);
		record.setType("0");
		record.setStatus("1");
		map.put("model", record);
		map.put("sort","seq asc" );
		List<AtTable> list = this.table.findAllByArg(map);
		AtTable t = this.table.findOne(tableId);
		Integer count = (t.getVisitCount()==null?0:t.getVisitCount())+1;
		t.setVisitCount(count);
		this.table.upCount(t);
		int s = -1;
		if(list.size()==0){
			list.add(t);
		}else if(list.size()>1){
			for(int i=0;i<list.size();i++){
				AtTable tabl = list.get(i);
				tabl.setVisitCount(count);
				this.table.upCount(tabl);
				if(tabl.getId().equals(tableId)){
					s= i;
				}
			}
		}
		if(s!=-1){
			list.remove(s);
		}
		model.addAttribute("superChannelId", 1);
		model.addAttribute("own", 1);
		model.addAttribute("tableId", tableId);
		model.addAttribute("typeId", t.getpId());
		model.addAttribute("type",t);
		CmsSite site = this.siteService.findOneById(1);
		model.addAttribute("site", site);
		model.addAttribute("tables", list);
		// model.addAttribute("htmlFolder", htmlFolder);
		// model.addAttribute("htmlMobileFolder", htmlMobileFolder);
		// //model.addAttribute("projectName", projectName);
		model.addAttribute("param", param);
		return "/template/sn_datainfo";
	}
	
			
}