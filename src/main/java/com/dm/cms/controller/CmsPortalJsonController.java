package com.dm.cms.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.cms.model.CmsContent;
import com.dm.cms.service.CmsContentService;
import com.dm.platform.util.PageConvertUtil;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/portal/json")
public class CmsPortalJsonController {
	@Autowired
	private CmsContentService contentService;
	
	@RequestMapping("contentList")
	@ResponseBody
	public Map contentList(
			@RequestParam(defaultValue="1",required=false,value="pageNum")
			Integer pageNum,
			@RequestParam(defaultValue="12",required=false,value="pageSize")
			Integer pageSize,
			CmsContent cmsContent){
	String orderby = "publish_date desc";
	Map map = new HashMap();
	map.put("sort", orderby);
	cmsContent.setIsHtml(true);
	cmsContent.setIsDelete(false);
	map.put("model", cmsContent);
	PageInfo<CmsContent> page= contentService.findCmsContentByPage(pageNum, pageSize, map);
		return PageConvertUtil.grid(page);
	}
	
}
