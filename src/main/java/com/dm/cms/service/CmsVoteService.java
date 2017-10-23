package com.dm.cms.service;

import java.util.List;
import java.util.Map;

import com.dm.cms.model.CmsVote;
import com.dm.cms.model.CmsVoteOption;
import com.github.pagehelper.PageInfo;

public interface CmsVoteService {

	PageInfo<CmsVote> findPage(Integer pageNum, Integer pageSize, Map map);

	void insert(CmsVote record);

	void update(CmsVote record);

	void updateStatus(Integer id, String string);

	PageInfo<CmsVoteOption> findOptPage(Integer pageNum, Integer pageSize, Map map);

	void insertOpt(CmsVoteOption record);

	void updateOpt(CmsVoteOption record);

	void deleteOpt(Integer id);

	void commitCheck(Integer voteId, String optionIds);

	CmsVote findOne(Integer id);
	CmsVoteOption findOneOpt(Integer id);

	List<CmsVoteOption> loadOpt(Integer voteId);

	List<CmsVote> listByQtionId(Integer id);
}