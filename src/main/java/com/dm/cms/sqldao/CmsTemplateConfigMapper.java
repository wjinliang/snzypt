package com.dm.cms.sqldao;

import com.dm.cms.model.CmsTemplateConfig;

public interface CmsTemplateConfigMapper {

    int insertSelective(CmsTemplateConfig record);

    CmsTemplateConfig selectByChannelId(Integer channelId);
    
    CmsTemplateConfig selectBySiteId(Integer siteId);

    int updateByChannelId(CmsTemplateConfig record);

    int updateBySiteId(CmsTemplateConfig record);
}