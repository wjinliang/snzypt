package com.dm.app.datatopic.xiangcunlvyou.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.statistis.service.CommomService;
import com.dm.app.datatopic.statistis.service.TjZzscService;
import com.dm.app.datatopic.xiangcunlvyou.service.XiangCunLvYouService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;

/**               
 * @date: 2017年4月8日
 * @Author: fyq
 * @FileName: XiangCunLvYouController.java
 * @Version: 1.0
 * @About:    乡村旅游村、户、农业园区以及乡村旅游户一二级行业
 */

@Controller
@RequestMapping("portal/xiangcun")
public class XiangCunLvYouController {
	
	@Autowired
	private CmsSiteService siteService;
 
	
	@Autowired
	private CommomService commomService;
	
	@Autowired
	private XiangCunLvYouService xiangCunLvYouService;
	
	@Autowired
	TjZzscService  tjZzscService;
	
	
	//乡村旅游之旅游户
	@RequestMapping("ajax/xulvlyh")
	@ResponseBody
	public List  xiangCunLvYouCount(HttpServletRequest request){
		List<Map> list = xiangCunLvYouService.getXiangCunLvYouHuCountUnderQx();
		List<Map> listmap=new ArrayList<Map>();
		List<Map> listmap1=new ArrayList<Map>();
	for(int i=0;i<list.size();i++){
			Map map=list.get(i);
			Map newmap=new HashMap();
			newmap.put(map.get("_id"), map.get("count"));
			listmap.add(newmap);
		}
	String [] counts=new String[14];
		for(int i=0;i<listmap.size();i++){
			if(listmap.get(i).get("朝阳区")!=null){
				 counts[0]=listmap.get(i).get("朝阳区").toString();
				 continue;
			}else if(listmap.get(i).get("海淀区")!=null){
				 counts[1]=listmap.get(i).get("海淀区").toString();
				 continue;
			}else if(listmap.get(i).get("丰台区")!=null){
				 counts[2]=listmap.get(i).get("丰台区").toString();
				 continue;
			}else if(listmap.get(i).get("石景山区")!=null){
				 counts[3]=listmap.get(i).get("石景山区").toString();
				 continue;
			}else if(listmap.get(i).get("门头沟区")!=null){
				 counts[4]=listmap.get(i).get("门头沟区").toString();
				 continue;
			}else if(listmap.get(i).get("房山区")!=null){
				 counts[5]=listmap.get(i).get("房山区").toString();
				 continue;
			}else if(listmap.get(i).get("通州区")!=null){
				 counts[6]=listmap.get(i).get("通州区").toString();
				 continue;
			}else if(listmap.get(i).get("顺义区")!=null){
				 counts[7]=listmap.get(i).get("顺义区").toString();
				 continue;
			}else if(listmap.get(i).get("大兴区")!=null){
				 counts[8]=listmap.get(i).get("大兴区").toString();
				 continue;
			}else if(listmap.get(i).get("昌平区")!=null){
				 counts[9]=listmap.get(i).get("昌平区").toString();
				 continue;
			}else if(listmap.get(i).get("平谷区")!=null){
				 counts[10]=listmap.get(i).get("平谷区").toString();
				 continue;
			}else if(listmap.get(i).get("怀柔区")!=null){
				 counts[11]=listmap.get(i).get("怀柔区").toString();
				 continue;
			}else if(listmap.get(i).get("密云县")!=null){
				 counts[12]=listmap.get(i).get("密云县").toString();
				 continue;
			}else if(listmap.get(i).get("延庆县")!=null){
				 counts[13]=listmap.get(i).get("延庆县").toString();
				 continue;
			}
			
		}
			counts[0]="0";
			counts[2]="0";
			counts[3]="0";
		List lista=new ArrayList<>();
		for(int i=0;i<counts.length;i++){
			lista.add(counts[i]);
		}
			return lista;
		}
	
	
	//乡村旅游之旅游村
	@RequestMapping("ajax/xclylvctest")
	@ResponseBody
	public List findCunZhuangGuanChaDianCountUnderQX(HttpServletRequest request){
		List<Map> list = xiangCunLvYouService.getXiangCunLvYouCountUnderQx();
		List<Map> listmap=new ArrayList<Map>();
		List<Map> listmap1=new ArrayList<Map>();
	for(int i=0;i<list.size();i++){
			Map map=list.get(i);
			Map newmap=new HashMap();
			newmap.put(map.get("_id"), map.get("count"));
			listmap.add(newmap);
		}
	String [] counts=new String[14];
		for(int i=0;i<listmap.size();i++){
			if(listmap.get(i).get("朝阳区")!=null){
				 counts[0]=listmap.get(i).get("朝阳区").toString();
				 continue;
			}else if(listmap.get(i).get("海淀区")!=null){
				 counts[1]=listmap.get(i).get("海淀区").toString();
				 continue;
			}else if(listmap.get(i).get("丰台区")!=null){
				 counts[2]=listmap.get(i).get("丰台区").toString();
				 continue;
			}else if(listmap.get(i).get("石景山区")!=null){
				 counts[3]=listmap.get(i).get("石景山区").toString();
				 continue;
			}else if(listmap.get(i).get("门头沟区")!=null){
				 counts[4]=listmap.get(i).get("门头沟区").toString();
				 continue;
			}else if(listmap.get(i).get("房山区")!=null){
				 counts[5]=listmap.get(i).get("房山区").toString();
				 continue;
			}else if(listmap.get(i).get("通州区")!=null){
				 counts[6]=listmap.get(i).get("通州区").toString();
				 continue;
			}else if(listmap.get(i).get("顺义区")!=null){
				 counts[7]=listmap.get(i).get("顺义区").toString();
				 continue;
			}else if(listmap.get(i).get("大兴区")!=null){
				 counts[8]=listmap.get(i).get("大兴区").toString();
				 continue;
			}else if(listmap.get(i).get("昌平区")!=null){
				 counts[9]=listmap.get(i).get("昌平区").toString();
				 continue;
			}else if(listmap.get(i).get("平谷区")!=null){
				 counts[10]=listmap.get(i).get("平谷区").toString();
				 continue;
			}else if(listmap.get(i).get("怀柔区")!=null){
				 counts[11]=listmap.get(i).get("怀柔区").toString();
				 continue;
			}else if(listmap.get(i).get("密云县")!=null){
				 counts[12]=listmap.get(i).get("密云县").toString();
				 continue;
			}else if(listmap.get(i).get("延庆县")!=null){
				 counts[13]=listmap.get(i).get("延庆县").toString();
				 continue;
			}
			
		}
			counts[3]="0";
		List lista=new ArrayList<>();
		for(int i=0;i<counts.length;i++){
			lista.add(counts[i]);
		}
			return lista;
		
	}
	
	  
	
	//乡村旅游之旅游园区
	@RequestMapping("ajax/xclylvyuanqu")
	@ResponseBody
	public List findXiangCunLvYouQuCountUnderQX(HttpServletRequest request){
		List<Map> list = xiangCunLvYouService.getXiangCunLvYouQuCountUnderQx();
		
		List<Map> listmap=new ArrayList<Map>();
		List<Map> listmap1=new ArrayList<Map>();
	for(int i=0;i<list.size();i++){
			Map map=list.get(i);
			Map newmap=new HashMap();
			newmap.put(map.get("_id"), map.get("count"));
			listmap.add(newmap);
		}
	String [] counts=new String[14];
		for(int i=0;i<listmap.size();i++){
			if(listmap.get(i).get("朝阳区")!=null){
				 counts[0]=listmap.get(i).get("朝阳区").toString();
				 continue;
			}else if(listmap.get(i).get("海淀区")!=null){
				 counts[1]=listmap.get(i).get("海淀区").toString();
				 continue;
			}else if(listmap.get(i).get("丰台区")!=null){
				 counts[2]=listmap.get(i).get("丰台区").toString();
				 continue;
			}else if(listmap.get(i).get("石景山区")!=null){
				 counts[3]=listmap.get(i).get("石景山区").toString();
				 continue;
			}else if(listmap.get(i).get("门头沟区")!=null){
				 counts[4]=listmap.get(i).get("门头沟区").toString();
				 continue;
			}else if(listmap.get(i).get("房山区")!=null){
				 counts[5]=listmap.get(i).get("房山区").toString();
				 continue;
			}else if(listmap.get(i).get("通州区")!=null){
				 counts[6]=listmap.get(i).get("通州区").toString();
				 continue;
			}else if(listmap.get(i).get("顺义区")!=null){
				 counts[7]=listmap.get(i).get("顺义区").toString();
				 continue;
			}else if(listmap.get(i).get("大兴区")!=null){
				 counts[8]=listmap.get(i).get("大兴区").toString();
				 continue;
			}else if(listmap.get(i).get("昌平区")!=null){
				 counts[9]=listmap.get(i).get("昌平区").toString();
				 continue;
			}else if(listmap.get(i).get("平谷区")!=null){
				 counts[10]=listmap.get(i).get("平谷区").toString();
				 continue;
			}else if(listmap.get(i).get("怀柔区")!=null){
				 counts[11]=listmap.get(i).get("怀柔区").toString();
				 continue;
			}else if(listmap.get(i).get("密云县")!=null){
				 counts[12]=listmap.get(i).get("密云县").toString();
				 continue;
			}else if(listmap.get(i).get("延庆县")!=null){
				 counts[13]=listmap.get(i).get("延庆县").toString();
				 continue;
			}
			
		}
			counts[3]="0";
		List lista=new ArrayList<>();
		for(int i=0;i<counts.length;i++){
			lista.add(counts[i]);
		}
			return lista;
		
	}
	
	
	
	//乡村旅游户之一级行业
	@RequestMapping("ajax/huyierhy")
	@ResponseBody
	public Map tjZzsc(HttpServletRequest request){
		List<Map> list = xiangCunLvYouService.getXiangCunLvYouHuCountOneHyUnderQx();
			Map maps=  new HashMap<>();
			List xAxis= new ArrayList<>();   
			List counts = new ArrayList<>();
		 
			for (int i = 0; i < list.size(); i++) {
				Map map = list.get(i);
				String yjhy = (String) map.get("yjxy"); 
				xAxis.add(yjhy);
				counts.add(map.get("count"));
			}
			maps.put("xAxis", xAxis);
			maps.put("counts", counts);
			return maps;
	}
	
	
	
	//乡村旅游户之二级行业
	@RequestMapping("ajax/erjihangye")
	@ResponseBody
	public Map erJiHangye(HttpServletRequest request){
		List<Map> list = xiangCunLvYouService.getXiangCunLvYouHuCountTwoHyUnderQx();
			Map maps=  new HashMap<>();
			List xAxis= new ArrayList<>();   
			List counts = new ArrayList<>();
			for (int i = 0; i < list.size(); i++) {
				Map map = list.get(i);
				String yjhy = (String) map.get("ejxy"); 
				xAxis.add(yjhy);
				counts.add(map.get("count"));
			}
			maps.put("xAxis", xAxis);
			maps.put("counts", counts);
			return maps;
	}
	//乡村旅游之村，户，园区统计页面
	@RequestMapping("initXiangCunLvYouCountPage")
	public String initItemCountPage(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
	return "template/sn_topic_statistic_xclvlyc";
}
	
	//乡村旅游户一二级行业统计页面
	@RequestMapping("initXiangCunLvYouHuYiJiCountPage")
	public String initItemCountLvYouHuPage(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
	return "template/sn_topic_statistic_xclvlyh"; 
}
	

}
