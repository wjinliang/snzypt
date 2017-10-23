package com.dm.websurvey.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.platform.util.ResponseUtil;
import com.dm.websurvey.model.UserEmailConfig;
import com.dm.websurvey.service.UserEmailConfigService;


@Controller
@RequestMapping("/email/config")
public class UserEmailConfigController {

	@Autowired
	UserEmailConfigService userEmailConfigService;
	
	@RequestMapping("/addOrUpdate")
	@ResponseBody
	public Map add(String userId,String leaderId,String orgId,String isShowIp)
	{
		userEmailConfigService.addOrUpdate(userId, leaderId, orgId,isShowIp);
		return ResponseUtil.success("操作成功！");
	}
	
	@RequestMapping("loadByUserId")
	@ResponseBody
	public UserEmailConfig loadByUserId(String userId)
	{
        UserEmailConfig userEmailConfig = userEmailConfigService.findByUserId(userId);
		return userEmailConfig;
	}
}
