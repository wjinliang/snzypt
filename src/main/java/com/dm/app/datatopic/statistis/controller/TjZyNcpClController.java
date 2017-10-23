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

import com.dm.app.datatopic.model.portaltopic.TjZyncpcl;
import com.dm.app.datatopic.model.portaltopic.TjZynzwbzmjJcl;
import com.dm.app.datatopic.statistis.service.CommomService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;

/**
 * 
 *                  
 * @date: 2017年3月1日
 * @Author: lyh
 * @FileName: TjZyNcpClController.java
 * @Version: 1.0
 * @About: 10-5  主要农业产品产量(1978-2014年)单位：万吨
 *
 */
@Controller
@RequestMapping("portal/statistic")
public class TjZyNcpClController {
	@Autowired
	private CmsSiteService siteService;
	@Autowired
	private CommomService commonService;
	/**
	 * 
	 * @date: 2017年3月1日
	 * @Author: lyh
	 * @param request
	 * @return10-5  主要农业产品产量(1978-2014年) 单位：万吨
	 */
	@RequestMapping("ajax/zyncp")
	@ResponseBody
	public Map zyncpCountPage(HttpServletRequest request){
		Map map = new HashMap<>();
		//年份
		List xAxis = new ArrayList<>();
		//粮  食
		List seriesLs=new ArrayList();
		//油  料
		List seriesYl=new ArrayList();	
		//蔬菜及食用菌
		List seriesSc=new ArrayList();
		
		//干鲜果品
		List seriesGxgp=new ArrayList();
		//牛  奶
		List seriesNn=new ArrayList();	
		//肉  类
		List seriesRou=new ArrayList();
		//猪牛羊肉
		List seriesZuyr=new ArrayList();
		//禽蛋产量
		List seriesQindan=new ArrayList();
		//水产品
		List seriesShuic=new ArrayList();
		List list = commonService.findAll(TjZyncpcl.class);
		for (int i=0; i<list.size();i++) {
			TjZyncpcl tjZyncpcl = (TjZyncpcl) list.get(i);
			xAxis.add(tjZyncpcl.getTjnf());
			seriesLs.add(tjZyncpcl.getLs());
			seriesYl.add(tjZyncpcl.getYl());
			seriesSc.add(tjZyncpcl.getScjsyj());
			seriesGxgp.add(tjZyncpcl.getGxgp());
			seriesNn.add(tjZyncpcl.getNn());
			seriesRou.add(tjZyncpcl.getRl());
			seriesZuyr.add(tjZyncpcl.getZryr());
			seriesQindan.add(tjZyncpcl.getQdcl());
			seriesShuic.add(tjZyncpcl.getScp());
			
		}
		map.put("xAxis", xAxis);
		map.put("seriesLs", seriesLs);
		map.put("seriesYl", seriesYl);
		map.put("seriesSc", seriesSc);
		map.put("seriesGxgp", seriesGxgp);
		map.put("seriesNn", seriesNn);
		map.put("seriesRou", seriesRou);
		map.put("seriesZuyr", seriesZuyr);
		map.put("seriesQindan", seriesQindan);
		map.put("seriesShuic", seriesShuic);
		
		return map;
	}
	/**
	 * @description 
	 * @author lyh
	 * @date 2017年2月28日
	 * @return
    */
	@RequestMapping("initzyncptj")
	public String tovillagebase(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_zyncp";
		
	}
	
	
	
	

}
