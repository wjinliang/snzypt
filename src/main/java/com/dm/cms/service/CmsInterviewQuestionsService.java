package com.dm.cms.service;

import com.dm.cms.model.CmsInterviewQuestions;

public interface CmsInterviewQuestionsService {

	void updateSelective(CmsInterviewQuestions temp);
	
	void insert(CmsInterviewQuestions record);

	CmsInterviewQuestions load(Integer id);

}
