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

import com.dm.app.datatopic.model.portaltopic.TjMsly;
import com.dm.app.datatopic.model.portaltopic.TjNcjjsryfp;
import com.dm.app.datatopic.statistis.service.CommomService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
/**
 * @description 10-21    民俗旅游
 * @author huoge
 */
@Controller
@RequestMapping("portal/statistic")
public class TjMslyController {
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
	@RequestMapping("ajax/tjmsly")
	@ResponseBody
	public Map initStatisticLyjgxgpscPage(HttpServletRequest request){
		Map map = new HashMap<>();
		//项目名称
		List xAxis = new ArrayList<>();
		//2014收入
		List seriesSi=new ArrayList();
		//2013收入
		List seriesSan=new ArrayList();
		//2014年为2013年%
		List serisZb = new ArrayList<>();
		List seriesDw = new ArrayList<>();
		List list=commonService.findAll(TjMsly.class);
		for (int i=0;i<list.size();i++) {
			TjMsly   tjmsly = (TjMsly) list.get(i);
				xAxis.add(tjmsly.getXm());
				seriesSi.add(tjmsly.getSi());
				seriesSan.add(tjmsly.getSan());
				seriesDw.add(tjmsly.getDw());
				serisZb.add(tjmsly.getZb());
			}
		map.put("xAxis", xAxis);
		map.put("seriesSi", seriesSi);
		map.put("seriesSan", seriesSan);
		map.put("seriesDw", seriesDw);
		map.put("serisZb", serisZb);
		return map;
	}
	/**
	 * @description  10-21    民俗旅游
	 * @author huoge
	 * @date 2017年3月7日
	 * @param request
	 * @return
	 */
	@RequestMapping("inittjmsly")
	public String tovillagebase(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_tjmsly";
	}
	
}

