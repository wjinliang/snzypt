package com.dm.questionsurvey.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dm.questionsurvey.model.QuestionnaireOption;
import com.dm.questionsurvey.service.QuestionnaireOptionService;
import com.dm.questionsurvey.sqldao.QuestionnaireNameMapper;
import com.dm.questionsurvey.sqldao.QuestionnaireOptionMapper;

@Service
public class QuestionnaireOptionServiceImpl implements QuestionnaireOptionService {
	
	@Resource
	QuestionnaireOptionMapper questionnaireOptionMapper;

	@Override
	public QuestionnaireOption save(QuestionnaireOption questionnaireOption) {
		questionnaireOptionMapper.insert(questionnaireOption);
		return questionnaireOption;
	}

	@Override
	public List<QuestionnaireOption> findByQuestionTopicId(String topicId) {
		return questionnaireOptionMapper.findByQuestiontopicId(topicId);
	}
	@Override
	public String selectByOptionId(String id){
		return  questionnaireOptionMapper.selectByOptionId(id);
	}
	@Override
	public void deletyByTopicId(String id){
		questionnaireOptionMapper.deletyByTopicId(id);
	}
}
