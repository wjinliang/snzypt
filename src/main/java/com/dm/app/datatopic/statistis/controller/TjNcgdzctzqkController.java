package com.dm.app.datatopic.statistis.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * @description  农村固定资产投资情况(2014年)统计年鉴
 * @author huoge
 */
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.model.portaltopic.TjLyjgxgpsc;
import com.dm.app.datatopic.model.portaltopic.TjNcgdzctzqk;
import com.dm.app.datatopic.statistis.service.CommomService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
@Controller
@RequestMapping("portal/statistic")
public class TjNcgdzctzqkController {
	@Autowired
	private CmsSiteService siteService;
	@Autowired
	private CommomService commomService;
	
	/**
	 * @description 统计
	 * @author huoge
	 * @date 2017年3月1日
	 * @param request
	 * @return
	 */
	@RequestMapping("ajax/ncgdzctzqk")
	@ResponseBody
	public Map initStatisticNcgdzctzqkPage(HttpServletRequest request){
		Map map = new HashMap<>();
		
		List xAxis = new ArrayList<>();
		//2014产量
		List seriesHj=new ArrayList();
		//2013产量
		List seriesFny=new ArrayList();
		//2014收入
		List seriesNy=new ArrayList();
		//2013收入
		List seriesclsanSr=new ArrayList();
		List list=commomService.findAll(TjNcgdzctzqk.class);
		for (int i=0;i<list.size();i++) {
			TjNcgdzctzqk   tjncgdzctzqk = (TjNcgdzctzqk) list.get(i);
				xAxis.add(tjncgdzctzqk.getXm());
				seriesHj.add(tjncgdzctzqk.getHj());
				seriesFny.add(tjncgdzctzqk.getFny());
				seriesNy.add(tjncgdzctzqk.getNy());
			}
		map.put("xAxis", xAxis);
		map.put("seriesHj", seriesHj);
		map.put("seriesFny", seriesFny);
		map.put("seriesNy", seriesNy);
		return map;
	}
	/**
	 * @description 初始化农村固定资产投资情况(2014年年鉴统计页面
	 * @author huoge
	 * @date 2017年3月1日
	 * @param request
	 * @return
	 */
	@RequestMapping("inittjncgdzctzqk")
	public String tovillagebase(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_ncgdzctzqk";
	}
	
}
