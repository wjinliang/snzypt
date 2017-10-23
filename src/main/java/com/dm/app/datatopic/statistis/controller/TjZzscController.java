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

import com.dm.app.datatopic.model.portaltopic.TjZzsc;
import com.dm.app.datatopic.statistis.service.TjZzscService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;

/**
 * @description 10-18  种业生产
 * @author lyh
 */
@Controller
@RequestMapping("portal/statistic")
public class TjZzscController {
	@Autowired
	TjZzscService  tjZzscService;
	@Autowired
	private CmsSiteService siteService;
	/**
	 * 
	 * @date: 2017年2月28日
	 * @Author: lyh
	 * @param request
	 * @return t调回统计页面数据(产量,收入)
	 */
	@RequestMapping(value={"ajax/tjzzsccl","ajax/tjzzscsr"})
	@ResponseBody
	public Map tjZzsc(HttpServletRequest request){
		Map map = new HashMap<>();
		List xAxis = new ArrayList<>();
		//2014产量
		List seriesclSi=new ArrayList();
		//2013产量
		List seriesclSan=new ArrayList();
		//2014收入
		List seriessiSr=new ArrayList();
		//2013收入
		List seriesclsanSr=new ArrayList();
		List seriesclDw=new ArrayList();
		List list = tjZzscService.findAll(TjZzsc.class);
		for (int i=0;i<list.size();i++) {
			TjZzsc tjZzsc = (TjZzsc) list.get(i);
				xAxis.add(tjZzsc.getXm());
				seriesclSi.add(tjZzsc.getClSi());
				seriesclSan.add(tjZzsc.getClSan());
				seriessiSr.add(tjZzsc.getSiSr());
				seriesclDw.add(tjZzsc.getDw());
				seriesclsanSr.add(tjZzsc.getSanSr());
			}
		map.put("xAxis", xAxis);
		map.put("seriesclSi", seriesclSi);
		map.put("seriesclSan", seriesclSan);
		map.put("seriessiSr", seriessiSr);
		map.put("seriesclDw", seriesclDw);
		map.put("seriesclsanSr", seriesclsanSr);
		return map;
	}
	@RequestMapping("totjzzsc")
	public String tovillagebase(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_zzsc";
		
	}
	/*		Map map = new HashMap<>();
	//放项目名称
	StringBuilder xAxis=new StringBuilder("[");
	//2014产量
	StringBuilder seriesclSi=new StringBuilder("[");
	//2013产量
	StringBuilder seriesclSan=new StringBuilder("[");
	//2014收入
	StringBuilder seriessiSr=new StringBuilder("[");
	//2013收入
	StringBuilder seriesclsanSr=new StringBuilder("[");
	List list = tjZzscService.findAll(TjZzsc.class);
	for (int i=0;i<list.size();i++) {
		TjZzsc tjZzsc = (TjZzsc) list.get(i);
		if(i==list.size()-1){
			xAxis.append("'"+tjZzsc.getXm()+"'");
			seriesclSi.append(tjZzsc.getClSi());
			seriesclSan.append(tjZzsc.getClSan());
			seriessiSr.append(tjZzsc.getSiSr());
			seriesclsanSr.append(tjZzsc.getSanSr());
		}else{
			xAxis.append(tjZzsc.getXm()+",");
			seriesclSi.append(tjZzsc.getClSi()+",");
			seriesclSan.append(tjZzsc.getClSan()+",");
			seriessiSr.append(tjZzsc.getSiSr()+",");
			seriesclsanSr.append(tjZzsc.getSanSr()+",");
		}
		
	}
	  xAxis.append("]");
		seriesclSi.append("]");
		seriesclSan.append("]");
		seriessiSr.append("]");
		seriesclsanSr.append("]");
		
		map.put("xAxis", xAxis);
		map.put("seriesclSi", seriesclSan);
		map.put("seriesclSan", seriesclSan);
		map.put("seriessiSr", seriessiSr);
		map.put("seriesclsanSr", seriesclsanSr);*/

}
