package com.dm.questionsurvey.service;

import java.util.Map;

import com.dm.questionsurvey.model.QuestionnaireName;
import com.dm.questionsurvey.model.QuestionnaireSuvery;
import com.github.pagehelper.PageInfo;

public interface QuestionnaireNameService {
	
	public PageInfo<QuestionnaireName> findQuestionNameByPage(Integer pageNum,Integer pageSize, Map map);
	
	public QuestionnaireName findOne(String id);
	
	public QuestionnaireName save(QuestionnaireName questionnaireName);
	
	public  void deleteByPrimaryKey(String id);

}
