package com.dm.questionsurvey.service;

import java.util.List;

import com.dm.questionsurvey.model.QuestionnaireTopic;

public interface QuestionnaireTopicService {
	public QuestionnaireTopic save(QuestionnaireTopic questionnaireTopic);
	
    public List<QuestionnaireTopic> findByQuestionId(String questionId);
   
    public void deletyByTopicId(String id);

}
