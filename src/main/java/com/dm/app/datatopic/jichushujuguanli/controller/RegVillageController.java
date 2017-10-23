package com.dm.app.datatopic.jichushujuguanli.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.jichushujuguanli.model.RegVillage;
import com.dm.app.datatopic.jichushujuguanli.service.RegVillageService;
import com.dm.platform.util.SearchConditionUtil;

@Controller
@RequestMapping("regVillage")
public class RegVillageController {
	@Autowired
	private RegVillageService service;
	
	@RequestMapping("list")
	@ResponseBody
	public List<RegVillage> list(HttpServletRequest request){
		Map param = SearchConditionUtil.packageSearchCondion(request);
		return this.service.findAll(param);
	}

}
