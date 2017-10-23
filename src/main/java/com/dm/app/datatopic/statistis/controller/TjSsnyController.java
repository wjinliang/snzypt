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

import com.dm.app.datatopic.model.portaltopic.TjSsny;
import com.dm.app.datatopic.model.portaltopic.TjXzqyGyJbqk;
import com.dm.app.datatopic.statistis.service.CommomService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;

/**
 * 
 *                  
 * @date: 2017年3月1日
 * @Author: lyh
 * @FileName: TjSsnyController.java
 * @Version: 1.0
 * @About:   10-19  设施农业(2014年)
 *
 */
@Controller
@RequestMapping("portal/statistic")
public class TjSsnyController {
	@Autowired
	private CmsSiteService siteService;
	@Autowired
	private CommomService commonService;
	/**
	 * 
	 * @date: 2017年3月1日
	 * @Author: lyh
	 * @param request
	 * @return10-5 10-19  设施农业(2014年)
	 */
	@RequestMapping("ajax/tjssny")
	@ResponseBody
	public Map ssnyCountPage(HttpServletRequest request){
		Map map = new HashMap<>();
		//项目
		List xAxis = new ArrayList<>();
		//设施农业播种面积(公顷)
		List seriesMj=new ArrayList();
		//设施农业产量(吨)
		List seriesCl=new ArrayList();	
		//设施农业收入(万元)
		List seriesSr=new ArrayList();
		List list = commonService.findAll(TjSsny.class);
		for (int i=0; i<list.size();i++) {
			TjSsny tjSsny = (TjSsny) list.get(i);
			xAxis.add(tjSsny.getXm());
			seriesMj.add(tjSsny.getSsnybzmj());
			seriesCl.add(tjSsny.getSsnycl());
			seriesSr.add(tjSsny.getSsnysr());
			
			
		}
		map.put("xAxis", xAxis);
		map.put("seriesMj", seriesMj);
		map.put("seriesCl", seriesCl);
		map.put("seriesSr", seriesSr);
			
		
		return map;
	}
	/**
	 * @description 
	 * @author lyh
	 * @date 2017年2月28日
	 * @return
    */
	@RequestMapping("inittjssny")
	public String toxzqybase(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_statistic_tjssny";
		
	}
	
	
	
	

}
