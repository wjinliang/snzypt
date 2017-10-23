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
import com.dm.app.datatopic.model.portaltopic.TjZzsc;
import com.dm.app.datatopic.statistis.service.CommomService;
import com.dm.app.datatopic.statistis.service.TjLyjgxgpscService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
/**
 * @description 林业及干鲜果品生产年鉴统计
 * @author huoge
 */
@Controller
@RequestMapping("portal/statistic")
public class TjLyjgxgpscController {
	@Autowired
	private CmsSiteService siteService;
	@Autowired
	private TjLyjgxgpscService tjLyjgxgpscService;
	@Autowired
	private CommomService commomService;
	/**
	 * @description 统计
	 * @author huoge
	 * @date 2017年3月1日
	 * @param request
	 * @return
	 */
	@RequestMapping("ajax/lyjgxgpsc")
	@ResponseBody
	public Map initStatisticLyjgxgpscPage(HttpServletRequest request){
		Map map = new HashMap<>();
		//项目(林业)
		List xAxis = new ArrayList<>();
		//2014产量(林业)
		List seriesSi=new ArrayList();
		//2013产量(林业)
		List seriesSan=new ArrayList();
		//2014占比(林业)
		List seriesZb=new ArrayList();
		//单位(林业)
		List seriesDw=new ArrayList();
		//项目(干鲜果)
		List xAxis1 = new ArrayList<>();
		//2014产量(干鲜果)
		List seriesSi1=new ArrayList();
		//2013产量(干鲜果)
		List seriesSan1=new ArrayList();
		//2014占比(干鲜果)
		List seriesZb1=new ArrayList();
		//单位(干鲜果)
		List seriesDw1=new ArrayList();
		List list=commomService.findListByProperty(TjLyjgxgpsc.class, "DW", "(公顷)");
		for (int i=0;i<list.size();i++) {
			TjLyjgxgpsc   tjlyjgxpgsc = (TjLyjgxgpsc) list.get(i);
				xAxis.add(tjlyjgxpgsc.getXm());
				seriesSi.add(tjlyjgxpgsc.getSi());
				seriesSan.add(tjlyjgxpgsc.getSan());
				seriesDw.add(tjlyjgxpgsc.getDw());
				seriesZb.add(tjlyjgxpgsc.getZb());
			}
		
		List list1=commomService.findListByProperty(TjLyjgxgpsc.class, "DW", "(吨)");
		for (int i=0;i<list.size();i++) {
			TjLyjgxgpsc   tjlyjgxpgsc = (TjLyjgxgpsc) list1.get(i);
				xAxis1.add(tjlyjgxpgsc.getXm());
				seriesSi1.add(tjlyjgxpgsc.getSi());
				seriesSan1.add(tjlyjgxpgsc.getSan());
				seriesDw1.add(tjlyjgxpgsc.getDw());
				seriesZb1.add(tjlyjgxpgsc.getZb());
			}
		map.put("xAxis", xAxis);
		map.put("seriesSi", seriesSi);
		map.put("seriesSan", seriesSan);
		map.put("seriesDw", seriesDw);
		map.put("seriesZb", seriesZb);
		
		map.put("xAxis1", xAxis1);
		map.put("seriesSi1", seriesSi1);
		map.put("seriesSan1", seriesSan1);
		map.put("seriesDw1", seriesDw1);
		map.put("seriesZb1", seriesZb1);
		return map;
	}
	/**
	 * @description 初始化林业及干鲜果品生产年鉴统计页面
	 * @author huoge
	 * @date 2017年3月1日
	 * @param request
	 * @return
	 */
	@RequestMapping("inittjlyjgxpgsc")
	public String tovillagebase(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_lyjgxgpsc";
	}
	
}
