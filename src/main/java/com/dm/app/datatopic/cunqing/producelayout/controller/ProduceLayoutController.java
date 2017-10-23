package com.dm.app.datatopic.cunqing.producelayout.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.cunqing.plantproduction.service.PlantProductService;
import com.dm.app.datatopic.cunqing.producelayout.service.ProduceLayout;
import com.dm.app.datatopic.model.MpJbxx;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;


@Controller
@RequestMapping("portal")
public class ProduceLayoutController {
	@Autowired
	ProduceLayout producelayout;//生产布局统计
	@Autowired
	CmsSiteService siteService;
	@RequestMapping("ajax/producestatistics")
	@ResponseBody
	public List<Map<String,String>> getData(){
		List<Map<String,String>> list=producelayout.getData();
		return list;
	}
	@RequestMapping("ajax/plantstatistics")
	@ResponseBody
	public List<Map<String,String>> getPlantData(){
		List<Map<String,String>> list=producelayout.getPlantData();
		return list;
	}
	@RequestMapping("statistics")
	public String initVillageCountPage(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_producestatistics";
	}
}
