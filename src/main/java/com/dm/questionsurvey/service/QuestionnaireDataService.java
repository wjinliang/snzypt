package com.dm.questionsurvey.service;

import com.dm.questionsurvey.model.QuestionnaireData;

public interface QuestionnaireDataService {
	
	public QuestionnaireData save(QuestionnaireData questionnaireData);
	public void deleteByQuestionId(String id);
}
