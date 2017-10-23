package com.dm.cms.service;

import org.springframework.stereotype.Service;

import com.dm.cms.model.CmsMessage;
import com.dm.cms.model.CmsReply;
import com.github.pagehelper.PageInfo;

@Service
public interface CmsMessageService {

	PageInfo<CmsMessage> findCmsMessageByPage(Integer pageNum, Integer pageSize,
			CmsMessage cmsMessage);

	PageInfo<CmsMessage> findCmsMessageByPageInfo(Integer pageNum, Integer pageSize,
			CmsMessage cmsMessage);
	
	void insert(CmsMessage cmsMessage);

	void delete(String ids);

	void updateRead(String id, Boolean isread);

	void updateStatus(String id, String statusPublish);

	CmsMessage loadOneInfo(String msgId);

	boolean reply(CmsReply cmsReply);

	
}
