package com.dm.atform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.atform.model.AtTableSearch;
import com.dm.atform.service.AtTableSearchService;
import com.dm.atform.service.MongoService;
import com.dm.platform.service.LogService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SqlParam;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("tableSearch")
public class TableSearchController {

	@Autowired
	private AtTableSearchService tableSearchService;

	@Autowired
	private MongoService mongo;
	
	@Autowired
	private MongoTemplate mongoTemplate;

	@Autowired
	private LogService logService;
	
	@RequestMapping("/page")
	public String page(Model model) {
		return "/atform/search/page";
	}
	@RequestMapping("/gridlist")
	@ResponseBody
	public Object list(
			@RequestParam(value = "pageNum", required = false,defaultValue="1") Integer pageNum,
			@RequestParam(value = "pageSize", required = false,defaultValue="10") Integer pageSize,
			@RequestParam(value="sort" ,required = false,defaultValue="createDate_desc") String sort,
			AtTableSearch AtTableSearch){ 
		Map map =new SqlParam().autoParam(AtTableSearch, sort,pageNum,pageSize);
		PageInfo<AtTableSearch> page = this.tableSearchService.findByArg(map);
		return PageConvertUtil.grid(page);
	}
	@RequestMapping("/load")
	@ResponseBody
	public Object load(String id){
		return this.tableSearchService.findOne(id);
	}
	@RequestMapping("/loadCollections")
	@ResponseBody
	public Object loadCollections(){
		return this.mongo.loadCollections(); 
	}
	@RequestMapping("/insertOrUpdate")
	@ResponseBody
	public Object addOrUpdate(AtTableSearch AtTableSearch){
		if(AtTableSearch.getId()==null||AtTableSearch.getId().equals("")){
			this.tableSearchService.save(AtTableSearch);
		}else{
			this.tableSearchService.update(AtTableSearch);
		}
		return ResponseUtil.success();
	}
	@RequestMapping("delete")
	@ResponseBody
	public Object delte(AtTableSearch AtTableSearch){
		this.tableSearchService.delete(AtTableSearch.getId());
		return ResponseUtil.success();
	}
	@RequestMapping("/data/{code}")
	@ResponseBody
	public Object data(
			@RequestParam(value = "pageNum", required = false,defaultValue="1") Integer pageNum,
			@RequestParam(value = "pageSize", required = false,defaultValue="10") Integer pageSize,
			@PathVariable("code") String code){
		Map map0 = new HashMap(); 
		AtTableSearch record = new AtTableSearch();
		record.setCode(code);
		map0.put("model", record);
		map0.put("sort","create_date desc" );
		List<AtTableSearch> list = this.tableSearchService.findAllByArg(map0);
		if(list.size()==0){
			return ResponseUtil.error("code 不存在");
			
		}
		AtTableSearch tableName = list.get(0);
		PageInfo result = mongo.queryMulti(tableName, pageNum, pageSize);
		
		return PageConvertUtil.grid(result);
	}
}
