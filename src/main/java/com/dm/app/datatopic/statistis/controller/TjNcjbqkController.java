package com.dm.app.datatopic.statistis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.model.portaltopic.TjNcjbqk;
import com.dm.app.datatopic.statistis.service.TjNcjbqkService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;

/**
 * @description 农村基本信息专题统计
 * @author huoge
 */
@Controller
@RequestMapping("portal/statistic")
public class TjNcjbqkController {
	@Autowired
	private TjNcjbqkService tjncjbqkService;
	@Autowired
	private CmsSiteService siteService;
	/**
	 * @description 初始化并跳转到统计页面
	 * @author huoge
	 * @date 2017年2月19日
	 * @param request
	 * @return
	 */
	@RequestMapping("ajax/villagebase")
	@ResponseBody
	public Map initStatisticVillagePage(HttpServletRequest request){
		StringBuilder xAxis=new StringBuilder("[");
		StringBuilder seriesXZF=new StringBuilder("[");
		StringBuilder seriesZZF=new StringBuilder("[");
		StringBuilder seriesCMWYH=new StringBuilder("[");
		StringBuilder seriesCZHS=new StringBuilder("[");
		StringBuilder seriesCZRK=new StringBuilder("[");
		StringBuilder seriesCYRY=new StringBuilder("[");
		List list=tjncjbqkService.findAll(TjNcjbqk.class);
		for(int i=0;i<list.size();i++){
			TjNcjbqk TjNcjbqk=(TjNcjbqk)list.get(i);
			if(i==list.size()-1){
				xAxis.append(TjNcjbqk.getTjnf());
				seriesXZF.append(TjNcjbqk.getXzf());
				seriesZZF.append(TjNcjbqk.getZzf());
				seriesCMWYH.append(TjNcjbqk.getCmwyh()); 
				seriesCZHS.append(TjNcjbqk.getXzjxzcczhs()); 
				seriesCZRK.append(TjNcjbqk.getXzjxzcczrk()); 
				seriesCYRY.append(TjNcjbqk.getXzjxzccyry());
			}else{
			xAxis.append(TjNcjbqk.getTjnf()+",");
			seriesXZF.append(TjNcjbqk.getXzf()+",");
			seriesZZF.append(TjNcjbqk.getZzf()+",");
			seriesCMWYH.append(TjNcjbqk.getCmwyh()+","); 
			seriesCZHS.append(TjNcjbqk.getXzjxzcczhs()+","); 
			seriesCZRK.append(TjNcjbqk.getXzjxzcczrk()+","); 
			seriesCYRY.append(TjNcjbqk.getXzjxzccyry()+",");
			}
		}
		xAxis.append("]");
		seriesXZF.append("]");
		seriesZZF.append("]");
		seriesCMWYH.append("]"); 
		seriesCZHS.append("]"); 
		seriesCZRK.append("]"); 
		seriesCYRY.append("]");
		Map map=new HashMap<>();
		map.put("tjnfList", xAxis);
		map.put("xzfList", seriesXZF);
		map.put("zzfList", seriesZZF);
		map.put("cmwyhList",seriesCMWYH);
		map.put("xzjxzxxzhsList",seriesCZHS);
		map.put("xzjxzcczrkList", seriesCZRK);
		map.put("xzjxzccyryList",seriesCYRY);
		return map;
	}
	/**
	 * @description 
	 * @author huoge
	 * @date 2017年2月28日
	 * @return
	 */
	@RequestMapping("initvillagebase")
	public String tovillagebase(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_villagebase";
		
	}
	
	

}
