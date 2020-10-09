package com.dm.atform.controller;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.atform.model.AtDatasourceApply;
import com.dm.atform.service.AtDatasourceApplyService;
import com.dm.cms.service.CmsChannelService;
import com.dm.platform.model.UserAccount;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SqlParam;
import com.dm.platform.util.UserAccountUtil;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("apply")
public class AtDatasourceApplyController {

	@Autowired
	CmsChannelService cmsChannelService;
	@Autowired
	private AtDatasourceApplyService atDatasourceApplyService;
	

	
	@RequestMapping("/page")
	public String page(){
		return "/atform/apply/page";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Object list(
			@RequestParam(value = "pageNum", required = false,defaultValue="1") Integer pageNum,
			@RequestParam(value = "pageSize", required = false,defaultValue="10") Integer pageSize,
			AtDatasourceApply atDatasourceApply){
		atDatasourceApply.setApplyUserId(UserAccountUtil.getInstance().getCurrentUserId());
		Map map =new SqlParam().autoParam(atDatasourceApply, "applyTime_desc",pageNum,pageSize);
		PageInfo<AtDatasourceApply> page = this.atDatasourceApplyService.findByArg(map);
		return PageConvertUtil.grid(page);
	}

	@RequestMapping("/checkList")
	@ResponseBody
	public Object checkList(
			@RequestParam(value = "pageNum", required = false,defaultValue="1") Integer pageNum,
			@RequestParam(value = "pageSize", required = false,defaultValue="10") Integer pageSize,
			AtDatasourceApply atDatasourceApply){
		Map map =new SqlParam().autoParam(atDatasourceApply, "applyTime_desc",pageNum,pageSize);
		PageInfo<AtDatasourceApply> page = this.atDatasourceApplyService.findByArg(map);
		return PageConvertUtil.grid(page);
	}
	
	@RequestMapping("/load")
	@ResponseBody
	public Object load(String id){
		return this.atDatasourceApplyService.findOne(id);
	}
	/*
	@RequestMapping("/insertOrUpdate")
	@ResponseBody
	public Object addOrUpdate(AtDatasourceApply atField){
		this.atDatasourceApplyService.saveOrUpdate(atField);
		return ResponseUtil.success();
	}*/
	@RequestMapping(value="/apply",method=RequestMethod.POST)
	@ResponseBody
	public Object apply(AtDatasourceApply model){
		model.setId(null);
		UserAccount cuser = UserAccountUtil.getInstance().getCurrentUserAccount();
		model.setCheckUser(null);
		model.setCheckTime(null);
		model.setCheckUserId(null);
		model.setCheckStatus("check");
		model.setApplyTime(new Date());
		model.setApplyUser(cuser.getUsername());
		model.setApplyUserId(cuser.getCode());
		model.setCheckOpinion(null);
		this.atDatasourceApplyService.saveOrUpdate(model);
		return ResponseUtil.success();
	}
	@RequestMapping("/check")
	@ResponseBody
	public Object check(String id,String status,String opinion){
		AtDatasourceApply model = new AtDatasourceApply();
		model.setId(id);
		UserAccount cuser = UserAccountUtil.getInstance().getCurrentUserAccount();
		model.setCheckUser(cuser.getName());
		model.setCheckTime(new Date());
		model.setCheckStatus(status);
		model.setCheckOpinion(opinion);
		model.setCheckUserId(cuser.getCode());
		this.atDatasourceApplyService.saveOrUpdate(model);
		return ResponseUtil.success();
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Object delte(AtDatasourceApply atField){
		this.atDatasourceApplyService.delete(atField.getId());
		return ResponseUtil.success();
	}
}
