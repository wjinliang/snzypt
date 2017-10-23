package com.dm.questionsurvey.service;

import java.util.List;
import java.util.Map;

import com.dm.questionsurvey.model.AnswerName;

public interface AnswerNameService {
	
	public AnswerName save(AnswerName answerName);
	public List<Map<String,Object>> selectByTopicId(String id);
	public String getPercent(String topicId,String optionId);
	public List<String> selectNamesByTopicId(String id);
	public String getNumber(String id);
	public void deletyByTopicId(String id);
}
