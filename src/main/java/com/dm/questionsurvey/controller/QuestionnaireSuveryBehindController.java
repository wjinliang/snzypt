package com.dm.questionsurvey.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.module.model.OrgPerson;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SqlParam;
import com.dm.questionsurvey.model.QuestionnaireSuvery;
import com.dm.questionsurvey.service.QuestionnaireSuveryService;
import com.dm.websurvey.model.WebSurvey;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/question")
public class QuestionnaireSuveryBehindController {
	@Autowired
	QuestionnaireSuveryService questionSuveryService;

	@RequestMapping("/page")
	public String list(){
		return "/app/questionsurvey/page";
	}
	
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Object list(
			QuestionnaireSuvery questionnaireSuvery,
			@RequestParam(value = "pageNum", required = false) Integer pageNum,
			@RequestParam(value = "pageSize", required = false) Integer pageSize) {
		Map map = new SqlParam<QuestionnaireSuvery>().autoParam(questionnaireSuvery,null);
		map.put("model", questionnaireSuvery);
		PageInfo<QuestionnaireSuvery> page = questionSuveryService.findQuestionnaireSuveryByPage(
				pageNum, pageSize, map);
		return PageConvertUtil.grid(page);
	}
	@RequestMapping("/load")
	@ResponseBody
	public Object loadRecontent(Model model,String id)
	{
		return questionSuveryService.findOne(id);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Map update(Model model,String id)
	{
		questionSuveryService.delete(id);
		return ResponseUtil.success("操作成功！");
	}
	/**
	 * 新增问卷管理相关信息
	 */
	@RequestMapping("/add")
	public String addQuestionnarie(){
		return "/app/questionsurvey/add";
	}

}
