package com.dm.app.datatopic.cunqing.guanchadian.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.cunqing.guanchadian.service.CunZhuangGuanChaDianService;
import com.dm.app.datatopic.cunqing.guanchadian.service.NongHuGuanChaDianService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;

@Controller
@RequestMapping("portal")
public class GuanChaDianController {
	@Autowired
	private CmsSiteService siteService;
	@Autowired
	private NongHuGuanChaDianService nhGuanChaDianService;
	@Autowired
	private CunZhuangGuanChaDianService cZGuanChaDianService;
	@RequestMapping("ajax/czguanchadian")
	@ResponseBody
	public Map findCunZhuangGuanChaDianCountUnderQX(HttpServletRequest request){
		List<Map> list = cZGuanChaDianService.getGuanChaDianCountUnderQx();
		Map maps=  new HashMap<>();
		List xAxis= new ArrayList<>();
		List counts = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			Map map = list.get(i);
			String quxian = (String) map.get("quxian");
			xAxis.add(quxian);
			counts.add(map.get("count"));
		}
		maps.put("xAxis", xAxis);
		maps.put("counts", counts);
		return maps;
		
	}
	
	
	@RequestMapping("ajax/nhguanchadian")
	@ResponseBody
	public Map findCunZhuangGuanChaDianCountUnderNh(HttpServletRequest request){
		List<Map> list = nhGuanChaDianService.getGuanChaDianCountUnderNh();
		Map mapsNh=  new HashMap<>();
		List xAxis= new ArrayList<>();
		List counts = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			Map map = list.get(i);
			String quxian = (String) map.get("qx");
			xAxis.add(quxian);
			counts.add(map.get("count"));
		}
		mapsNh.put("xAxis", xAxis);
		mapsNh.put("counts", counts);
		return mapsNh;
		
	}
	/**
	 * @description 
	 * @author lyh
	 * @date 2017年2月28日
	 * @return
    */
	@RequestMapping("initgcd")
	public String toxzqybase(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_gcd";
		
	}

}
