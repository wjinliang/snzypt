package com.dm.questionsurvey.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.questionsurvey.model.QuestionnaireSuvery;
import com.dm.websurvey.model.WebSurvey;

public interface QuestionnaireSuveryMapper {

    int insert(QuestionnaireSuvery record);

    int insertSelective(QuestionnaireSuvery record);
    
    int deleteByPrimaryKey(String id);
    
    QuestionnaireSuvery selectByPrimaryKey(String id);
    
    int updateByPrimaryKeySelective(QuestionnaireSuvery record);
    
    int updateByPrimaryKey(QuestionnaireSuvery record);
    
	List<QuestionnaireSuvery> selectByArgMap(Map args);
	
	List<QuestionnaireSuvery> selectCountByWeibanjuType();
	

}