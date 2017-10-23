package com.dm.app.datatopic.cunqing.nature.controller;

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
import com.dm.app.datatopic.cunqing.baseinfo.service.RegVillageInfoService;
import com.dm.app.datatopic.cunqing.nature.service.NatureService;
import com.dm.app.datatopic.model.ZrbhqJbxx;
import com.dm.app.util.judge.ObjectUtils;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
import com.dm.platform.util.ResponseUtil;

import net.sf.json.JSONObject;

/**
 * @description自然保护区统计控制层
 * @author lyh
 */
@Controller
@RequestMapping("portal")
public class NatureController {
	@Autowired
	private NatureService natureService;
	@Autowired
	private CmsSiteService siteService;
	/**
	 * @description  查询区各县下乡村的数量
	 * @author lyh
	 * @date 2017年2月16日
	 * @return 
	 */
	@RequestMapping("ajax/findnaturecount")
	@ResponseBody
	public Map findnatureCount(HttpServletRequest request){
		List<Map> result = natureService.getNatureCount(null);
		StringBuilder legendData=new StringBuilder("[");
		StringBuilder seriesData=new StringBuilder("[");
		if(ObjectUtils.isNotNull(result)){
			for(Map m:result){
				legendData.append("{");
				legendData.append("name:'"+m.get("SZ_QX")+"',icon:'circle'");
				legendData.append("},");

				seriesData.append("{");
				seriesData.append("name:'"+m.get("SZ_QX")+"',value:"+m.get("count"));
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
	
	@RequestMapping("ajax/spacecount")
	@ResponseBody
	public Object getSpaceCount(HttpServletRequest request){
		List  xray =  new ArrayList<>();
		HashMap<String, Object> map = new HashMap<>();
		List yvalue= new ArrayList<>();
		List productCounty = natureService.getNatureSpace(null);
		Iterator it = productCounty.iterator();
		while(it.hasNext()){
			ZrbhqJbxx bhq = (ZrbhqJbxx) it.next();
			xray.add(bhq.getBhqMc());
			
			yvalue.add(bhq.getBhqMj());
		}
		map.put("xray", xray);
		map.put("yvalue", yvalue);
		return map;
	}
	/**
	 * @description 初始化并跳转到统计页面
	 * @author lyh
	 * @date 2017年2月19日
	 * @param request
	 * @return
	 */
	@RequestMapping("nature")
	public String initVillageCountPage(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_nature";
	}


}





