package com.dm.cms.service;

import java.util.Map;

import com.dm.cms.model.CmsQuestionnaires;
import com.github.pagehelper.PageInfo;

public interface CmsQuestionnairesService {

	PageInfo<CmsQuestionnaires> findByPage(Integer pageNum, Integer pageSize,
			Map map);

	void update(CmsQuestionnaires microcobol);

	void insert(CmsQuestionnaires microcobol);

	void delete(Integer id);

	CmsQuestionnaires load(Integer id);

	void updateStatus(Integer id, String status);
	
	CmsQuestionnaires loadWithVote(Integer id);

}
