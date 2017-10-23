package com.dm.cms.model;

import java.util.Date;
import java.util.List;

public class CmsMessage {
	
	public static final boolean ISREAD_NO =false;
	public static final boolean ISREAD_YES =true;
	public static final String STATUS_NEW ="0";
	public static final String STATUS_PUBLISH ="2";
	public static final String STATUS_DELETE ="9";
	
    private String id;

    private String type;

    private String msgTitle;

    private String msgContent;

    private Date createTime;

    private String msgKey;

    private String msgFromUserId;

    private String status;

    private Boolean isRead;

    private Boolean isReplied;
    
    private Integer siteId;
    
    private List<CmsReply> cmsReplys;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getMsgTitle() {
        return msgTitle;
    }

    public void setMsgTitle(String msgTitle) {
        this.msgTitle = msgTitle == null ? null : msgTitle.trim();
    }

    public String getMsgContent() {
        return msgContent;
    }

    public void setMsgContent(String msgContent) {
        this.msgContent = msgContent == null ? null : msgContent.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getMsgKey() {
        return msgKey;
    }

    public void setMsgKey(String msgKey) {
        this.msgKey = msgKey == null ? null : msgKey.trim();
    }

    public String getMsgFromUserId() {
        return msgFromUserId;
    }

    public void setMsgFromUserId(String msgFromUserId) {
        this.msgFromUserId = msgFromUserId == null ? null : msgFromUserId.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

	public Boolean getIsRead() {
		return isRead;
	}

	public void setIsRead(Boolean isRead) {
		this.isRead = isRead;
	}

	public Boolean getIsReplied() {
		return isReplied;
	}

	public void setIsReplied(Boolean isReplied) {
		this.isReplied = isReplied;
	}

	public List<CmsReply> getCmsReplys() {
		return cmsReplys;
	}

	public void setCmsReplys(List<CmsReply> cmsReplys) {
		this.cmsReplys = cmsReplys;
	}
    

}