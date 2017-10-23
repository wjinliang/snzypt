package com.dm.cms.controller;

import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsSiteService;
import com.dm.platform.dto.SelectOptionDto;
import com.dm.platform.dto.TreeNode;
import com.dm.platform.util.FileUtil;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SqlParam;
import com.github.pagehelper.PageInfo;

/**
 * Created by cgj on 2015/11/22.
 */

@Controller
@RequestMapping("/cms/site")
public class CmsSiteController {
	@Value("${importDataPath}")
	String importDataPath;
	@Autowired
	CmsSiteService cmsSiteService;
	@Autowired
	CmsChannelService cmsChannelService;

	@RequestMapping("/page")
	public String page(Model model) {
		return "/cms/site/page";
	}

	@RequestMapping("/list")
	public @ResponseBody
	Object findSites(
			@RequestParam(value = "pageNum", required = false) Integer pageNum,
			@RequestParam(value = "pageSize", required = false) Integer pageSize,
			CmsSite cmsSite,
			@RequestParam(value = "sort", required = false) String sort) {
		Map map = new SqlParam<CmsSite>().autoParam(cmsSite, sort);
		PageInfo<CmsSite> page = cmsSiteService.findCmsSite(pageNum, pageSize,
				map);
		return PageConvertUtil.grid(page);
	}

	@RequestMapping("/load")
	public @ResponseBody
	Object load(@RequestParam(value = "siteId", required = true) Integer siteId) {
		CmsSite cmsSite = cmsSiteService.findOneById(siteId);
		return cmsSite;
	}

	@RequestMapping("/insertOrUpdate")
	public @ResponseBody
	Object insertOrUpdate(CmsSite site) {
		if (site.getId() == null) {
			insert(site);
		} else {
			update(site);
		}
		return ResponseUtil.success();
	}

	private void insert(CmsSite site) {
		cmsSiteService.insertCmsSite(site);
	}

	private void update(CmsSite site) {
		cmsSiteService.updateCmsSite(site);
	}

	@RequestMapping("/delete")
	public @ResponseBody
	Object delete(@RequestParam(value = "siteId", required = true) String siteId) {
		if (StringUtils.isNotBlank(siteId)) {
			String[] id = siteId.split(",");
			for (String cmsSiteId : id) {
				Integer siteid = Integer.valueOf(cmsSiteId);
				List<TreeNode> list = this.cmsChannelService
						.findCmsChannelTreeNodeBySiteId(siteid, null,null);
				if (list.size() > 0)
					return ResponseUtil.error("删除失败，请先删除该站点下的所有频道！");
				cmsSiteService.deleteCmsSite(siteid);
			}
		}
		return ResponseUtil.success("删除成功！");
	}

	@RequestMapping("/tree")
	public @ResponseBody
	Object treeJson() {
		List<TreeNode> treeNodes = cmsSiteService.findCmsSiteTreeNodes();
		return treeNodes;
	}

	@RequestMapping("/selectOptions")
	public @ResponseBody
	Object selectOptions() {
		List<SelectOptionDto> selectOptionDtos = cmsSiteService
				.findCmsSiteSelectOption();
		return selectOptionDtos;
	}

	@RequestMapping("/generatorHtml")
	public @ResponseBody
	Object genneratorHtml(HttpServletRequest request, Integer siteId) {
		boolean status = cmsSiteService.generatorHtml(siteId, request);
		if (status) {
			return ResponseUtil.success("静态化成功！");
		} else {
			return ResponseUtil.error("静态化失败");
		}
	}

	@RequestMapping("/cancelGeneratorHtml")
	public @ResponseBody
	Object cancelGeneratorHtml(HttpServletRequest request, Integer siteId) {
		boolean status = cmsSiteService.cancelGeneratorHtml(siteId, request);
		if (status) {
			return ResponseUtil.success("取消静态化成功！");
		} else {
			return ResponseUtil.error("取消静态化失败");
		}
	}

	/**
	 * 一键静态化
	 * 
	 * @param request
	 * @param siteId
	 * @return
	 */
	@RequestMapping("/generatorHtmlSite")
	public @ResponseBody
	Object generatorHtmlSite(HttpServletRequest request,
			String siteChannelContent, Integer siteId) {

		boolean status = cmsSiteService.GeneratorHtmlSite(siteId, request,
				siteChannelContent);
		if (status) {
			return ResponseUtil.success("静态化成功！");
		} else {
			return ResponseUtil.error("静态化失败");
		}
	}

	/**
	 * 导入数据
	 * 
	 * @param importType
	 * @param filePath
	 * @return
	 */
	@RequestMapping("/importData")
	@ResponseBody
	public Object importData(HttpServletRequest httpServletRequest,
			@RequestParam("importType") Integer importType,
			@RequestParam("filePath") String fileName) {
		String contextPath = httpServletRequest.getSession()
				.getServletContext().getRealPath("/");
		String file = contextPath + importDataPath + "/" + fileName;
		try{
		byte[] bytes = FileUtil.getBytesFromPath(file);
		String jsonContext = null;
		try {
			jsonContext = new String(bytes, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if (jsonContext == null) {
			return ResponseUtil.error("请上传有效文件！");
		}
		if(importType==0){
			JSONObject jsonObject = JSONObject.fromObject(jsonContext);
			CmsSite site = (CmsSite)JSONObject.toBean((JSONObject) jsonObject.get("site"),CmsSite.class);
			this.cmsSiteService.updateCmsSite(site);
			JSONArray jsonArray = (JSONArray) jsonObject.get("channels");
			int size = jsonArray.size();
			for (int i = 0; i < size; i++) {
				JSONObject c = jsonArray.getJSONObject(i);
				CmsChannel channel =(CmsChannel)JSONObject.toBean(c,CmsChannel.class);
				if(0==this.cmsChannelService.updateCmsChannel(channel,false)){
					this.cmsChannelService.insertCmsChannel(channel);
				}
			}			
		}else if(importType ==1){
			JSONObject jsonObject = JSONObject.fromObject(jsonContext);
			CmsSite site = (CmsSite)JSONObject.toBean(jsonObject.getJSONObject("site"),CmsSite.class);
			site.setIsHtml(null);
			site.setId(null);
			site.setUrl(null);
			String name ="-"+(Math.random()*1000);
			site.setDisplayName(site.getDisplayName()+name);
			site.setDomain(site.getDomain()+name);
			this.cmsSiteService.insertCmsSite(site);
			JSONArray jsonArray = (JSONArray) jsonObject.get("channels");
			List<CmsChannel> list =(List<CmsChannel>) JSONArray.toCollection(jsonArray,CmsChannel.class);
			//转换成树结构 父子频道 便于插入
			list = forMatChannelList(list);
			insertAllChannels(site.getId(),0,list);
		}
		}catch(Exception e){
			e.printStackTrace();
			return ResponseUtil.error("导入失败！");
		}finally{
			FileUtil.deleteFile(file);
		}
		return ResponseUtil.success("导入成功！");
	}
	
	private void insertAllChannels(Integer siteId,Integer pid, List<CmsChannel> list) {
		if(list==null) return;
		for(CmsChannel channel:list){
			channel.setId(null);
			channel.setSiteId(siteId);
			channel.setPid(pid);
			channel.setIsHtml(null);
			channel.setEnName(channel.getEnName());
			CmsChannel c = this.cmsChannelService.findOneByPortal(null, channel.getEnName());
			while(c != null){
				String str = "qwertyuioplkjhgfdsazxcvbnm";
				int start = (int)(Math.random()*str.length()-3);
				int end = start +(int)(Math.random()*3+1);
				channel.setEnName(channel.getEnName()+str.subSequence(start, end));
				c = this.cmsChannelService.findOneByPortal(null, channel.getEnName());
			}
			this.cmsChannelService.insertCmsChannel(channel);
			insertAllChannels(siteId,channel.getId(), channel.getChildChannels());
		}
		
	}

	/**
	 * 导出数据
	 * 
	 * @param siteId
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/exportData")
	public void exportData(HttpServletRequest httpServletRequest,
			HttpServletResponse response, Integer siteId)
			throws UnsupportedEncodingException {
		CmsSite cmsSite = this.cmsSiteService.findOneById(siteId);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-DD-HH-mm-ss-ms");
		String fileName = cmsSite.getDomain() + format.format(new Date())
				+ ".json";
		response.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");
		response.setHeader("Content-Disposition", "attachment;fileName="
				+ new String(fileName.getBytes("gbk"), "iso-8859-1"));
		try {
			JSONObject jsonObject = new JSONObject();
			JSONObject site = JSONObject.fromObject(cmsSite);
			jsonObject.put("site", site);
			CmsChannel cmsChannel = new CmsChannel();
			cmsChannel.setSiteId(siteId);
			List<CmsChannel> list = this.cmsChannelService
					.findCmsChannelByPage(1, 1000, cmsChannel).getList();
			JSONArray jsonArray = JSONArray.fromObject(list);
			jsonObject.put("channels", jsonArray);
			InputStream inputStream = new ByteArrayInputStream(jsonObject
					.toString().getBytes("utf-8"));
			OutputStream os = response.getOutputStream();
			byte[] b = new byte[1024];
			int length;
			while ((length = inputStream.read(b)) > 0) {
				os.write(b, 0, length);
			}
			inputStream.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private List<CmsChannel> forMatChannelList(List<CmsChannel> list) {
		List<CmsChannel> newList = new ArrayList<CmsChannel>();
		// JSONArray channels = new JSONArray();
		for (CmsChannel c : list) {
			if (c.getPid() == 0) {
				newList.add(c);
			}
			// for(CmsChannel cc :list){
			// if(c.getId().equals(cc.getPid())){
			// if(c.getChildChannels()==null){
			// c.setChildChannels(new ArrayList<CmsChannel>());
			// c.getChildChannels().add(cc);
			// }
			// }
			// }
		}
		List<CmsChannel> childList = (List<CmsChannel>) CollectionUtils
				.subtract(list, newList);
		for (CmsChannel c : newList) {
			List<CmsChannel> children = addChildren(c, childList);
			c.setChildChannels(children);
		}
		return newList;
	}

	private List<CmsChannel> addChildren(CmsChannel root,
			List<CmsChannel> childList) {
		List<CmsChannel> children = new ArrayList<CmsChannel>();
		for (CmsChannel comparedOne : childList) {
			if (comparedOne.getPid().equals(root.getId())) {
				children.add(comparedOne);
			}
		}
		if(children.size()==0) return children;
		List<CmsChannel> newList = (List<CmsChannel>) CollectionUtils.subtract(
				childList, children);
		if(newList.size()==0){
			return children;
		}
		for (CmsChannel child : children) {
			List<CmsChannel> childrens = addChildren(child,newList);
			child.setChildChannels(childrens);
		}
		return children;

	}

	/**
	 * 上传附件
	 */
	@RequestMapping(value = "/upload", method = { RequestMethod.POST })
	public @ResponseBody
	Object upload(HttpServletRequest httpServletRequest,
			@RequestParam(value = "file", required = false) MultipartFile file) {
		try {
			try {
				String realFileName = file.getOriginalFilename();
				if (!realFileName.endsWith(".json")) {
					return ResponseUtil.error("格式必须是.json");
				}
				if (file.getSize() > (6 * 1024 * 1024)) {
					return ResponseUtil.error("附件大小必须小于6M");
				}
				String contextPath = httpServletRequest.getSession()
						.getServletContext().getRealPath("/")
						+ importDataPath;
				String fileName = FileUtil.saveFileFromMultipartFile(file,
						contextPath);
				Map map = new HashMap();
				map.put("status", 1);
				map.put("path", fileName);
				return map;
			} catch (Exception e) {
				e.printStackTrace();
				return ResponseUtil.error("异常");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseUtil.error();
		}
	}
}
