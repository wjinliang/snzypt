package com.dm.questionsurvey.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dm.module.model.OrgPerson;
import com.dm.questionsurvey.model.QuestionnaireSuvery;
import com.dm.questionsurvey.service.QuestionnaireSuveryService;
import com.dm.questionsurvey.sqldao.QuestionnaireSuveryMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 问卷调差service实现层
 * @author Lenovo
 *
 */
@Service
public class QuestionnaireSuveryServiceImpl implements QuestionnaireSuveryService {
	
	@Resource
	QuestionnaireSuveryMapper questionSuveryMapper;

	@Override
	public QuestionnaireSuvery add(QuestionnaireSuvery questionnaireSuvery) {
		questionnaireSuvery.setId(System.currentTimeMillis()+""+((int)(Math.random()*9000+1000)));
		//questionnaireSuvery.setInputDate(new Date());
		questionnaireSuvery.setDate(new Date());
		questionSuveryMapper.insertSelective(questionnaireSuvery);
		return questionnaireSuvery;
	}

	@Override
	public void deleteByPrimaryKey(String id) {
		questionSuveryMapper.deleteByPrimaryKey(id);
	}

	@Override
	public PageInfo<QuestionnaireSuvery> findQuestionnaireSuveryByPage(Integer pageNum, Integer pageSize, Map map) {
		PageHelper.startPage(pageNum, pageSize);
		List<QuestionnaireSuvery> list = questionSuveryMapper.selectByArgMap(map);
		PageInfo<QuestionnaireSuvery> page = new PageInfo<QuestionnaireSuvery>(list);
		return page;
	}

	@Override
	public QuestionnaireSuvery findOne(String id) {
		return questionSuveryMapper.selectByPrimaryKey(id);
	}

	@Override
	public void delete(String id) {
		questionSuveryMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<QuestionnaireSuvery> selectByArgMap(Map map) {
		return questionSuveryMapper.selectByArgMap(map);
	}

	@Override
	public List<QuestionnaireSuvery> selectCountByWeibanjuType() {
		return questionSuveryMapper.selectCountByWeibanjuType();
	}




}
