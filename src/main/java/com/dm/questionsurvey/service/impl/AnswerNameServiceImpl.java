package com.dm.questionsurvey.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dm.questionsurvey.model.AnswerName;
import com.dm.questionsurvey.service.AnswerNameService;
import com.dm.questionsurvey.sqldao.AnswerNameMapper;

@Service
public class AnswerNameServiceImpl implements AnswerNameService {
	
	@Resource
	AnswerNameMapper answerNameMapper;

	@Override
	public AnswerName save(AnswerName answerName) {
		answerNameMapper.insert(answerName);
		return answerName;
	}
	@Override
	public List<Map<String,Object>> selectByTopicId(String id){
		List<Map<String,Object>>list=answerNameMapper.selectByTopicId(id);
		return list;
	}
	@Override
	public String getPercent(String topicId,String optionId){
		String percent=answerNameMapper.getPercent( topicId, optionId);
		return percent;
	}
	@Override
	public List<String> selectNamesByTopicId(String id){
		List<String> list=answerNameMapper.selectNamesByTopicId(id);
		return list;
	}
	@Override
	public String getNumber(String id){
		String num=answerNameMapper.getNumber(id);
		return num;
	}
	
	@Override
	public void deletyByTopicId(String id){
		answerNameMapper.deletyByTopicId(id);
	};
}
