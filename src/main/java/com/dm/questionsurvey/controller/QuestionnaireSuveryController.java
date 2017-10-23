package com.dm.questionsurvey.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
import com.dm.platform.model.TDictItem;
import com.dm.platform.util.TDictCache;
import com.dm.questionsurvey.model.QuestionnaireSuvery;
import com.dm.questionsurvey.service.QuestionnaireSuveryService;
import com.dm.questionsurvey.util.IpUtil;

@Controller
@RequestMapping("/portal/que")
public class QuestionnaireSuveryController {
	@Autowired
	QuestionnaireSuveryService questionSuveryService;
	@Autowired
	private CmsSiteService siteService;
	
	@RequestMapping("/survey.htm")
	public String survey(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 4);
		List<TDictItem> weibanjus = TDictCache.getInstance().getItemListByTDictCode("weibanju");
		List<TDictItem> types = TDictCache.getInstance().getItemListByTDictCode("xqlx");
		request.setAttribute("weibanjus", weibanjus);
		request.setAttribute("types", types);
		return "/template/sn_survey";
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public String add(QuestionnaireSuvery questSuvery,HttpServletRequest request){
		questSuvery.setIp(IpUtil.getIpAddr(request));
		questionSuveryService.add(questSuvery);
		return "/template/sn_survey";
	}
	
	
	@RequestMapping("/list")
	public String list(){
		return "/app/questionsurvey/list";
	}
	
	@RequestMapping("/initQuestion")
	public String initQuestion(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 4);
		return "template/sn_question";
	}
	
	@RequestMapping("/ajax/questionList")
	@ResponseBody
	public Object findAllQuestionSuvery(Model model){
		//委办局的查询
		List<TDictItem> weibanjuList = TDictCache.getInstance().getItemListByTDictCode("weibanju");
		//需求类型的查询
		List<TDictItem> xqlxList = TDictCache.getInstance().getItemListByTDictCode("xqlx");
		//用于查询数据的相关信息
		Map<Object,Object> resultMap=new HashMap();
		for(TDictItem xqlx:xqlxList){
			if(xqlx.getItemCode().equals("shuju")){
				resultMap.put("shuju",findValue(weibanjuList,xqlx.getItemName()));
			}else if(xqlx.getItemCode().equals("yingyong")){
				resultMap.put("yingyong",findValue(weibanjuList,xqlx.getItemName()));
			}else if(xqlx.getItemCode().equals("jiekou")){
				resultMap.put("jiekou",findValue(weibanjuList,xqlx.getItemName()));
			}
		}
		String weibanjus="['";
		for(TDictItem weibanju:weibanjuList){
			//['社会局','金融处','城乡发展处','经济体制处','农村经济统计处','北京市城乡经济','信息中心','资源与区划处']
			weibanjus+=weibanju.getItemName()+"','";
		}
		weibanjus=weibanjus.substring(0,weibanjus.length()-2);
		weibanjus=weibanjus+"]";
		//System.out.println("=============="+weibanjus);
		resultMap.put("weibanjus", weibanjus);
		//model.addAttribute("xValue",xValue.substring(0,xValue.length()-2));
		//model.addAttribute("listYvalue",listYvalue);
		return resultMap;
	}
	
	public String findValue(List<TDictItem> weibanjuList,String type){
		List<QuestionnaireSuvery> questionSuverys=new ArrayList<QuestionnaireSuvery>();
		String yValue="[";
			for(TDictItem item:weibanjuList){
				Integer count=0;
				questionSuverys=questionSuveryService.selectCountByWeibanjuType();
				for(QuestionnaireSuvery que:questionSuverys){
					if(item.getItemName().equals(que.getWeibanju())&& que.getType().contains(type)){
						++count;
					}
				}
				yValue+=count+",";
			}
			yValue=yValue.substring(0,yValue.length()-1);
			yValue+="]";
	    return yValue;
	}
}
