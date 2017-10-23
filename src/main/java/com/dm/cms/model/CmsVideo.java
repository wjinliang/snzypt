package com.dm.cms.model;

import java.util.Date;

import com.dm.platform.util.ConfigUtil;

public class CmsVideo {
    private Integer id;

    private Integer channelId;

    private String createUserId;

    private String name;
    
    private String shortName;

    private String origin;

    private String introduce;

    private String imageUrl;

    private String director;

    private String actor;

    private String url;

    private Boolean isHtml;

    private Date publishDate;

    private Date createTime;

    private Date updateTime;

    private Integer status;

    private Integer seq;

    private String videoUrl;
    
    private String attachmentIds;
    
    private Integer templateId;
    
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

    public String getShortName() {
    	if(shortName==null || shortName.equals(""))
    		return name;
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public Integer getChannelId() {
		return channelId;
	}

	public void setChannelId(Integer channelId) {
		this.channelId = channelId;
	}

	public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId == null ? null : createUserId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin == null ? null : origin.trim();
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl == null ? null : imageUrl.trim();
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director == null ? null : director.trim();
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor == null ? null : actor.trim();
    }

    public String getUrl() {
    	if(isHtml!=null && isHtml)
    	{
    		return url;
    	}else
    	{
			String projectName = ConfigUtil.getConfigContent("cms", "projectName");
			return "/"+projectName+"/portal/content_video/" + id + ".htm";
    	}
    }
    public String getmUrl() {
		 if(isHtml!=null && isHtml)
			{
			 String htmlPCFolder = ConfigUtil.getConfigContent("cms", "htmlDir");
			 String htmlMobileFolder = ConfigUtil.getConfigContent("cms", "htmlMobileDir");
			 return url.replace(htmlPCFolder, htmlPCFolder+htmlMobileFolder);
			}
			else
			{
				String projectName = ConfigUtil.getConfigContent("cms", "projectName");
				return "/"+projectName+"/portal/content_video/" + id + ".htm";
			}
	    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Boolean getIsHtml() {
        return isHtml;
    }

    public void setIsHtml(Boolean isHtml) {
        this.isHtml = isHtml;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
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

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl == null ? null : videoUrl.trim();
    }

	public String getAttachmentIds() {
		return attachmentIds;
	}

	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds;
	}

	public Integer getTemplateId() {
		return templateId;
	}

	public void setTemplateId(Integer templateId) {
		this.templateId = templateId;
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