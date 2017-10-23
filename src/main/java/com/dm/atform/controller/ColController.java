package com.dm.atform.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.atform.model.AtField;
import com.dm.atform.service.AtFieldService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SqlParam;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("col")
public class ColController {
	
	@Autowired
	private AtFieldService colService;
	
	@RequestMapping("/page")
	public String page(Model model) {
		return "/atform/col/page";
	}
	@RequestMapping("/gridlist")
	@ResponseBody
	public Object list(
			@RequestParam(value = "pageNum", required = false,defaultValue="1") Integer pageNum,
			@RequestParam(value = "pageSize", required = false,defaultValue="10") Integer pageSize,
			@RequestParam(value="sort" ,required = false,defaultValue="aSeq_asc") String sort,
			AtField atField){
		Map map =new SqlParam().autoParam(atField, sort,pageNum,pageSize);
		PageInfo<AtField> page = this.colService.findByArg(map);
		return PageConvertUtil.grid(page);
	}
	@RequestMapping("/load")
	@ResponseBody
	public Object load(String id){
		return this.colService.findOne(id);
	}
	@RequestMapping("/insertOrUpdate")
	@ResponseBody
	public Object addOrUpdate(AtField atField){
		this.colService.saveOrUpdate(atField);
		return ResponseUtil.success();
	}
	@RequestMapping("/delete")
	@ResponseBody
	public Object delte(AtField atField){
		this.colService.delete(atField.getId());
		return ResponseUtil.success();
	}
	@RequestMapping("/seq")
	@ResponseBody
	public Object seq(String id,String tid){
		this.colService.seq(id,tid);
		return ResponseUtil.success();
	}
}
