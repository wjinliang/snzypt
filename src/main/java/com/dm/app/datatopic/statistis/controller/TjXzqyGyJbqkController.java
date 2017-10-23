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
import com.dm.app.datatopic.model.portaltopic.TjXzqyGyJbqk;
import com.dm.app.datatopic.statistis.service.CommomService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;

/**
 * 
 *                  
 * @date: 2017年3月1日
 * @Author: lyh
 * @FileName: TjXzqyGyJbqkController.java
 * @Version: 1.0
 * @About:   10-20  乡镇企业各业基本情况(2014年)
 *
 */
@Controller
@RequestMapping("portal/statistic")
public class TjXzqyGyJbqkController {
	@Autowired
	private CmsSiteService siteService;
	@Autowired
	private CommomService commonService;
	/**
	 * 
	 * @date: 2017年3月1日
	 * @Author: lyh
	 * @param request
	 * @return10-5 10-20  乡镇企业各业基本情况(2014年)
	 */
	@RequestMapping("ajax/xzqy")
	@ResponseBody
	public Map xzqyCountPage(HttpServletRequest request){
		Map map = new HashMap<>();
		//项目
		List xAxis = new ArrayList<>();
		//企业个数(个)
		List seriesQy=new ArrayList();
		//从业人员(人)
		List seriesRy=new ArrayList();	
		//总收入(万元)
		List seriesSr=new ArrayList();
		
		//利润总额(万元)
		List seriesLr=new ArrayList();

		List list = commonService.findAll(TjXzqyGyJbqk.class);
		for (int i=0; i<list.size();i++) {
			TjXzqyGyJbqk tjXzqyGyJbqk = (TjXzqyGyJbqk) list.get(i);
			xAxis.add(tjXzqyGyJbqk.getXm());
			seriesQy.add(tjXzqyGyJbqk.getSlQygs());
			seriesRy.add(tjXzqyGyJbqk.getSlCygs());
			seriesSr.add(tjXzqyGyJbqk.getSlZsr());
			seriesLr.add(tjXzqyGyJbqk.getSlLrze());
			
			
		}
		map.put("xAxis", xAxis);
		map.put("seriesQy", seriesQy);
		map.put("seriesRy", seriesRy);
		map.put("seriesSr", seriesSr);
		map.put("seriesLr", seriesLr);
		
	
		
		return map;
	}
	/**
	 * @description 
	 * @author lyh
	 * @date 2017年2月28日
	 * @return
    */
	@RequestMapping("initxzqy")
	public String toxzqybase(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_xzqy";
		
	}
	
	
	
	

}
