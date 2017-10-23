package com.dm.cms.model;

import java.util.Date;

import com.dm.platform.util.ConfigUtil;

public class CmsNovel {
    private Integer id;

    private Integer pid;

    private Integer channelId;
    
    private String type;//channelName

    private String name;

    private String author;

    private String createUserId;

    private String introduce;

    private Boolean isHtml;

    private Date publishDate;

    private Date createTime;

    private Date updateTime;

    private String status;

    private String isDownload;

    private String imageUrl;

    private String url;

    private String origin;

    private Integer templateId;

    private Integer seq;

	private String attachmentIds;
	
	private Integer count;
	
	private Integer commentCount;
	
	private String mUrl;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId == null ? null : createUserId.trim();
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getIsDownload() {
        return isDownload;
    }

    public void setIsDownload(String isDownload) {
        this.isDownload = isDownload == null ? null : isDownload.trim();
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl == null ? null : imageUrl.trim();
    }

    public String getUrl() {
    	if(isHtml!=null &&isHtml)
    		return url;
		String projectName = ConfigUtil.getConfigContent("cms", "projectName");
		return "/"+projectName+"/portal/content_novel/" + id + ".htm";
    }
    public String getmUrl() {
		if(isHtml!=null &&isHtml){
			String htmlPCFolder = ConfigUtil.getConfigContent("cms", "htmlDir");
			String htmlMobileFolder = ConfigUtil.getConfigContent("cms", "htmlMobileDir");
			return url.replace(htmlPCFolder, htmlPCFolder+htmlMobileFolder);
		}
		String projectName = ConfigUtil.getConfigContent("cms", "projectName");
		return "/"+projectName+"/portal/content_novel/" + id + ".htm";
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin == null ? null : origin.trim();
    }

    public Integer getTemplateId() {
        return templateId;
    }

    public void setTemplateId(Integer templateId) {
        this.templateId = templateId;
    }

    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }
    
    public String getAttachmentIds() {
    	return this.attachmentIds;
    }
    
	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds == null ? null : attachmentIds.trim();
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