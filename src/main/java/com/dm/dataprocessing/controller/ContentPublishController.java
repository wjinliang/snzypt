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
import com.dm.dataprocessing.model.ContentPublishProces;
import com.dm.dataprocessing.service.ContentPublishProcessingService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/contentPub")
public class ContentPublishController {

	@Autowired
	private  ContentPublishProcessingService publishProces;
	
	@Autowired
	private MongoService mongo;
	
	@RequestMapping("/page")
	public String page(){
		return "/processing/publish/page";
	}
	@RequestMapping("list")
	@ResponseBody
	public Object list(@RequestParam(defaultValue="10",required=false)Integer pageSize,
			@RequestParam(defaultValue="10",required=false)Integer pageNum){
		Map searchMap = new HashMap();
		PageInfo page = publishProces.list(pageNum, pageSize, searchMap);
		return PageConvertUtil.grid(page);
		
	}
	
	@RequestMapping("load")
	@ResponseBody
	public Object load(String valiageCollId){
		return publishProces.load(valiageCollId);
		
	}
	
	@RequestMapping("insertOrUpdate")
	@ResponseBody
	public Object insertOrUpdate(ContentPublishProces v){
		if(StringUtils.isEmpty(v.getId())){
			this.publishProces.insert(v);
		}else{
			this.publishProces.update(v);
		}
		return ResponseUtil.success();
	}
	@RequestMapping("delete")
	@ResponseBody
	public Object delete(String id){
		this.publishProces.delete(id);
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
		publishProces.run(id);
		
	}
	
	
	
}
