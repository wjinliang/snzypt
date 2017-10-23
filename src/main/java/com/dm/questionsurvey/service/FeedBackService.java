package com.dm.questionsurvey.service;

import java.util.Map;

import com.dm.questionsurvey.model.FeedBack;
import com.github.pagehelper.PageInfo;

public interface FeedBackService {
	FeedBack add(FeedBack feedBack);
	public PageInfo<FeedBack> findFeedBackByPage(Integer pageNum,
			Integer pageSize, Map map);
	FeedBack findOne(String id);
	void delete(String id);
}
