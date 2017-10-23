package com.dm.cms.model;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dm.platform.util.ConfigUtil;

public class CmsInterview {
    private Integer id;

    private String title;
    
    private String shortTitle;

    private String desc;

    private String startTime;

    private String endTime;

    private Date createTime;

    private Date updateTime;

    private String createUser;

    private String checkUser;

    private String status;

    private String isenable;

    private String guests;

    private String proposer;

    private String porposerPhone;

    private String porposerAddress;

    private String porposerOrg;

    private String url;

    private String filed2;

    private Integer channelId;
    private Map info = new HashMap();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    
    public String getShortTitle() {
    	if(shortTitle==null || shortTitle.equals(""))
    		return title;
		return shortTitle;
	}

	public void setShortTitle(String shortTitle) {
		this.shortTitle = shortTitle;
	}

	public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc == null ? null : desc.trim();
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
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

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser == null ? null : createUser.trim();
    }

    public String getCheckUser() {
        return checkUser;
    }

    public void setCheckUser(String checkUser) {
        this.checkUser = checkUser == null ? null : checkUser.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getIsenable() {
        return isenable;
    }

    public void setIsenable(String isenable) {
        this.isenable = isenable == null ? null : isenable.trim();
    }

    public String getGuests() {
        return guests;
    }

    public void setGuests(String guests) {
        this.guests = guests == null ? null : guests.trim();
    }

    public String getProposer() {
        return proposer;
    }

    public void setProposer(String proposer) {
        this.proposer = proposer == null ? null : proposer.trim();
    }

    public String getPorposerPhone() {
        return porposerPhone;
    }

    public void setPorposerPhone(String porposerPhone) {
        this.porposerPhone = porposerPhone == null ? null : porposerPhone.trim();
    }

    public String getPorposerAddress() {
        return porposerAddress;
    }

    public void setPorposerAddress(String porposerAddress) {
        this.porposerAddress = porposerAddress == null ? null : porposerAddress.trim();
    }

    public String getPorposerOrg() {
        return porposerOrg;
    }

    public void setPorposerOrg(String porposerOrg) {
        this.porposerOrg = porposerOrg == null ? null : porposerOrg.trim();
    }

    public String getUrl() {
    	String projectName = ConfigUtil.getConfigContent("cms","projectName");
		return "/"+projectName+"/portal/interview/"+id+".htm";
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getFiled2() {
        return filed2;
    }

    public void setFiled2(String filed2) {
        this.filed2 = filed2 == null ? null : filed2.trim();
    }

	public Integer getChannelId() {
		return channelId;
	}

	public void setChannelId(Integer channelId) {
		this.channelId = channelId;
	}

	public CmsInterview put(String key, Object value) {
		this.info.put(key, value);
		return this;
	}

	public Map getInfo() {
		return info;
	}

	public void setInfo(Map info) {
		this.info = info;
	}
    
}