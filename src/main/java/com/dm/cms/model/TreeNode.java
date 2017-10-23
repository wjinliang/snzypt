package com.dm.cms.model;

import com.dm.platform.model.UserAccount;

/**
 * 
 * @project com.dm.cms.model.TreeNode.java
 * @author wjl
 * @createdate 2015年12月8日 上午9:23:41
 */
public class TreeNode {
	private String id;
	private String pId;
	private String name;
	private boolean checked;
	private boolean open;

	private String i;
	private String s;
	private boolean b;

	public TreeNode() {
	}

	/* 用户 */
	public TreeNode(UserAccount userEntity) {
		this.setId(userEntity.getCode());
		this.setName(userEntity.getName());
	}

	/* 站点 */
	public TreeNode(CmsSite siteEntity) {
		this.setId(String.valueOf(-siteEntity.getId()));
		this.setName(siteEntity.getDisplayName());
	}

	/* 频道 */
	public TreeNode(CmsChannel channelEntity) {
		this.setId(String.valueOf(channelEntity.getId()));
		this.setName(channelEntity.getDisplayName());
		this.setpId(String.valueOf(-channelEntity.getSiteId()));
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public String getI() {
		return i;
	}

	public void setI(String i) {
		this.i = i;
	}

	public String getS() {
		return s;
	}

	public void setS(String s) {
		this.s = s;
	}

	public boolean isB() {
		return b;
	}

	public void setB(boolean b) {
		this.b = b;
	}

}
