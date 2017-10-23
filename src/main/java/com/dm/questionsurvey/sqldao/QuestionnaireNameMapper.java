package com.dm.questionsurvey.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.questionsurvey.model.QuestionnaireName;
import com.dm.questionsurvey.model.QuestionnaireSuvery;

public interface QuestionnaireNameMapper {
	
	List<QuestionnaireName> selectByArgMap(Map args);
	
	QuestionnaireName selectByPrimaryKey(String id);
	
	int insert(QuestionnaireName questionnaireName);

    void deleteByPrimaryKey(String id);
	

}