package com.dm.app.datatopic.cunqing.science.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.cunqing.science.service.KjsfhService;
import com.dm.app.util.judge.ObjectUtils;
import com.dm.atform.util.RedisCache;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
/***
 * 
 *                  
 * @date: 2017年2月25日
 * @Author: lyh
 * @FileName: KjsfhController.java
 * @Version: 1.0
 * @About: 科技示范户 控制层代码
 *
 */
@Controller
@RequestMapping("portal")
public class KjsfhController {
	@Autowired
	private KjsfhService kjsfhServcie;
	@Autowired
	private CmsSiteService siteService;
	@Autowired
	private RedisCache redisCache;
	/**
	 * @description  查询区各区县的数量
	 * @author lyh
	 * @date 2017年2月16日
	 * @return 
	 */
	@RequestMapping("ajax/findkjsfhCount")
	@ResponseBody
	public Map findkjsfhCount(HttpServletRequest request){
		final String key ="ajaxFindkjsfhCount_null";
		Map map =(Map) redisCache.get(key);
		if(map!=null){
			return map;
		}
		List<Map> result = kjsfhServcie.getSciencetCount(null);
		for(int i=0;i<result.size();i++){		
			if(i>=result.size()){
				break;
			}
			for(int j=0;j<result.size();j++){
				if(i>=result.size()){
					break;
				}
				if(!result.get(i).get("QX_MC").toString().equals(result.get(j).get("QX_MC").toString())&&result.get(i).get("QX_MC").toString().contains(result.get(j).get("QX_MC").toString())){
					result.get(i).put("count", Double.valueOf(result.get(i).get("count").toString())+Double.valueOf(result.get(j).get("count").toString()));
					result.remove(j);
				continue;
			} 
		}
		}
		StringBuilder legendData=new StringBuilder("[");
		StringBuilder seriesData=new StringBuilder("[");
		if(ObjectUtils.isNotNull(result)){
			for(Map m:result){
				legendData.append("{");
				legendData.append("name:'"+m.get("QX_MC")+"',icon:'circle'");
				legendData.append("},");

				seriesData.append("{");
				seriesData.append("name:'"+m.get("QX_MC")+"',value:"+m.get("count"));
				seriesData.append("},");
			}
			legendData=new StringBuilder(legendData.toString().substring(0,  legendData.length()-1)).append("]");
			seriesData=new StringBuilder(seriesData.toString().substring(0,  seriesData.length()-1)).append("]");
		}
		Map sourcemap=new HashMap<>();		
		sourcemap.put("legendData", legendData);
		sourcemap.put("seriesData", seriesData);
		redisCache.set(key, sourcemap);
			return sourcemap;
	}
	
	
	/**
	 * 
	 * @date: 2017年2月25日
	 * @Author: lyh
	 * @param request
	 * @return种植面积排行top10
	 */
	@RequestMapping("ajax/zzmj")
	@ResponseBody
	public Object getSpaceCount(HttpServletRequest request){
		List  xray =  new ArrayList<>();
		HashMap<String, Object> map = new HashMap<>();
		List yvalue= new ArrayList<>();
		List<Map>productCounty = kjsfhServcie.getZzMji(null).subList(0, 10);
		for(int i=0;i<productCounty.size();i++){
			for(int j=0;j<productCounty.size();j++){
			if(productCounty.get(i).get("_id").equals("小麦、玉米")&&productCounty.get(j).get("_id").equals("小麦,玉米")){
					productCounty.get(i).put("total", Double.valueOf(productCounty.get(i).get("total").toString())+ Double.valueOf(productCounty.get(j).get("total").toString()));
					productCounty.remove(j);
			}
			}
	}
		for(int i=0;i<productCounty.size();i++){
			xray.add(productCounty.get(i).get("_id"));
			yvalue.add(productCounty.get(i).get("total"));
		}
		map.put("xray", xray);
		map.put("yvalue", yvalue);
		return map;
	}
	
	@RequestMapping("ajax/zzmj1")
	@ResponseBody
	public Object getZzZw(HttpServletRequest request){
		List<Map> zzZw = kjsfhServcie.getZzZw(null);
		return zzZw;
	}
	/**
	 * @description 初始化并跳转到统计页面
	 * @author lyh
	 * @date 2017年2月19日
	 * @param request
	 * @return
	 */
	@RequestMapping("kjsfh")
	public String initVillageCountPage(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_kjsfh";
	}

}
