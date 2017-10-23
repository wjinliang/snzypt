package com.dm.questionsurvey.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dm.questionsurvey.model.FeedBack;
import com.dm.questionsurvey.model.QuestionnaireSuvery;
import com.dm.questionsurvey.service.FeedBackService;
import com.dm.questionsurvey.sqldao.FeedBackMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 问卷调差service实现层
 * @author Lenovo
 *
 */
@Service
public class FeedBackServiceImpl implements FeedBackService {
	
	@Resource
	FeedBackMapper feedBackMapper;

	@Override
	public FeedBack add(FeedBack feedBack) {
		feedBack.setId(System.currentTimeMillis()+""+((int)(Math.random()*9000+1000)));
		feedBack.setDate(new Date());
		feedBackMapper.insertSelective(feedBack);
		return feedBack;
	}

	@Override
	public PageInfo<FeedBack> findFeedBackByPage(Integer pageNum, Integer pageSize, Map map) {
		PageHelper.startPage(pageNum, pageSize);
		List<FeedBack> list = feedBackMapper.selectByArgMap(map);
		PageInfo<FeedBack> page = new PageInfo<FeedBack>(list);
		return page;
	}

	@Override
	public FeedBack findOne(String id) {
		return feedBackMapper.selectByPrimaryKey(id);
	}

	@Override
	public void delete(String id) {
		feedBackMapper.deleteByPrimaryKey(id);
	}



}
