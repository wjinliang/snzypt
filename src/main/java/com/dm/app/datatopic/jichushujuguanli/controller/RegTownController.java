package com.dm.app.datatopic.jichushujuguanli.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.jichushujuguanli.model.RegTown;
import com.dm.app.datatopic.jichushujuguanli.service.RegTownService;
import com.dm.platform.util.SearchConditionUtil;

@Controller
@RequestMapping("regTown")
public class RegTownController {
	@Autowired
	private RegTownService service;
	
	@RequestMapping("list")
	@ResponseBody
	public List<RegTown> list(HttpServletRequest request){
		Map param = SearchConditionUtil.packageSearchCondion(request);
		return this.service.findAll(param);
	}

}
