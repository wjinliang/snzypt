package com.dm.cms.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CmsQuestionnaires {
    private Integer id;

    private String title;
    
    private String shortTitle;

    private String description;

    private Date startTime;

    private Date endTime;

    private Date createTime;

    private Date publishTime;

    private String status;

    private String url;

    private String isHtml;
    
    private List<CmsVote> votes;
    
    
    public List<CmsVote> getVotes() {
		return votes;
	}

	public String getShortTitle() {
		return shortTitle;
	}

	public void setShortTitle(String shortTitle) {
		this.shortTitle = shortTitle;
	}

	public void setVotes(List<CmsVote> votes) {
		this.votes = votes;
	}
	public void add(CmsVote vote) {
		if(votes==null){
			votes = new ArrayList<CmsVote>();
		}
		votes.add(vote);
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

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getIsHtml() {
        return isHtml;
    }

    public void setIsHtml(String isHtml) {
        this.isHtml = isHtml == null ? null : isHtml.trim();
    }
}