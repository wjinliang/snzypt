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

import com.dm.app.datatopic.model.portaltopic.TjNysctj;
import com.dm.app.datatopic.statistis.service.TjNysctjService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;

/**
 * @description  农业生产条件  ch10-09.xls tj_NYSCTJ
 * @author huoge
 */
@Controller
@RequestMapping("portal/statistic")
public class TjNysctjController {
	@Autowired
	private CmsSiteService siteService;
	@Autowired
	private TjNysctjService tjNysctjService;
	/**
	 * 
	 * @date: 2017年3月8日
	 * @Author: lyh
	 * @param request
	 * @return 返回农用机械数据(单位辆,台,部)
	 */
	@RequestMapping("ajax/tjnyjx")
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
		List nyjx = tjNysctjService.getNyjx();
		for (int i=0;i<nyjx.size();i++) {
			TjNysctj tjNysctj = (TjNysctj) nyjx.get(i);
			xAxis.add(tjNysctj.getXm());
			seriesSi.add(tjNysctj.getSi());
			seriesSan.add(tjNysctj.getSan());
			serisZb.add(tjNysctj.getZb());
		}
		map.put("xAxis", xAxis);
		map.put("seriesSi", seriesSi);
		map.put("seriesSan", seriesSan);
		map.put("serisZb", serisZb);
		return map;
	}
	/**
	 * 
	 * @date: 2017年3月9日
	 * @Author: lyh
	 * @param request
	 * @return 统计农用化肥使用情况
	 */
	@RequestMapping("ajax/tjnyhf")
	@ResponseBody
	public Map initStatisticnyhfPage(HttpServletRequest request){
		Map map = new HashMap<>();
		//项目名称(化肥)
		List xAxis = new ArrayList<>();
		//2014产量
		List seriesSi=new ArrayList();
		//2013产量
		List seriesSan=new ArrayList();
		//2014年为2013年%
		List serisZb = new ArrayList<>();
		List nyjx = tjNysctjService.getNyHf();
		for (int i=0;i<nyjx.size();i++) {
			TjNysctj tjNysctj = (TjNysctj) nyjx.get(i);
			xAxis.add(tjNysctj.getXm());
			seriesSi.add(tjNysctj.getSi());
			seriesSan.add(tjNysctj.getSan());
			serisZb.add(tjNysctj.getZb());
		}
		map.put("xAxis", xAxis);
		map.put("seriesSi", seriesSi);
		map.put("seriesSan", seriesSan);
		map.put("serisZb", serisZb);
		return map;
	}
	@RequestMapping("ajax/tjnymj")
	@ResponseBody
	public Map initStatiscsMjPage(HttpServletRequest request){
		Map map = new HashMap<>();
		//项目名称(化肥)
		List xAxis = new ArrayList<>();
		//2014产量
		List seriesSi=new ArrayList();
		//2013产量
		List seriesSan=new ArrayList();
		//2014年为2013年%
		List serisZb = new ArrayList<>();
		//2014年某农用面积占总农用面积的比重
		List serisSiZb = new ArrayList<>();
		//2013年某农用面积占总面积的比重
		List serisSanZb = new ArrayList<>();
		 List mJlist = tjNysctjService.getMj();
		
		for (int i=0;i<mJlist.size();i++) {
			TjNysctj tjNysctj = (TjNysctj) mJlist.get(i);
			xAxis.add(tjNysctj.getXm());
			seriesSi.add(tjNysctj.getSi());
			seriesSan.add(tjNysctj.getSan());
			serisZb.add(tjNysctj.getZb());
		}
		List mJZblist = tjNysctjService.getMjZb();
		for (int i=0;i<mJZblist.size();i++) {
			TjNysctj tjNysctj = (TjNysctj) mJlist.get(i);
			serisSiZb.add(tjNysctj.getSi());
			serisSanZb.add(tjNysctj.getSan());
		}
		map.put("xAxis", xAxis);
		map.put("seriesSi", seriesSi);
		map.put("seriesSan", seriesSan);
		map.put("serisZb", serisZb);
		map.put("serisSiZb", serisSiZb);
		map.put("serisSanZb", serisSanZb);
		return map;
	}
	/**
	 * 
	 * @date: 2017年3月8日
	 * @Author: lyh
	 * @param request
	 * @return
	 * 跳转至农业生产条件  ch10-09.xls
	 */
	@RequestMapping("inittjnysctj")
	public String totjnysct(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_tjnysctj";
	}
	

}
