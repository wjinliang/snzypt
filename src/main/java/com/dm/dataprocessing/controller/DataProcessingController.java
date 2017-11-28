package com.dm.dataprocessing.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.atform.service.MongoService;
import com.dm.dataprocessing.model.VillageNameProces;
import com.dm.dataprocessing.service.VillageNameProcessingService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/dataproces")
public class DataProcessingController {

	@Autowired
	private  VillageNameProcessingService villageProces;
	
	@Autowired
	private MongoService mongo;
	
	@RequestMapping("/page")
	public String page(){
		return "/dataproces/page";
	}
	@RequestMapping("list")
	@ResponseBody
	public Object list(@RequestParam(defaultValue="10",required=false)Integer pageSize,
			@RequestParam(defaultValue="10",required=false)Integer pageNum){
		Map searchMap = new HashMap();
		PageInfo page = villageProces.list(pageNum, pageSize, searchMap);
		return PageConvertUtil.grid(page);
		
	}
	
	@RequestMapping("load")
	@ResponseBody
	public Object load(String valiageCollId){
		return villageProces.load(valiageCollId);
		
	}
	
	@RequestMapping("insertOrUpdate")
	@ResponseBody
	public Object insertOrUpdate(VillageNameProces v){
		if(StringUtils.isEmpty(v.getId())){
			this.villageProces.insert(v);
		}else{
			this.villageProces.update(v);
		}
		return ResponseUtil.success();
	}
	@RequestMapping("delete")
	@ResponseBody
	public Object delete(String id){
		this.villageProces.delete(id);
		return ResponseUtil.success();
	}
	
	@RequestMapping("start")
	@ResponseBody
	public Object start(String id){
		run(id);
		return ResponseUtil.success();
	}
	@Async
	private void run(String id) {
		villageProces.run(id);
		
	}
	
	
	
}
