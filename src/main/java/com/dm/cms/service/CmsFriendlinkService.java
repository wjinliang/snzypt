package com.dm.cms.service;

import com.dm.cms.model.CmsFriendlink;
import com.github.pagehelper.PageInfo;


public interface CmsFriendlinkService {

	PageInfo<CmsFriendlink> findCmsFriendlinkByPage(Integer pageNum, Integer pageSize,
			CmsFriendlink cmsFriendlink);

	CmsFriendlink loadById(Integer id);

	void insert(CmsFriendlink cmsFriendlink);

	void update(CmsFriendlink cmsFriendlink);

	void delete(Integer id);

	void setIsShow(Long id);
	
}
