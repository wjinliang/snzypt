package com.dm.atform.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.atform.enumpack.NongQingResEnum;
import com.dm.atform.model.AtField;
import com.dm.atform.model.AtTable;
import com.dm.atform.service.AtFieldService;
import com.dm.atform.service.AtTableService;
import com.dm.atform.service.MongoService;
import com.dm.atform.service.NongqingService;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
import com.dm.platform.service.LogService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SearchConditionUtil;
import com.github.pagehelper.PageInfo;

/**
 * Created by Luotuan
 */
@Controller
@RequestMapping("/portal")
public class NongqingPortalController {

	@Autowired
	private AtFieldService colService;

	@Autowired
	private AtTableService table;
	
	@Autowired
	private CmsSiteService siteService;

	@Autowired
	private MongoService mongo;
	
	@Autowired
	private NongqingService nongqingService;
	
	@Autowired
	private MongoTemplate mongoTemplate;

	@Autowired
	private LogService logService;
	
	@RequestMapping("/nongqing/getAllData")
	@ResponseBody
	public Object listTreeOfSec(@RequestParam(required = false) String areaCode, @RequestParam(required = false) String year,
			@RequestParam(required = false) String searchType, @RequestParam(required = false) String searchParam) {
		
		if(StringUtils.isBlank(areaCode) && StringUtils.isBlank(searchParam)
				&& StringUtils.isBlank(year) && StringUtils.isBlank(searchType)) {
			return ResponseUtil.error("请至少约束一个筛选条件。");
		}
		
		return nongqingService.getResultFormMongo(areaCode, searchParam, year, searchType);
	
	}
}