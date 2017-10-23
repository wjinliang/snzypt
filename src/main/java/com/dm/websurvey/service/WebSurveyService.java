package com.dm.websurvey.service;

import java.util.List;
import java.util.Map;

import com.dm.websurvey.model.WebSurvey;
import com.github.pagehelper.PageInfo;

public interface WebSurveyService {

	WebSurvey add(WebSurvey webSurvey);

	void update(String id, String reContent, String isOpen);

	PageInfo<WebSurvey> selectRecordByArgMap(int pageNum,int pageSize,Map args);

	WebSurvey findOne(String id);

	void delete(String id);

	void update(WebSurvey webSur);

	void check(String id, String state);

	PageInfo<WebSurvey> selectRecordByArgMaps(Integer pageNum,
			Integer pageSize, Map map);


}
