package com.dm.app.datatopic.cunqing.xumu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.cunqing.xumu.service.XumuyangzhiService;
import com.dm.app.datatopic.model.DanjiJbxx;
import com.dm.app.datatopic.model.NainiuJbxx;
import com.dm.app.util.judge.ObjectUtils;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;

/**
 * @description  畜牧养殖菜单功能
 * @author huoge
 */
@Controller
@RequestMapping("portal")
public class XumuyangzhiController {
	@Autowired
	private XumuyangzhiService xumuyangzhiService;
	@Autowired
	private CmsSiteService siteService;
	private final String XUMU_STATISTICS_PAGE="test/xumu";
	/**
	 * @description  查询区各县下乡村的数量
	 * @author huoge
	 * @date 2017年2月16日
	 * @return 
	 */
	@RequestMapping("ajax/findDanjiJbxxCountUnderCounty")
	@ResponseBody
	public Map findDanjiJbxxCountUnderCounty(HttpServletRequest request){
		List<Map> result = xumuyangzhiService.findDanjiJbxxCountUnderCounty();
		
		for(int i=0;i<result.size();i++){
			for(int j=0;j<result.size();j++){
				if(result.get(i).get("QX_MC").equals("门头沟区")&&result.get(j).get("QX_MC").equals("门沟")){
					result.get(i).put("count", Double.valueOf(result.get(i).get("count").toString())+Double.valueOf(result.get(j).get("count").toString()));
					result.remove(j);
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
		Map map=new HashMap<>();		
		map.put("legendData", legendData);
		map.put("seriesData", seriesData);
			return map;
	}
	
	/**
	 * @description  查询区各县下蛋鸡养殖场占地面积前10
	 * @author huoge
	 * @date 2017年2月16日
	 * @return 
	 */
	@RequestMapping("ajax/findDanjiJbxxZDMJUnderCounty")
	@ResponseBody
	public Object findDanjiJbxxZDMJUnderCounty(HttpServletRequest request){
		List  xray =  new ArrayList<>();
		HashMap<String, Object> map = new HashMap<>();
		List yvalue= new ArrayList<>();
		List productCounty = xumuyangzhiService.findDanjiJbxxZDMJUnderCounty();
		Iterator it = productCounty.iterator();
		while(it.hasNext()){
			DanjiJbxx mp = (DanjiJbxx) it.next();
			xray.add(""+mp.getYzcMc()+"");
			//sb.append("'"+mp.getXzc()+"',");
			yvalue.add(mp.getZdMj());
		}
		map.put("xray", xray);
		map.put("yvalue", yvalue);
		return map;
	}
	
	
	/**
	 * @description  查询区各县下奶牛养殖村所占比例
	 * @author fyq
	 * @date 2017年4月12日
	 * @return 
	 */
	@RequestMapping("ajax/findNaiNiuJbxxCountUnderCounty")
	@ResponseBody
	public Map findNaiNiuJbxxCountUnderCounty(HttpServletRequest request){
		List<Map> result = xumuyangzhiService.findNaiNiuJbxxCountUnderCounty();
		for(int i=0;i<result.size();i++){		
			for(int j=0;j<result.size();j++){
		
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
		Map map=new HashMap<>();		
		map.put("legendData", legendData);
		map.put("seriesData", seriesData);
			return map;
	}
	
	/**
	 * @description  查询区各县下奶牛养殖场占地面积前10
	 * @author fyq
	 * @date 2017年4月12日
	 * @return 
	 */
	@RequestMapping("ajax/findNaiNiuJbxxZDMJUnderCounty")
	@ResponseBody
	public Object findNaiNiuJbxxZDMJUnderCounty(HttpServletRequest request){
		List  xray =  new ArrayList<>();
		HashMap<String, Object> map = new HashMap<>();
		List yvalue= new ArrayList<>();
		List productCounty = xumuyangzhiService.findNaiNiuJbxxZDMJUnderCounty();
		Iterator it = productCounty.iterator();
		while(it.hasNext()){
			NainiuJbxx mp = (NainiuJbxx) it.next();
			xray.add(""+mp.getYzcMc()+"");
			//sb.append("'"+mp.getXzc()+"',");
			yvalue.add(mp.getZdMj());
		}
		map.put("xray", xray);
		map.put("yvalue", yvalue);
		return map;
	}
	
	
	  
	
	/**
	 * @description  查询区各县下蛋鸡养殖场占地面积前10
	 * @author huoge
	 * @date 2017年2月16日
	 * @return 
	 */
	@RequestMapping("initxumutongjipage")
	public String initMunu(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_animal";
	}
	
	
}
