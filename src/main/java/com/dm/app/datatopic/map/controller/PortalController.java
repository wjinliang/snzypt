package com.dm.app.datatopic.map.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.atform.model.AtTable;
import com.dm.atform.service.MongoService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/portal/map")
public class PortalController {
	
	@Autowired
	private MongoService mongoService;
	
	@RequestMapping("/list")
	@ResponseBody
	public Object list(String tableName,
			@RequestParam(value="pageNum",defaultValue="1",required=false) Integer pageNum,
			@RequestParam(value="pageSize",defaultValue="30",required=false) Integer pageSize,
			@RequestParam(value="sort",required=false) String sort,
			@RequestParam(value="fileds",required=false) String fileds){
		AtTable atTable = new AtTable();
		atTable.setTableName(tableName);
		Map<String,Object> searchMap = new HashMap();
		PageInfo page = mongoService.queryMulti2(atTable, pageNum, pageSize,fileds, searchMap, sort);
		return page;
	}
}
