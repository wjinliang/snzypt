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

import com.dm.app.datatopic.model.portaltopic.TjNcgdzctzqk;
import com.dm.app.datatopic.model.portaltopic.TjNlmyyzczfl;
import com.dm.app.datatopic.model.portaltopic.TjPjMyCyryCz;
import com.dm.app.datatopic.statistis.service.CommomService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
/**
 * 
 *                  
 * @date: 2017年3月7日
 * @Author: lyh
 * @FileName: TjPjMyCyryCzController.java
 * @Version: 1.0
 * @About: 10-6  平均每一从业人员创造农、林、牧、渔业产值(1990-2014年)
 *
 */
@Controller
@RequestMapping("portal/statistic")
public class TjPjMyCyryCzController {
	@Autowired
	private CmsSiteService siteService;
	@Autowired
	private CommomService commomService;
	@RequestMapping("ajax/tjpjmycyrycz")
	@ResponseBody
	public Map initStatisticPage(HttpServletRequest request){
		Map map = new HashMap<>();
		//年份
		List xAxis = new ArrayList<>();
		//农林牧渔页总产值
		List seriesNlmyyzcz=new ArrayList();
		//农业
		List seriesNy=new ArrayList();
		//林业
		List seriesLy=new ArrayList();
		//畜牧业
		List seriesXmy=new ArrayList();
		//渔业
		List seriesYy=new ArrayList();
		List list=commomService.findAll(TjPjMyCyryCz.class);
		for (int i=0;i<list.size();i++) {
			TjPjMyCyryCz   tjpjmycyrycz = (TjPjMyCyryCz) list.get(i);
			xAxis.add(tjpjmycyrycz.getTjnf());
			seriesNlmyyzcz.add(tjpjmycyrycz.getNlmyyzcz());
			seriesNy.add(tjpjmycyrycz.getNy());
			seriesLy.add(tjpjmycyrycz.getLy());
			seriesXmy.add(tjpjmycyrycz.getXmy());
			seriesYy.add(tjpjmycyrycz.getYy());
			}
		map.put("xAxisTjnf", xAxis);
		map.put("seriesNlmyyzcz", seriesNlmyyzcz);
		map.put("seriesNy", seriesNy);
		map.put("seriesLy", seriesLy);
		map.put("seriesXmy", seriesXmy);
		map.put("seriesYy", seriesYy);
		return map;
	}
	/**
	 * @description 10-6  平均每一从业人员创造农、林、牧、渔业产值(1990-2014年)
	 * @author lyh
	 * @date 2017年3月7日
	 * @param request
	 * @return
	 */
	@RequestMapping("inittjpjmycyrycz")
	public String tovillagebase(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_tjpjmycyrycz";
	}
	
}
