package com.dm.cms.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.cms.service.CmsStatisticService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.SearchConditionUtil;
import com.github.pagehelper.PageInfo;

/**
 * 
 * 
 * Create by wjl 2016年4月25日 上午9:49:14
 * com.dm.cms.controller.CmsStatisticsController.java Project dmbase
 */
@Controller
@RequestMapping("/statistics")
public class CmsStatisticsController {

	@Autowired
	private CmsStatisticService cmsStatisticService;

	@RequestMapping("/site")
	public String site() {
		return "cms/statistics/sitePage";
	}

	@RequestMapping("/channel")
	public String channel() {
		return "cms/statistics/channelPage";
	}

	@RequestMapping("/user")
	public String user() {
		return "cms/statistics/userPage";
	}

	@RequestMapping("/siteList")
	@ResponseBody
	public Object siteList(
			@RequestParam(required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(required = false) String sort,
			@RequestParam(required = false, defaultValue = "5") Integer pageSize,
			HttpServletRequest request) {
		Map map = SearchConditionUtil.packageSearchCondion(request);
		return this.cmsStatisticService.selectSiteStatisticList(pageNum,
				pageSize, sort, map);
	}

	@RequestMapping("/channelList")
	@ResponseBody
	public Object channelList(
			@RequestParam(required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(required = false) String sort,
			@RequestParam(required = false, defaultValue = "5") Integer pageSize,
			HttpServletRequest request) {
		Map map = SearchConditionUtil.packageSearchCondion(request);
		return this.cmsStatisticService.selectChannelStatisticList(pageNum,
				pageSize, sort, map);
	}

	@RequestMapping("/userList")
	@ResponseBody
	public Object userList(
			@RequestParam(required = false, defaultValue = "1") Integer pageNum,
			@RequestParam(required = false) String sort,
			@RequestParam(required = false, defaultValue = "5") Integer pageSize,
			HttpServletRequest request) {
		Map map = SearchConditionUtil.packageSearchCondion(request);
		return this.cmsStatisticService.selectUserStatisticList(pageNum,
				pageSize, sort, map);
	}

}
