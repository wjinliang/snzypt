package com.dm.questionsurvey.service;

import java.util.List;
import java.util.Map;

import com.dm.questionsurvey.model.QuestionnaireSuvery;
import com.dm.websurvey.model.WebSurvey;
import com.github.pagehelper.PageInfo;

public interface QuestionnaireSuveryService {
	QuestionnaireSuvery add(QuestionnaireSuvery questionnaireSuvery);
	void deleteByPrimaryKey(String id);
	public PageInfo<QuestionnaireSuvery> findQuestionnaireSuveryByPage(Integer pageNum,
			Integer pageSize, Map map);
	QuestionnaireSuvery findOne(String id);
	void delete(String id);
	List<QuestionnaireSuvery> selectByArgMap(Map map);
	List<QuestionnaireSuvery> selectCountByWeibanjuType();

}
