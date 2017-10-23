package com.dm.websurvey.controller;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.platform.model.UserAccount;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SqlParam;
import com.dm.platform.util.UserAccountUtil;
import com.dm.websurvey.model.UserEmailConfig;
import com.dm.websurvey.model.WebSurvey;
import com.dm.websurvey.service.UserEmailConfigService;
import com.dm.websurvey.service.WebSurveyService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/websurvey")
public class WebSurveyController {

	@Value("${template.basePath}")
	String templateFolder;
	
	@Autowired
	WebSurveyService webSurveyService;
	
	@Autowired
	UserEmailConfigService userEmailConfigService;
	
	@RequestMapping("/page")
	public String webPage(Model model)
	{
		String userId = UserAccountUtil.getInstance().getCurrentUserId();
		UserEmailConfig userEmailConfig =  userEmailConfigService.findByUserId(userId);
		if(userEmailConfig!=null)
		{
		model.addAttribute("isShowIp", userEmailConfig.getIsShowIp());
		}
		return "/websurvey/page";
	}
	
	@RequestMapping("/sjpage")
	public String sjpage(Model model)
	{
		String userId = UserAccountUtil.getInstance().getCurrentUserId();
		UserEmailConfig userEmailConfig =  userEmailConfigService.findByUserId(userId);
		if(userEmailConfig!=null)
		{
		model.addAttribute("isShowIp", userEmailConfig.getIsShowIp());
		}
		return "/websurvey/sjpage";
	}
	
	@RequestMapping("/orgpage")
	public String orgpage(Model model)
	{
		String userId = UserAccountUtil.getInstance().getCurrentUserId();
		UserEmailConfig userEmailConfig =  userEmailConfigService.findByUserId(userId);
		if(userEmailConfig!=null)
		{
		model.addAttribute("isShowIp", userEmailConfig.getIsShowIp());
		}
		return "/websurvey/orgpage";
	}
	
	@RequestMapping("/shpage")
	public String shpage(Model model)
	{
		model.addAttribute("isShowIp", "1");
		return "/websurvey/shpage";
	}
	
	@RequestMapping("/replyPage")
	public String replyPage(Model model)
	{
		return "/websurvey/reply-page";
	}
	
	@RequestMapping("/updateRecontent")
	@ResponseBody
	public Map update(Model model,String id,String recontent,@RequestParam(value="isOpen",required=false) String isOpen)
	{
		webSurveyService.update(id, recontent,isOpen);
		return ResponseUtil.success("操作成功！");
	}
	
	@RequestMapping("/check")
	@ResponseBody
	public Map check(Model model,String id,String state)
	{
		webSurveyService.check(id, state);
		return ResponseUtil.success("操作成功！");
	}
	@RequestMapping("/toUser")
	@ResponseBody
	public Map toUser(Model model,String id,String touser)
	{	
		WebSurvey web = new WebSurvey();
		web.setId(id);
		web.setTouser(touser);
		webSurveyService.update(web);
		return ResponseUtil.success("操作成功！");
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Map update(Model model,String id)
	{
		webSurveyService.delete(id);
		return ResponseUtil.success("操作成功！");
	}
	
	@RequestMapping("/load")
	@ResponseBody
	public WebSurvey loadRecontent(Model model,String id)
	{
		return webSurveyService.findOne(id);
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Map list(Model model,WebSurvey searchEntity,Integer pageSize,Integer pageNum,String sort)
	{
		 sort = StringUtils.isEmpty(sort)?"inputDate_desc":sort;
		 UserAccount user = UserAccountUtil.getInstance().getCurrentUserAccount();
		 UserEmailConfig config =  userEmailConfigService.findByUserId(user.getCode());
		 Map map = new SqlParam<WebSurvey>().autoParam(searchEntity,sort);
		 if(config!=null){
			 map.put("config", config);
			String codes = config.getLeaderId();
			if(codes!=null && codes.contains(searchEntity.getCode())){
				PageInfo<WebSurvey> webSurveys = webSurveyService.selectRecordByArgMaps(pageNum,pageSize,map);
				return PageConvertUtil.grid(webSurveys);
			}
		 }
		 String toUser = user.getOrg()==null?null:user.getOrg().getId().toString();
		 if(toUser==null){
			 return PageConvertUtil.emptyGrid();
		 }
		 if(searchEntity.getCode()!=null&&searchEntity.getCode().equals("3")){
			 searchEntity.setCodeId(toUser);
		 }else{
			 map.put("toUser",toUser);
		 }
		PageInfo<WebSurvey> webSurveys = webSurveyService.selectRecordByArgMap(pageNum,pageSize,map);
		return PageConvertUtil.grid(webSurveys);
		/* if(searchEntity!=null)
		 {
		 if(searchEntity.getType().equals("5"))
		 {
			 List<String> types = new ArrayList<String>();
			 types.add("5");
			 map.put("type", types);
		     PageInfo<WebSurvey> webSurveys = webSurveyService.selectRecordByArgMap(pageNum,pageSize,map);
			 return PageConvertUtil.grid(webSurveys);
		 }
		 else{
		 if(config!=null)
		 {
			 List<String> toUsers = new ArrayList<String>();
			 if(!StringUtils.isEmpty(config.getLeaderId()))
			 {
			 toUsers.addAll(Arrays.asList(config.getLeaderId().split(",")));
			 }
			 if(!StringUtils.isEmpty(config.getOrgId()))
			 {
				 toUsers.addAll(Arrays.asList(config.getOrgId().split(",")));
			 }
			 String typeArray[] = searchEntity.getType().split(",");
			 map.put("type",Arrays.asList(typeArray));
		     map.put("codeId", toUsers);
		     map.put("state", searchEntity.getState());
			 map.put("code", searchEntity.getCode());
			PageInfo<WebSurvey> webSurveys = webSurveyService.selectRecordByArgMap(pageNum,pageSize,map);
			return PageConvertUtil.grid(webSurveys);
		 }
			 else
			 {
				return PageConvertUtil.emptyGrid();
			 }
		 }
	     }*/
	}
	
}
