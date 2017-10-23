package com.dm.app.datatopic.statistis.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dm.app.datatopic.model.portaltopic.TjNyMsZySs;
import com.dm.app.datatopic.statistis.service.TjNyMsZySsSerivice;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
import com.dm.platform.util.ResponseUtil;
/**
 * @description  10-15  农业观光园、民俗旅游、种业和设施农业(2010-2014年)
 * @author huoge
 */
@Controller
@RequestMapping("portal/statistic")
public class TjNyMsZySsController {
	@Autowired
	private CmsSiteService siteService;
	@Autowired
	private TjNyMsZySsSerivice tjNyMsZySsSerivice;
	
	/**
	 * @description 统计
	 * @author lyh
	 * @date 2017年3月1日
	 * @param request
	 * @return
	 */
	@RequestMapping("inittjnymszyss")
	@ResponseBody
	public ModelAndView initStatisticNymszyssPage(HttpServletRequest request){
		ModelAndView model=new ModelAndView();
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		List tjnymszyssList=tjNyMsZySsSerivice.findAll(TjNyMsZySs.class);
		model.addObject("tjnymszyssList",tjnymszyssList);
		model.setViewName("template/sn_topic_statistic_nyzyss");
		return model;
	}
	@RequestMapping("ajax/inittjnymszyss")
	@ResponseBody
	public Object ajaxinitStatisticNymszyssPage(HttpServletRequest request){
		List tjnymszyssList=tjNyMsZySsSerivice.findAll(TjNyMsZySs.class);
		return ResponseUtil.success(tjnymszyssList);
	}
	
}
