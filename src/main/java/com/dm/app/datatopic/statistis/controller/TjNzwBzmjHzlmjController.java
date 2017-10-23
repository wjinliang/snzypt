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
import com.dm.app.datatopic.model.portaltopic.TjNzwBzmjHzlmj;
import com.dm.app.datatopic.model.portaltopic.TjPjMyCyryCz;
import com.dm.app.datatopic.statistis.service.CommomService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
/**
 * 
 *                  
 * @date: 2017年3月7日
 * @Author: lyh
 * @FileName: TjNzwBzmjHzlmjController.java
 * @Version: 1.0
 * @About: 10-3  农作物播种面积和造林面积(1978-2014年)
 *
 */
@Controller
@RequestMapping("portal/statistic")
public class TjNzwBzmjHzlmjController {
	@Autowired
	private CmsSiteService siteService;
	@Autowired
	private CommomService commomService;
	@RequestMapping("ajax/tjnzwbzmjhzlmj")
	@ResponseBody
	public Map initStatisticPage(HttpServletRequest request){
		Map map = new HashMap<>();
		//年份
		List xAxis = new ArrayList<>();
		//农 作 物播种面积(万公顷)
		List seriesNzwbzmj=new ArrayList();
		//粮  食作物
		List seriesLszw=new ArrayList();
		//玉 米
		List seriesYm=new ArrayList();
		//小 麦
		List seriesXm=new ArrayList();
		//油 料
		List seriesYl=new ArrayList();
		//蔬菜及食用菌
		List seriesScjsyj=new ArrayList();
		//瓜类及草  莓
		List seriesGljcm=new ArrayList();
		//饲 料
		List seriesSl=new ArrayList();
		//造林面积(万公顷)
		List seriesZlmj=new ArrayList();
		List list=commomService.findAll(TjNzwBzmjHzlmj.class);
		for (int i=0;i<list.size();i++) {
			TjNzwBzmjHzlmj   tjNzwBzmjHzlmj = (TjNzwBzmjHzlmj) list.get(i);
			xAxis.add(tjNzwBzmjHzlmj.getTjnf());
			seriesNzwbzmj.add(tjNzwBzmjHzlmj.getNzwbzmj());
			seriesLszw.add(tjNzwBzmjHzlmj.getLszw());
			seriesYm.add(tjNzwBzmjHzlmj.getYm());
			seriesXm.add(tjNzwBzmjHzlmj.getXm());
			seriesYl.add(tjNzwBzmjHzlmj.getYl());
			seriesScjsyj.add(tjNzwBzmjHzlmj.getScjsyj());
			seriesGljcm.add(tjNzwBzmjHzlmj.getGljcm());
			seriesSl.add(tjNzwBzmjHzlmj.getSl());
			seriesZlmj.add(tjNzwBzmjHzlmj.getZlmj());
			}
		map.put("xAxisTjnf", xAxis);
		map.put("seriesNzwbzmj", seriesNzwbzmj);
		map.put("seriesLszw", seriesLszw);
		map.put("seriesYm", seriesYm);
		map.put("seriesXm", seriesXm);
		map.put("seriesYl", seriesYl);
		
		map.put("seriesScjsyj", seriesScjsyj);
		map.put("seriesGljcm", seriesGljcm);
		map.put("seriesSl", seriesSl);
		map.put("seriesZlmj", seriesZlmj);
		return map;
	}
	/**
	 * @description 10-3  农作物播种面积和造林面积(1978-2014年)
	 * @author lyh
	 * @date 2017年3月7日
	 * @param request
	 * @return
	 */
	@RequestMapping("inittjnzwbzmjhzlmjz")
	public String tovillagebase(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_tjnzwbzmjhzlmjz";
	}
	
}
