package com.dm.app.datatopic.statistis.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.model.portaltopic.TjGdmj;
import com.dm.app.datatopic.model.portaltopic.TjLyjgxgpsc;
import com.dm.app.datatopic.statistis.service.TjGdmjService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;

@Controller
@RequestMapping("portal/statistic")
public class TjGdmjController {
	
	@Autowired
	private CmsSiteService siteService;
	
	@Autowired
	private TjGdmjService tjGdmjService;
	
	/**
	 * 统计2009-2013年之间的农用耕地面积
	 * @param request
	 * @return
	 */
	@RequestMapping("ajax/gdmj")
	@ResponseBody
	public Map initStatisticGdmjPage(HttpServletRequest request){
		Map map = new HashMap();
		//2009-2013年
		List xAxis = new ArrayList<>();
		//2009
		List elljYears=new ArrayList();
		//2010
		List elyjYears=new ArrayList();
		//2011
		List elyyYears=new ArrayList();
		//2012
		List elyeYears=new ArrayList();
		//2013
		List elysYears=new ArrayList();
		List list=tjGdmjService.findAll(TjGdmj.class);
		for (int i=0;i<list.size();i++) {
			TjGdmj   tjGdmj = (TjGdmj) list.get(i);
			xAxis.add(tjGdmj.getXm());
			elljYears.add(tjGdmj.getEllj());
			elyjYears.add(tjGdmj.getElyj());
			elyyYears.add(tjGdmj.getElyy());
			elyeYears.add(tjGdmj.getElye());
			elysYears.add(tjGdmj.getElys());
			}
		map.put("xAxis", xAxis);
		map.put("elljYears", elljYears);
		map.put("elyjYears", elyjYears);
		map.put("elyyYears", elyyYears);
		map.put("elyeYears", elyeYears);
		map.put("elysYears", elysYears);
		return map;
	}
	
    /**
     * 进入农用耕地面积的首页
     * @param request
     * @return
     */
	@RequestMapping("inittjgdmj")
	public String tovillagebase(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_gdmjtj";
	}

}
