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

import com.dm.app.datatopic.model.portaltopic.TjLyjgxgpsc;
import com.dm.app.datatopic.model.portaltopic.TjScpSc;
import com.dm.app.datatopic.model.portaltopic.TjScsyJccpcl;
import com.dm.app.datatopic.model.portaltopic.TjXzqyCkgkqk;
import com.dm.app.datatopic.model.portaltopic.TjZzsc;
import com.dm.app.datatopic.statistis.service.CommomService;
import com.dm.app.datatopic.statistis.service.TjLyjgxgpscService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
/**
 * @description 10-14  水产品生产
 * @author lyh
 */
@Controller
@RequestMapping("portal/statistic")
public class TjScpScController {
	@Autowired
	private CmsSiteService siteService;
	@Autowired
	private CommomService commonService;
	/**
	 * @description 统计
	 * @author lyh
	 * @date 2017年3月1日
	 * @param request
	 * @return
	 */
	@RequestMapping("ajax/scpsctj")
	@ResponseBody
	public Map initStatisticLyjgxgpscPage(HttpServletRequest request){
		Map map = new HashMap<>();
		//(公顷) 
		List xAxis = new ArrayList<>();
		//2014收入(公顷) 
		List seriesSi=new ArrayList();
		//2013收入(公顷) 
		List seriesSan=new ArrayList();
		//2014年为2013年%(公顷) 
		List serisZb = new ArrayList<>();
		//单位(公顷) 
		List serisDw = new ArrayList<>();
		
		//(吨) 
		List xAxis1 = new ArrayList<>();
		//2014收入(吨) 
		List seriesSi1=new ArrayList();
		//2013收入(吨) 
		List seriesSan1=new ArrayList();
		//2014年为2013年%(吨) 
		List serisZb1 = new ArrayList<>();
		//单位(吨) 
		List serisDw1 = new ArrayList<>();
		List list=commonService.findListByProperty(TjScpSc.class, "DW", "(公顷)");
		for (int i=0;i<list.size();i++) {
			TjScpSc   tjScpSc = (TjScpSc) list.get(i);
				xAxis.add(tjScpSc.getXm());
				serisDw.add(tjScpSc.getDw());
				seriesSi.add(tjScpSc.getSi());
				seriesSan.add(tjScpSc.getSan());
				serisZb.add(tjScpSc.getZb());
			}
		List list1=commonService.findListByProperty(TjScpSc.class, "DW", "(吨)");
		for (int i=0;i<list1.size();i++) {
			TjScpSc   tjScpSc = (TjScpSc) list1.get(i);
				xAxis1.add(tjScpSc.getXm());
				serisDw1.add(tjScpSc.getDw());
				seriesSi1.add(tjScpSc.getSi());
				seriesSan1.add(tjScpSc.getSan());
				serisZb1.add(tjScpSc.getZb());
			}
		map.put("xAxis", xAxis);
		map.put("seriesSi", seriesSi);
		map.put("seriesSan", seriesSan);
		map.put("serisDw", serisDw);
		map.put("serisZb", serisZb);
		
		map.put("xAxis1", xAxis1);
		map.put("seriesSi1", seriesSi1);
		map.put("seriesSan1", seriesSan1);
		map.put("serisDw1", serisDw1);
		map.put("serisZb1", serisZb1);
		return map;
	}
	/**
	 * @description  乡镇企业出口供货情况
	 * @author lyh
	 * @date 2017年3月1日
	 * @param request
	 * @return
	 */
	@RequestMapping("initscpsctj")
	public String tovillagebase(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_scpsctj";
	}
	
}
