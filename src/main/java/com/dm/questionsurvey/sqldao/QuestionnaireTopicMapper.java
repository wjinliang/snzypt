package com.dm.questionsurvey.sqldao;

import java.util.List;

import com.dm.questionsurvey.model.QuestionnaireTopic;

public interface QuestionnaireTopicMapper {
	
	int insert(QuestionnaireTopic questionnaireTopic);
	
	/*根据调查管理id查询相关的题目信息*/
	List<QuestionnaireTopic> findByQuestionnameId(String id);
    
	void deletyByTopicId(String id);

}