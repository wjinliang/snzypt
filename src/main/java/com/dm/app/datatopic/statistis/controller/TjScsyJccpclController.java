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
import com.dm.app.datatopic.model.portaltopic.TjScsyJccpcl;
import com.dm.app.datatopic.model.portaltopic.TjXzqyCkgkqk;
import com.dm.app.datatopic.model.portaltopic.TjZzsc;
import com.dm.app.datatopic.statistis.service.CommomService;
import com.dm.app.datatopic.statistis.service.TjLyjgxgpscService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
/**
 * @description 10-13  牲畜饲养及畜产品产量
 * @author lyh
 */
@Controller
@RequestMapping("portal/statistic")
public class TjScsyJccpclController {
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
	@RequestMapping("ajax/scsyJccpcltj")
	@ResponseBody
	public Map initStatisticLyjgxgpscPage(HttpServletRequest request){
		Map map = new HashMap<>();
		List xAxis = new ArrayList<>();
		//2014收入
		List seriesSi=new ArrayList();
		//2013收入
		List seriesSan=new ArrayList();
		//2014年为2013年%
		List serisZb = new ArrayList<>();
		List xAxis1 = new ArrayList<>();
		//2014收入
		List seriesSi1=new ArrayList();
		//2013收入
		List seriesSan1=new ArrayList();
		//2014年为2013年%
		List serisZb1 = new ArrayList<>();
		List seriesDw = new ArrayList<>();
		//饲养数量
		List list0=commonService.findListByProperty(TjScsyJccpcl.class, "DW", "(万头)");
		List list2=commonService.findListByProperty(TjScsyJccpcl.class, "DW", "(万只)");
		List listall=new ArrayList<>();
		listall.addAll(list0);
		listall.addAll(list2);
		for (int i=0;i<listall.size();i++) {
			TjScsyJccpcl   tjScsyJccpcl = (TjScsyJccpcl) listall.get(i);
				xAxis.add(tjScsyJccpcl.getXm());
				seriesSi.add(tjScsyJccpcl.getSi());
				seriesSan.add(tjScsyJccpcl.getSan());
				//seriesDw.add(tjScsyJccpcl.getDw());
				serisZb.add(tjScsyJccpcl.getZb());
			}
		//产量
		List list1=commonService.findListByProperty(TjScsyJccpcl.class, "DW", "(万吨)");
		for (int i=0;i<list1.size();i++) {
			TjScsyJccpcl   tjScsyJccpcl = (TjScsyJccpcl) list1.get(i);
				xAxis1.add(tjScsyJccpcl.getXm());
				seriesSi1.add(tjScsyJccpcl.getSi());
				seriesSan1.add(tjScsyJccpcl.getSan());
				seriesDw.add(tjScsyJccpcl.getDw());
				serisZb1.add(tjScsyJccpcl.getZb());
			}
		map.put("xAxis", xAxis);
		map.put("seriesSi", seriesSi);
		map.put("seriesSan", seriesSan);
		map.put("serisZb", serisZb);
		
		map.put("xAxis1", xAxis1);
		map.put("seriesSi1", seriesSi1);
		map.put("seriesSan1", seriesSan1);
		map.put("seriesDw", seriesDw);
		map.put("serisZb1", serisZb1);
		return map;
	}
	/**
	 * @description  10-13  牲畜饲养及畜产品产量
	 * @author lyh
	 * @date 2017年3月1日
	 * @param request
	 * @return
	 */
	@RequestMapping("initscsyJccpcltj")
	public String tovillagebase(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_scsyJccpcltj";
	}
	
}
