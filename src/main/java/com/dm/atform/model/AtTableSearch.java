package com.dm.atform.model;

import java.util.Date;

public class AtTableSearch {
//	public static final String deletes="9";
//	public static final String forbiddens="0";
//	public static final String defaults="1";
	
	private String id;

	private String tableName;//表名

	private String status;//0 新建(禁用) 1 可用 9 删除

	private String sortField;//默认排序

	private String whereField;//默认过滤条件

	private String info;//数据介绍

	private Date createDate;//创建时间

	private String createUser;//创建用户

	private String searchName;//数据名称

	private String idField;//主键ID
	private Long dataCount;//i 数据总条数
	private String code;//数据编码

	private String type;//s 1分类  0数据
	private Integer searchCount;
	private String searchField;
	
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id == null ? null : id.trim();
	}

	public String getIdField() {
		return idField;
	}

	public void setIdField(String idField) {
		this.idField = idField;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName == null ? null : tableName.trim();
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status == null ? null : status.trim();
	}

	public String getSortField() {
		return sortField;
	}

	public void setSortField(String sortField) {
		this.sortField = sortField == null ? null : sortField.trim();
	}

	public String getWhereField() {
		return whereField;
	}

	public void setWhereField(String whereField) {
		this.whereField = whereField == null ? null : whereField.trim();
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info == null ? null : info.trim();
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser == null ? null : createUser.trim();
	}


	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Long getDataCount() {
		return dataCount;
	}

	public void setDataCount(Long s) {
		this.dataCount = s;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	public Integer getSearchCount() {
		return searchCount;
	}
	public void setSearchCount(Integer searchCount) {
		this.searchCount = searchCount;
	}
	public String getSearchField() {
		return searchField;
	}
	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}
	

}