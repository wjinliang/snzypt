package com.dm.websurvey.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.websurvey.model.WebSurvey;

public interface WebSurveyMapper {
    int deleteByPrimaryKey(String id);

    int insert(WebSurvey record);

    int insertSelective(WebSurvey record);

    WebSurvey selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WebSurvey record);

    int updateByPrimaryKey(WebSurvey record);

	List<WebSurvey> selectRecordByArgMap(Map args);
	
	List<WebSurvey> selectRecordByArgMaps(Map args);
}