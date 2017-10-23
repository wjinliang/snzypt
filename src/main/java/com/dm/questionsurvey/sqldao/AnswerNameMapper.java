package com.dm.questionsurvey.sqldao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dm.questionsurvey.model.AnswerName;

public interface AnswerNameMapper {

    int insert(AnswerName AnswerName);
    List<Map<String,Object>> selectByTopicId(String id);
	String getPercent(@Param("topicId")String topicId, @Param("optionId")String optionId);
	List<String> selectNamesByTopicId(String id);
	String getNumber(String id);
	void deletyByTopicId(String id);
}