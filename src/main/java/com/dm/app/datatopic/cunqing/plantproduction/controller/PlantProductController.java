package com.dm.app.datatopic.cunqing.plantproduction.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.cunqing.plantproduction.service.PlantProductService;
import com.dm.app.datatopic.model.MpJbxx;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;

/**
 * 
 *                  
 * @date: 2017年2月20日
 * @Author:lyh
 * @FileName: PlantProductController.java
 * @Version: 1.0
 * @About:  种植生产控制层
 *
 */
@Controller
@RequestMapping("portal")
public class PlantProductController {
	@Autowired
	PlantProductService pps;//种植生产业务层接口
	@Autowired
	private CmsSiteService siteService;
	
	/**
	 * 
	 * @date: 2017年2月23日
	 * @Author: lyh
	 * @param request
	 * @return 返回种植排名前十
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("ajax/products")
	@ResponseBody
	public Object findProduct(HttpServletRequest request){
		List  xray =  new ArrayList<>();
		HashMap<String, Object> map = new HashMap<>();
		List yvalue= new ArrayList<>();
		List productCounty = pps.getProductCounty(null);
		Iterator it = productCounty.iterator();
		while(it.hasNext()){
			MpJbxx mp = (MpJbxx) it.next();
			xray.add(mp.getMpMc());
			//sb.append("'"+mp.getXzc()+"',");
			yvalue.add(mp.getZdMj());
		}
		map.put("xray", xray);
		map.put("yvalue", yvalue);
		return map;
	}
	/**
	 * 
	 * @date: 2017年2月20日
	 * @Author: lyh
	 * @param request
	 * @return
	 * 返回农村种植生产基本情况
	 * 
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("ajax/counts")
	@ResponseBody
	public Object findAllCount(HttpServletRequest request){
		 List nameList = new ArrayList<>();
		 nameList.add("MpJbxx");
		 nameList.add("GyJbxx");
		 nameList.add("HhjdJbxx");
		 nameList.add("GggyJbxx");
		 nameList.add("GylcJbxx");
		 nameList.add("ZzSpbase");//三品基地基本信息
		 nameList.add("SsnyJbxx");
		 nameList.add("SnqyJbxx");
		 nameList.add("LtqyJbxx");
		 List findAllCount = pps.findAllCount(nameList);
		 System.out.println(findAllCount.toString());
		 
		return findAllCount;
	}
	
	
	
	/**
	 * @description 初始化并跳转到统计页面
	 * @author lyh
	 * @date 2017年2月19日
	 * @param request
	 * @return
	 */
	@RequestMapping("initplantpage")
	public String initVillageCountPage(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_plant";
	}
	/**
	 * @description 初始化并跳转到统计页面
	 * @author lyh
	 * @date 2017年2月19日
	 * @param request
	 * @return
	 *//*
	@RequestMapping("initplantpages")
	public String initVillagePlantPage(HttpServletRequest request){
	    return "test/plantProduct";
	}*/
	
	@RequestMapping("text")
	public List initVillagePlantPage(HttpServletRequest request){
		List sumMj = pps.getSumMj(null);
		
	    return sumMj;
	}
	

}
