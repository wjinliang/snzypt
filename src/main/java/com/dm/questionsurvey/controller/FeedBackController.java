package com.dm.questionsurvey.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
import com.dm.questionsurvey.model.FeedBack;
import com.dm.questionsurvey.service.FeedBackService;
import com.dm.questionsurvey.util.IpUtil;

@Controller
@RequestMapping("/portal/feedBack")
public class FeedBackController {
	@Autowired
	FeedBackService feedBackService;
	@Autowired
	private CmsSiteService siteService;
	
	@RequestMapping("/save")
	@ResponseBody
	public String add(FeedBack feedBack,HttpServletRequest request){
		feedBack.setIp(IpUtil.getIpAddr(request));
		feedBackService.add(feedBack);
		return "/template/sn_feedback";
	}
	@RequestMapping("/page.htm")
	public String feedback(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 4);
		
		return "/template/sn_feedback";
	}
	
}
