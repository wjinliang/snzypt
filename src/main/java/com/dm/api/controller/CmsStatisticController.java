package com.dm.api.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.cms.model.CmsVisitCountVo;
import com.dm.cms.service.CmsStatisticService;
import com.dm.platform.util.PageConvertUtil;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/cmsStatic")
public class CmsStatisticController {
	@Autowired
	private CmsStatisticService cmsStatisticService;
	private Logger log = LoggerFactory.getLogger(CmsStatisticController.class);
	
	@RequestMapping("/addVisited")
	@ResponseBody
	public Object addVisited(CmsVisitCountVo cmsVisitCountVo,HttpServletRequest request){
		cmsStatisticService.addVisited(cmsVisitCountVo,request);
		return "JquerycallbackRt"+":({'status':'1'})";
	}
	
	@RequestMapping("/siteVisitList")
	@ResponseBody
	public Object siteVisitList(
			@RequestParam(value = "pageNum", required = false,defaultValue="1") Integer pageNum,
			@RequestParam(value = "pageSize", required = false,defaultValue="10") Integer pageSize,
			CmsVisitCountVo cmsVisitCountVo,
			@RequestParam(value = "days", required = false,defaultValue="7")int days)
	{
		return PageConvertUtil.grid(
				cmsStatisticService.siteVisitList(pageNum,pageSize,cmsVisitCountVo,days));
	}
	@RequestMapping("/channelVisitList")
	@ResponseBody
	public Object channelVisitList(
			@RequestParam(value = "pageNum", required = false,defaultValue="1") Integer pageNum,
			@RequestParam(value = "pageSize", required = false,defaultValue="10") Integer pageSize,
			CmsVisitCountVo cmsVisitCountVo,
			@RequestParam(value = "days", required = false,defaultValue="7")int days)
	{
		return PageConvertUtil.grid(
				cmsStatisticService.channelVisitList(pageNum,pageSize,cmsVisitCountVo,days));
	}
	@RequestMapping("/contentVisitList")
	@ResponseBody
	public Object contentVisitList(
			@RequestParam(value = "pageNum", required = false,defaultValue="1") Integer pageNum,
			@RequestParam(value = "pageSize", required = false,defaultValue="10") Integer pageSize,
			CmsVisitCountVo cmsVisitCountVo,
			@RequestParam(value = "days", required = false,defaultValue="7")int days)
	{	
		PageInfo<CmsVisitCountVo> page = cmsStatisticService.contentVisitList(pageNum,pageSize,cmsVisitCountVo,days);
		return PageConvertUtil.grid(page);
	}
	@RequestMapping("/pubulishList")
	@ResponseBody
	public Object pubulishList(
			@RequestParam(value = "pageNum", required = false,defaultValue="1") Integer pageNum,
			@RequestParam(value = "pageSize", required = false,defaultValue="5") Integer pageSize,
			CmsVisitCountVo cmsVisitCountVo,
			@RequestParam(value = "days", required = false,defaultValue="15")int days)
	{	
		Map map  = cmsStatisticService.pubulishList(pageNum,pageSize,cmsVisitCountVo,days);
        return map;
	}
	
}
