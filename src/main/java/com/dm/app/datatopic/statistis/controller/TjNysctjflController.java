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
import com.dm.app.datatopic.model.portaltopic.TjNysctjfl;
import com.dm.app.datatopic.model.portaltopic.TjPjMyCyryCz;
import com.dm.app.datatopic.statistis.service.CommomService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
/**
 * 
 *                  
 * @date: 2017年3月7日
 * @Author: lyh
 * @FileName: TjNysctjflController.java
 * @Version: 1.0
 * @About:10-2  农业生产条件(1978-2014年)
 *
 */
@Controller
@RequestMapping("portal/statistic")
public class TjNysctjflController {
	@Autowired
	private CmsSiteService siteService;
	@Autowired
	private CommomService commomService;
	@RequestMapping("ajax/tjnysctjfl")
	@ResponseBody
	public Map initStatisticPage(HttpServletRequest request){
		Map map = new HashMap<>();
		//年份
		List xAxis = new ArrayList<>();
		//年末实有耕地面积(万公顷)
		List seriesNmsygdmj=new ArrayList();
		//有  效灌溉面积(千公顷)
		List seriesYxggmj=new ArrayList();
		//农业机械总 动 力(万千瓦)
		List seriesNyjxzdl=new ArrayList();
		//农  村用电量(万千瓦小时)
		List seriesNcydl=new ArrayList();
		//化  肥施用量(万吨)
		List seriesHfsyl=new ArrayList();
		List list=commomService.findAll(TjNysctjfl.class);
		for (int i=0;i<list.size();i++){
			TjNysctjfl   tjNysctjfl = (TjNysctjfl) list.get(i);
			xAxis.add(tjNysctjfl.getTjnf());
			seriesNmsygdmj.add(tjNysctjfl.getNmsygdmj());
			seriesYxggmj.add(tjNysctjfl.getYxggmj());
			seriesNyjxzdl.add(tjNysctjfl.getYxggmj());
			seriesNcydl.add(tjNysctjfl.getNcydl());
			seriesHfsyl.add(tjNysctjfl.getHfsyl());
			}
		map.put("xAxis", xAxis);
		map.put("seriesNmsygdmj", seriesNmsygdmj);
		map.put("seriesYxggmj", seriesYxggmj);
		map.put("seriesNyjxzdl", seriesNyjxzdl);
		map.put("seriesNcydl", seriesNcydl);
		map.put("seriesHfsyl", seriesHfsyl);
		return map;
	}
	/**
	 * @description农业生产条件(1978-2014年)
	 * @author lyh
	 * @date 2017年3月7日
	 * @param request
	 * @return
	 */
	@RequestMapping("inittjnysctjfl")
	public String tovillagebase(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_tjnysctjfl";
	}
	
}
