package com.dm.app.datatopic.zt.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;

@Controller
@RequestMapping("/portal/zt")
public class ZTController {
	@Autowired
	private CmsSiteService siteService;
	
	@RequestMapping("/xxny/index.htm")
	public String xxnyIndex(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_zt_xxny";
	}
	@RequestMapping("/xxny/map.htm")
	public String xxnyMap(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_zt_xxny_map";
	}
	@RequestMapping("/tjnj/index.htm")
	public String tjnjIndex(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_zt_tjnj";
	}
	@RequestMapping("/cqfw/index.htm")
	public String cqfwIndex(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_zt_cqfw";
	}
}
