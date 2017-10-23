package com.dm.cms.model;

import java.util.Date;
import java.util.List;

import com.dm.platform.util.ConfigUtil;

public class CmsVote {
    private Integer id;

    private String title;
    
    private String shortTitle;

    private Integer questionnairesId;
    
    private Integer channelId;

    private String description;

    private String checkType;//0单选 1多选

    private String status;

    private String startTime;

    private String endTime;

    private Boolean isResult;

    private Date createTime;

    private Integer clickCount;

    private String createUser;

    private String publishTime;

    private String filed1;//url

    private String filed2;//模板

    private String filed3;//投票人数

    private String filed4;
    
    private List<CmsVoteOption> option;
    
    public String getShortTitle() {
    	if(shortTitle==null || shortTitle.equals(""))
    		return title;
		return shortTitle;
	}

	public void setShortTitle(String shortTitle) {
		this.shortTitle = shortTitle;
	}

	public List<CmsVoteOption> getOption() {
		return option;
	}

	public void setOption(List<CmsVoteOption> option) {
		this.option = option;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public Integer getChannelId() {
		return channelId;
	}

	public void setChannelId(Integer channelId) {
		this.channelId = channelId;
	}

	public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getQuestionnairesId() {
		return questionnairesId;
	}

	public void setQuestionnairesId(Integer questionnairesId) {
		this.questionnairesId = questionnairesId;
	}

	public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getCheckType() {
        return checkType;
    }

    public void setCheckType(String checkType) {
        this.checkType = checkType == null ? null : checkType.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime == null ? null : startTime.trim();
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime == null ? null : endTime.trim();
    }

    public Boolean getIsResult() {
        return isResult;
    }

    public void setIsResult(Boolean isResult) {
        this.isResult = isResult;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getClickCount() {
        return clickCount;
    }

    public void setClickCount(Integer clickCount) {
        this.clickCount = clickCount;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser == null ? null : createUser.trim();
    }

    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }
    /**url**/
    public String getFiled1() {
    	String projectName = ConfigUtil.getConfigContent("cms","projectName");
		return "/"+projectName+"/portal/vote/"+id+".htm";
    }
    /**url**/
    public void setFiled1(String filed1) {
        this.filed1 = filed1 == null ? null : filed1.trim();
    }
    /**模板ID**/
    public String getFiled2() {
        return filed2;
    }
    /**模板ID**/
    public void setFiled2(String filed2) {
        this.filed2 = filed2 == null ? null : filed2.trim();
    }
    /**投票总人数**/
    public String getFiled3() {
        return filed3;
    }
    /**投票总人数**/
    public void setFiled3(String filed3) {
        this.filed3 = filed3 == null ? null : filed3.trim();
    }

    public String getFiled4() {
        return filed4;
    }

    public void setFiled4(String filed4) {
        this.filed4 = filed4 == null ? null : filed4.trim();
    }
}