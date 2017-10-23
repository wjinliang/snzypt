package com.dm.cms.model;

public class CmsTemplateConfig {
    private Integer channelId;

    private Integer siteId;

    private Integer siteTemplateId;

    private Integer channelTemplateId;

    private Integer contentTemplateId;

    public Integer getChannelId() {
        return channelId;
    }

    public void setChannelId(Integer channelId) {
        this.channelId = channelId;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public Integer getSiteTemplateId() {
        return siteTemplateId;
    }

    public void setSiteTemplateId(Integer siteTemplateId) {
        this.siteTemplateId = siteTemplateId;
    }

    public Integer getChannelTemplateId() {
        return channelTemplateId;
    }

    public void setChannelTemplateId(Integer channelTemplateId) {
        this.channelTemplateId = channelTemplateId;
    }

    public Integer getContentTemplateId() {
        return contentTemplateId;
    }

    public void setContentTemplateId(Integer contentTemplateId) {
        this.contentTemplateId = contentTemplateId;
    }
}