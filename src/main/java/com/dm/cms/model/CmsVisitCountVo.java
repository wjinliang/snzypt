package com.dm.cms.model;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 
 * @project com.dm.cms.model.CmsVisitCountVo.java
 * @author wjl
 * @createdate 2016年1月9日 上午10:11:32
 */
public class CmsVisitCountVo {
	private String url;
	private Integer channelId;
	private String channelEnName;
	private Integer contentId;
	private String channelType;
	private Integer siteId;
	private String title;
	private int count;
	private Date date;
	private String dateStr;
	private String imageUrl;
	private int commentCount;
	private String author;
	private String sort;
	
	
	
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getChannelType() {
		return channelType;
	}
	public void setChannelType(String channelType) {
		this.channelType = channelType;
	}
	public String getChannelEnName() {
		return channelEnName;
	}
	public void setChannelEnName(String channelEnName) {
		this.channelEnName = channelEnName;
	}
	public Integer getSiteId() {
		return siteId;
	}
	public void setSiteId(Integer siteId) {
		this.siteId = siteId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getChannelId() {
		return channelId;
	}
	public void setChannelId(Integer channelId) {
		this.channelId = channelId;
	}
	public Integer getContentId() {
		return contentId;
	}
	public void setContentId(Integer contentId) {
		this.contentId = contentId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDateStr(){
		if(date==null){
			return dateStr;
		}
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String dateStr = sf.format(date);
		return dateStr;
	}
	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
		
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCount() {
		return count;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
}
