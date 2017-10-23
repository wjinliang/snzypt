package com.dm.questionsurvey.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
import com.dm.questionsurvey.model.QuestionnaireOption;
import com.dm.questionsurvey.model.QuestionnaireTopic;
import com.dm.questionsurvey.service.QuestionnaireOptionService;
import com.dm.questionsurvey.service.QuestionnaireTopicService;

/**
 * 问卷管理web端相关的页面
 * @author Lenovo
 *
 */
@Controller
@RequestMapping("/portal/questionnaireManager")
public class QuestionnaireManagerWebController {
	@Autowired
	private CmsSiteService siteService;
	@Autowired
	private QuestionnaireTopicService questionnaireTopicService;
	@Autowired
	private QuestionnaireOptionService questionnaireOptionService;
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/list.htm")
	public String survey(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 4);
		String questionNameId=request.getParameter("id");
		//根据问卷名称查询相关的topic信息
		List<QuestionnaireTopic> topicList=questionnaireTopicService.findByQuestionId(questionNameId);
		if(topicList!=null && topicList.size()>0){
			for(QuestionnaireTopic t:topicList){
				List<QuestionnaireOption> optionList=questionnaireOptionService.findByQuestionTopicId(t.getTopicId());
				t.setOptions(optionList);
			}
		}
		request.setAttribute("topicList", topicList);
		request.setAttribute("questionNameId", questionNameId);
		return "/template/sn_questionnaire_name";
	}

}
