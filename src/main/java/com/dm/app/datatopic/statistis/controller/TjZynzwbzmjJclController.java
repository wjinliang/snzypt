package com.dm.app.datatopic.statistis.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.model.portaltopic.TjZynzwbzmjJcl;
import com.dm.app.datatopic.statistis.service.TjZynzwbzmjJclService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
/**
 * 
 *                  
 * @date: 2017年3月1日
 * @Author: lyh
 * @FileName: TjZynzwbzmjJclController.java
 * @Version: 1.0
 * @About: 10-11  主要农作物播种面积及产量控制层编码 
 *
 */
@Controller
@RequestMapping("portal/statistic")
public class TjZynzwbzmjJclController {
	@Autowired
	private TjZynzwbzmjJclService mjcl;
	@Autowired
	private CmsSiteService siteService;
	/**
	 * @description 初始化并跳转到统计页面:农作物面积产量
	 * @author lyh
	 * @date 2017年2月19日
	 * @param request
	 * @return
	 */
	@RequestMapping("ajax/mjcl")
	@ResponseBody
	public Map mjclCountPage(HttpServletRequest request){
		Map map = new HashMap<>();
		//项目名称
		List xAxis = new ArrayList<>();
		//2014播种面积(公顷)
		List seriesmjSi=new ArrayList();
		//2014单产(公斤／公顷)
		List seriesdcSi=new ArrayList();	
		//2014总 产 量
		List serieszcSi=new ArrayList();
		
		//2013播种面积(公顷)
		List seriesmjsan=new ArrayList();
		//2013单产(公斤／公顷)
		List seriesdcsan=new ArrayList();	
		//2013总 产 量
		List serieszcsan=new ArrayList();
		List list = mjcl.findAll(TjZynzwbzmjJcl.class);
		for (int i=0; i<list.size();i++) {
			TjZynzwbzmjJcl mjcl = (TjZynzwbzmjJcl) list.get(i);
			xAxis.add(mjcl.getXm());
			seriesmjSi.add(mjcl.getBzmjSi());
			seriesdcSi.add(mjcl.getDcSi());
			serieszcSi.add(mjcl.getZclSi());
			
			seriesmjsan.add(mjcl.getBzmjSan());
			seriesdcsan.add(mjcl.getDcSan());
			serieszcsan.add(mjcl.getZclSan());
			
		}
		map.put("xAxis", xAxis);
		
		map.put("seriesmjSi", seriesmjSi);
		map.put("seriesdcSi", seriesdcSi);
		map.put("serieszcSi", serieszcSi);
		
		map.put("seriesmjsan", seriesmjsan);
		map.put("seriesdcsan", seriesdcsan);
		map.put("serieszcsan", serieszcsan);
		
		
		return map;
	}
	/**
	 * @description 
	 * @author huoge
	 * @date 2017年2月28日
	 * @return
	 */
	@RequestMapping("initmjclbase")
	public String tovillagebase(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_mjcl";
		
	}
	

}
