package com.dm.questionsurvey.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dm.questionsurvey.model.QuestionnaireName;
import com.dm.questionsurvey.model.QuestionnaireSuvery;
import com.dm.questionsurvey.service.QuestionnaireNameService;
import com.dm.questionsurvey.sqldao.QuestionnaireNameMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 问卷管理service实现层
 * @author zpp
 *
 */
@Service
public class QuestionnaireNameServiceImpl implements QuestionnaireNameService {
	
	@Resource
	QuestionnaireNameMapper questionnaireNameMapper;

	@Override
	public PageInfo<QuestionnaireName> findQuestionNameByPage(Integer pageNum, Integer pageSize, Map map) {
		PageHelper.startPage(pageNum, pageSize);
		List<QuestionnaireName> list = questionnaireNameMapper.selectByArgMap(map);
		PageInfo<QuestionnaireName> page = new PageInfo<QuestionnaireName>(list);
		return page;
	}

	@Override
	public QuestionnaireName findOne(String id) {
		return questionnaireNameMapper.selectByPrimaryKey(id);
	}

	@Override
	public QuestionnaireName save(QuestionnaireName questionnaireName) {
		questionnaireNameMapper.insert(questionnaireName);
		return questionnaireName;
	}
	@Override
	public  void deleteByPrimaryKey(String id){
		questionnaireNameMapper.deleteByPrimaryKey(id);
	}
}
