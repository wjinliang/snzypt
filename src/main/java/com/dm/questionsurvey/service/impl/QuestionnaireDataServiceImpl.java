package com.dm.questionsurvey.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dm.questionsurvey.model.QuestionnaireData;
import com.dm.questionsurvey.service.QuestionnaireDataService;
import com.dm.questionsurvey.sqldao.QuestionnaireDataMapper;

@Service
public class QuestionnaireDataServiceImpl implements QuestionnaireDataService {
	
	@Resource
	QuestionnaireDataMapper questionnaireDataMapper;

	public QuestionnaireData save(QuestionnaireData questionnaireData) {
		questionnaireDataMapper.insert(questionnaireData);
		return questionnaireData;
	}
	@Override
	public void deleteByQuestionId(String id){
		questionnaireDataMapper.deleteByQuestionId(id);
	} 
}
