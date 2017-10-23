package com.dm.websurvey.model;

public class UserEmailConfig {
    private String id;

    private String leaderId;

    private String orgId;

    private String userId;
    
    private String isShowIp;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getLeaderId() {
        return leaderId;
    }

    public void setLeaderId(String leaderId) {
        this.leaderId = leaderId == null ? null : leaderId.trim();
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId == null ? null : orgId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

	public String getIsShowIp() {
		return isShowIp;
	}

	public void setIsShowIp(String isShowIp) {
		this.isShowIp = isShowIp;
	}
    
}