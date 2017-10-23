package com.dm.cms.model;
/**
 * 用户组
 * @project com.dm.cms.model.UserGroup.java
 * @author wjl
 * @createdate 2015年12月7日 下午6:22:26
 */
public class CmsUserGroup {
	private String id;

	private String name;

	private Long seq;
	
	private String userIds;
	
	private String siteIds;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id == null ? null : id.trim();
	}

	public String getUserIds() {
		return userIds;
	}

	public void setUserIds(String userIds) {
		this.userIds = userIds;
	}

	public String getSiteIds() {
		return siteIds;
	}

	public void setSiteIds(String siteIds) {
		this.siteIds = siteIds;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public Long getSeq() {
		return seq;
	}

	public void setSeq(Long seq) {
		this.seq = seq;
	}
}