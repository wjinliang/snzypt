package com.dm.cms.model;

import java.util.Date;

import com.dm.platform.util.ConfigUtil;

public class CmsAudio {
    private Integer id;

    private Integer channelId;

    private String name;

    private String singer;

    private String introduce;

    private String origin;

    private String createUserId;

    private Date createTime;

    private Date publishDate;

    private Date updateTime;

    private String imageUrl;

    private Integer templateId;

    private String url;

    private String audioUrl;

    private Boolean isHtml;

    private Integer status;

    private Integer seq;

    private String lyrc;
    
    private String attachmentIds;
    
    private String type;
    
    private Integer count;
    
    private Integer commentCount;
    
    private String mUrl;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getChannelId() {
        return channelId;
    }

    public void setChannelId(Integer channelId) {
        this.channelId = channelId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getSinger() {
        return singer;
    }

    public void setSinger(String singer) {
        this.singer = singer == null ? null : singer.trim();
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin == null ? null : origin.trim();
    }

    public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId == null ? null : createUserId.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl == null ? null : imageUrl.trim();
    }

    public Integer getTemplateId() {
        return templateId;
    }

    public void setTemplateId(Integer templateId) {
        this.templateId = templateId;
    }

    public String getUrl() {
    	if(isHtml!=null &&isHtml)
    		return url;
		String projectName = ConfigUtil.getConfigContent("cms", "projectName");
		return "/"+projectName+"/portal/content_audio/" + id + ".htm";
    }
    public String getmUrl() {
    	String htmlPCFolder = ConfigUtil.getConfigContent("cms", "htmlDir");
    	String htmlMobileFolder = ConfigUtil.getConfigContent("cms", "htmlMobileDir");
    	if(isHtml!=null &&isHtml)
    		return url.replace(htmlPCFolder, htmlPCFolder+htmlMobileFolder);
		String projectName = ConfigUtil.getConfigContent("cms", "projectName");
		return "/"+projectName+"/portal/content_audio/" + id + ".htm";
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getAudioUrl() {
        return audioUrl;
    }

    public void setAudioUrl(String audioUrl) {
        this.audioUrl = audioUrl == null ? null : audioUrl.trim();
    }

    public Boolean getIsHtml() {
        return isHtml;
    }

    public void setIsHtml(Boolean isHtml) {
        this.isHtml = isHtml;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }

    public String getLyrc() {
        return lyrc;
    }

    public void setLyrc(String lyrc) {
        this.lyrc = lyrc == null ? null : lyrc.trim();
    }

	public String getAttachmentIds() {
		return attachmentIds;
	}

	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Integer commentCount) {
		this.commentCount = commentCount;
	}

	public void setmUrl(String mUrl) {
		this.mUrl = mUrl;
	}
}