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
import com.dm.app.datatopic.statistis.service.CommomService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;

@Controller
@RequestMapping("portal/statistic")
public class TjNlmyyzczflController {
	@Autowired
	private CmsSiteService siteService;
	@Autowired
	private CommomService commomService;
	/**
	 * @description 农林牧渔业总产值(1978-2014年)
	 * @author huoge
	 * @date 2017年3月1日
	 * @param request
	 * @return
	 */
	@RequestMapping("ajax/tjnlmyyzczfl")
	@ResponseBody
	public Map initStatisticNcgdzctzqkPage(HttpServletRequest request){
		Map map = new HashMap<>();
		//年份
		List xAxisTjnf = new ArrayList<>();
		//农林牧渔页总产值
		List seriesNlmyyzcz=new ArrayList();
		//农业
		List seriesNl=new ArrayList();
		//林业
		List seriesLy=new ArrayList();
		//牧业
		List seriesMy=new ArrayList();
		//渔业
		List seriesYy=new ArrayList();
		//农林牧渔服务业
		List seriesNlmyfwy=new ArrayList();
		//按现价计算
		List seriesAxjjs=new ArrayList();
		//按可比价计算
		List seriesAkbjjs=new ArrayList();
		List list=commomService.findAll(TjNlmyyzczfl.class);
		for (int i=0;i<list.size();i++) {
			TjNlmyyzczfl   tjncgdzctzqk = (TjNlmyyzczfl) list.get(i);
			xAxisTjnf.add(tjncgdzctzqk.getTjnf());
			seriesNlmyyzcz.add(tjncgdzctzqk.getNlmyyzzc());
			seriesNl.add(tjncgdzctzqk.getNl());
			seriesLy.add(tjncgdzctzqk.getLy());
			seriesMy.add(tjncgdzctzqk.getMy());
			seriesYy.add(tjncgdzctzqk.getYy());
			seriesNlmyfwy.add(tjncgdzctzqk.getNlmyfwy());
			seriesAxjjs.add(tjncgdzctzqk.getAxjjs());
			seriesAkbjjs.add(tjncgdzctzqk.getAkbjjs());
			}
		map.put("xAxisTjnf", xAxisTjnf);
		map.put("seriesNlmyyzcz", seriesNlmyyzcz);
		map.put("seriesNl", seriesNl);
		map.put("seriesLy", seriesLy);
		map.put("seriesMy", seriesMy);
		map.put("seriesYy", seriesYy);
		map.put("seriesNlmyfwy", seriesNlmyfwy);
		map.put("seriesAxjjs", seriesAxjjs);
		map.put("seriesAkbjjs", seriesAkbjjs);
		return map;
	}
	/**
	 * @description 初始化农林牧渔业总产值(1978-2014年)年鉴统计页面
	 * @author huoge
	 * @date 2017年3月1日
	 * @param request
	 * @return
	 */
	@RequestMapping("inittjnlmyyzczfl")
	public String tovillagebase(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_nlmyyzczfl";
	}
	
}
