package com.dm.questionsurvey.service;

import java.util.List;

import com.dm.questionsurvey.model.QuestionnaireOption;

public interface QuestionnaireOptionService {
	public QuestionnaireOption save(QuestionnaireOption questionnaireOption);
	
	/**根据题目查询相关的选项信息*/
	public List<QuestionnaireOption> findByQuestionTopicId(String topicId);
	//根据选项ID查询选项名称
	public String selectByOptionId(String id);
	
	public void deletyByTopicId(String id);
}
