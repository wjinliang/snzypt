package com.dm.cms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsTemplateConfig;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsTemplateConfigService;
import com.dm.cms.sqldao.CmsTemplateConfigMapper;
@Service
public class CmsTemplateConfigServiceImpl implements CmsTemplateConfigService{
	
	@Autowired
	private CmsTemplateConfigMapper cmsTemplateConfigMapper;
	@Autowired
	private CmsChannelService cmsChannelService;
	@Override
	public CmsTemplateConfig load(Integer siteId, Integer channelId) {
		CmsTemplateConfig c =null;
		if(channelId!=null){
			c = selectByChannelId(channelId);
		}else if(siteId!=null){
			c = selectBySiteId(siteId);
		}
		return c;
	}

	private CmsTemplateConfig selectBySiteId(Integer siteId) {
		CmsTemplateConfig c = cmsTemplateConfigMapper.selectBySiteId(siteId);
		if(c==null){
			c = new CmsTemplateConfig();
			c.setSiteId(siteId);
		}
		return c;
	}

	private CmsTemplateConfig selectByChannelId(Integer channelId) {
		CmsTemplateConfig c = cmsTemplateConfigMapper.selectByChannelId(channelId);
		if(c==null){
			CmsChannel channel  = cmsChannelService.findOneById(channelId);
			if(channel ==null){
				
			}else if(channel.getPid()!=null&&channel.getPid()!=0){
				c = selectByChannelId(channel.getPid());
			}else{
				c = selectBySiteId(channel.getSiteId());
			}
		}
		if(c==null){
			c = new CmsTemplateConfig();
		}
		c.setChannelId(channelId);
		c.setSiteId(null);
		return c;
	}

	@Override
	public void insertOrUpdateBySiteId(CmsTemplateConfig config) {
		CmsTemplateConfig c = this.cmsTemplateConfigMapper.selectBySiteId(config.getSiteId());
		if(c==null){
			this.cmsTemplateConfigMapper.insertSelective(config);
		}else{
			this.cmsTemplateConfigMapper.updateBySiteId(config);
		}
		
	}

	@Override
	public void insertOrUpdateByChannelId(CmsTemplateConfig config) {
		CmsTemplateConfig c = this.cmsTemplateConfigMapper.selectByChannelId(config.getChannelId());
		if(c==null){
			this.cmsTemplateConfigMapper.insertSelective(config);
		}else{
			this.cmsTemplateConfigMapper.updateByChannelId(config);
		}
		
	}

}
