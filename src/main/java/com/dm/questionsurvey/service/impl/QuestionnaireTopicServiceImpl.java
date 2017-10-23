package com.dm.questionsurvey.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dm.questionsurvey.model.QuestionnaireTopic;
import com.dm.questionsurvey.service.QuestionnaireTopicService;
import com.dm.questionsurvey.sqldao.QuestionnaireTopicMapper;

@Service
public class QuestionnaireTopicServiceImpl implements QuestionnaireTopicService {
	
	@Resource
	QuestionnaireTopicMapper questionnaireTopicMapper;

	@Override
	public QuestionnaireTopic save(QuestionnaireTopic questionnaireTopic) {
		questionnaireTopicMapper.insert(questionnaireTopic);
		return questionnaireTopic;
	}

	/**
	 * 根据问卷id查询相关的题目信息
	 */
	@Override
	public List<QuestionnaireTopic> findByQuestionId(String questionId) {
		return questionnaireTopicMapper.findByQuestionnameId(questionId);
	}
	@Override
    public void deletyByTopicId(String id){
		questionnaireTopicMapper.deletyByTopicId(id);
	}
}
