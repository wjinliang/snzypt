package com.dm.app.datatopic.cunqing.nongyongjx.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.cunqing.nongyongjx.service.NongYongJxService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
import com.dm.platform.util.ResponseUtil;

@Controller
@RequestMapping("portal/nyjx")
public class NongYongJxController {
	@Autowired
	private CmsSiteService siteService;
	@Autowired
	private NongYongJxService nongYongJxService;
	@RequestMapping("ajax/nyjxcount")
	@ResponseBody
	public Object findAllCounty(HttpServletRequest request){
		Map map = new HashMap<>();
		List list = new ArrayList<>();
		list.add("大型拖拉机数量");
		list.add("小型拖拉机数量");
		list.add("大中型拖拉配套机具");
		list.add("小型拖拉机拉配套机");
		list.add("排灌柴油机数量");
		List jiXieNums = nongYongJxService.getJiXieNums();
		map.put("xAxis", list);
		map.put("jiXieNums", jiXieNums);
		
		
		return map;
	} 
	@RequestMapping("initNyjxCountPage")
	public String initItemCountPage(HttpServletRequest request){
	CmsSite site = this.siteService.findOneById(1); 
	request.setAttribute("site", site);
	request.setAttribute("own", 2);
	return "template/sn_topic_statistic_tjnyjx";
}
	
	
	

}
