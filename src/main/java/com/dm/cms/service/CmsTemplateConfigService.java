package com.dm.cms.service;

import com.dm.cms.model.CmsTemplateConfig;
/**
 * 
 * @project com.dm.cms.service.CmsTemplateConfigService.java
 * @author wjl
 * @createdate 2016年2月16日 下午4:20:31
 */
public interface CmsTemplateConfigService {
	/**
	 * siteId 与 channelId 选其一（channelId优先）
	 * @param siteId 站点id
	 * @param channelId
	 * @return
	 */
	CmsTemplateConfig load(Integer siteId, Integer channelId);

	void insertOrUpdateBySiteId(CmsTemplateConfig config);

	void insertOrUpdateByChannelId(CmsTemplateConfig config);
	
}
