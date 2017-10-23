package com.dm.cms.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.platform.util.ResponseUtil;
import com.dm.search.model.SearchConfig;
import com.dm.search.service.SearchConfigService;

@Controller
@RequestMapping("/cms/image")
public class CmsImageController {

	@Autowired
	SearchConfigService searchConfigService;
	
	@RequestMapping("/page")
	public String page(Model model)
	{
		model.addAttribute("searchConfig", searchConfigService.findConfig("imageId"));
		return "cms/image/page";
	}
	
	@RequestMapping("/insertOrUpdate")
	@ResponseBody
	public Map insertOrUpdate(Model model,SearchConfig searchConfig)
	{
		searchConfig.setId("imageId");
		searchConfigService.insertOrUpdate(searchConfig);
		return ResponseUtil.success("配置成功！");
	}
}
