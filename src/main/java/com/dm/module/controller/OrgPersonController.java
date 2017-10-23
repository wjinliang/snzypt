package com.dm.module.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.module.model.OrgPerson;
import com.dm.module.service.OrgPersonService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SqlParam;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/orgPerson")
public class OrgPersonController {

	@Autowired
	private OrgPersonService orgPersonService;
	
	@RequestMapping("/page")
	public String page(){
		return "/module/orgperson/page";
	}
	
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Object list(
			OrgPerson orgPerson,
			@RequestParam(value = "pageNum", required = false) Integer pageNum,
			@RequestParam(value = "pageSize", required = false) Integer pageSize) {
		Map map = new SqlParam<OrgPerson>().autoParam(orgPerson,null);
		map.put("model", orgPerson);
		PageInfo<OrgPerson> page = orgPersonService.findOrgPersonByPage(
				pageNum, pageSize, map);
		return PageConvertUtil.grid(page);
	}
	@RequestMapping("/insertOrUpdate")
	@ResponseBody
	public Object insertOrUpdate( OrgPerson orgPerson){
		if(orgPerson.getId()!=null && !orgPerson.getId().equals("")){
			this.orgPersonService.update(orgPerson);
		}else{
			this.orgPersonService.insert(orgPerson);
		}
		return ResponseUtil.success();
	}
	@RequestMapping("/delete")
	@ResponseBody
	public Object delette(OrgPerson orgPerson){
		this.orgPersonService.delete(orgPerson);
		return ResponseUtil.success();
	}
	@RequestMapping("/load")
	@ResponseBody
	public Object load(String id){
		return this.orgPersonService.load(id);
	}
	@RequestMapping("/orgoption")
	@ResponseBody
	public Object orgOption(@RequestParam(value="required",required=false,defaultValue="false")Boolean required){
		return this.orgPersonService.loadOrgOption(required);
	}
	
	
}
