package com.dm.dataprocessing.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.dataprocessing.service.ProcessingLogService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/procesLog")
public class ProcesLogController {

	@Autowired
	private  ProcessingLogService processingLogService;
	
	@RequestMapping("/page")
	public String page(){
		return "/processing/log/page";
	}
	@RequestMapping("list")
	@ResponseBody
	public Object list(@RequestParam(defaultValue="10",required=false)Integer pageSize,
			@RequestParam(defaultValue="10",required=false)Integer pageNum){
		Map searchMap = new HashMap();
		PageInfo page = processingLogService.list(pageNum, pageSize, searchMap);
		return PageConvertUtil.grid(page);
		
	}
	
	@RequestMapping("load")
	@ResponseBody
	public Object load(String id){
		return processingLogService.load(id);
		
	}
	
	/*@RequestMapping("insertOrUpdate")
	@ResponseBody
	public Object insertOrUpdate(ProcesLog v){
		if(StringUtils.isEmpty(v.getId())){
			this.processingLogService.insert(v);
		}else{
			this.processingLogService.update(v);
		}
		return ResponseUtil.success();
	}*/
	@RequestMapping("delete")
	@ResponseBody
	public Object delete(String id){
		this.processingLogService.delete(id);
		return ResponseUtil.success();
	}
	
	
	
}
