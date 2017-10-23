package com.dm.cms.model;

import java.util.Date;

public class CmsComment {
    private Integer id;

    private String commentText;

    private Integer contentId;

    private Date commentTime;

    private String commentUserLoginName;

    private String commentUserName;

    private String commentUserAvatar;

    private Date createTime;

    private Integer createUser;

    private Date updateTime;

    private Boolean isActive;

    private String channelType;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText == null ? null : commentText.trim();
    }

    public Integer getContentId() {
        return contentId;
    }

    public void setContentId(Integer contentId) {
        this.contentId = contentId;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
    	
        this.commentTime = commentTime;
    }

    public String getCommentUserLoginName() {
        return commentUserLoginName;
    }

    public void setCommentUserLoginName(String commentUserLoginName) {
        this.commentUserLoginName = commentUserLoginName == null ? null : commentUserLoginName.trim();
    }

    public String getCommentUserName() {
        return commentUserName;
    }

    public void setCommentUserName(String commentUserName) {
        this.commentUserName = commentUserName == null ? null : commentUserName.trim();
    }

    public String getCommentUserAvatar() {
        return commentUserAvatar;
    }

    public void setCommentUserAvatar(String commentUserAvatar) {
        this.commentUserAvatar = commentUserAvatar == null ? null : commentUserAvatar.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getCreateUser() {
        return createUser;
    }

    public void setCreateUser(Integer createUser) {
        this.createUser = createUser;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    public String getChannelType() {
        return channelType;
    }

    public void setChannelType(String channelType) {
        this.channelType = channelType == null ? null : channelType.trim();
    }
}