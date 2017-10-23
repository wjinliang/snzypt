package com.dm.cms.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dm.cms.model.CmsInterviewQuestions;
import com.dm.cms.service.CmsInterviewQuestionsService;
import com.dm.cms.sqldao.CmsInterviewQuestionsMapper;

@Service
public class CmsInterviewQuestionsServiceImpl implements CmsInterviewQuestionsService{

	
	@Autowired
	private CmsInterviewQuestionsMapper queMapper;

	@Override
	public void updateSelective(CmsInterviewQuestions temp) {
		this.queMapper.updateByPrimaryKeySelective(temp);
		
	}

	@Override
	public void insert(CmsInterviewQuestions record) {
		init(record);
		this.queMapper.insert(record);
	}

	private void init(CmsInterviewQuestions record) {
		record.setCreateTime(new Date());
		record.setStatus("0");
	}

	@Override
	public CmsInterviewQuestions load(Integer id) {
		return this.queMapper.selectByPrimaryKey(id);
	}
	
	
}
