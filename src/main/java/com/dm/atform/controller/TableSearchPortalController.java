package com.dm.atform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.atform.model.AtTableSearch;
import com.dm.atform.service.AtTableSearchService;
import com.dm.atform.service.MongoService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.github.pagehelper.PageInfo;

/**
 * 
 * @author root
 *
 */
@Controller
@RequestMapping("/portal")
public class TableSearchPortalController {

	@Autowired
	private AtTableSearchService tableSearchService;

	@Autowired
	private MongoService mongo;
	
	@RequestMapping("/data/{code}")
	@ResponseBody
	public Object data(
			@RequestParam(value = "pageNum", required = false,defaultValue="1") Integer pageNum,
			@RequestParam(value = "pageSize", required = false,defaultValue="100") Integer pageSize,
			@PathVariable("code") String code){
		if(StringUtils.isEmpty(code)){
			return ResponseUtil.success("code 不能为空");
		}
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
