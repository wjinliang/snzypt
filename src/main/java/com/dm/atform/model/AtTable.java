package com.dm.atform.model;

import java.util.Date;

public class AtTable {
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

	private String gridName;//数据名称

	private String idField;//主键ID

	private String dataTime;//数据采集时间
	
	private String dataUpdateTime;//数据更新时间
	
	private String origin;//数据来源
	
	private String org;//所属部门

	private Long dataCount;//i 数据总条数
	private String code;//数据编码

	private String pId;
	private String pTypeName;
	private Integer seq;
	private String type;//s 1分类  0数据
	private Integer visitCount;
	private Integer downloadCount;
	
	private Boolean isInsert;
	private Boolean isUpdate;
	private Boolean isDelete;
	private Boolean isDetail;
	private String set;
	private String showDataQuery;
	
	
	private String publicType;//公开方式
	private String shareType;//共享方式
	

	public String getSet() {
			String s = "";
			if(isInsert!=null && isInsert)s+="isInsert,";
			if(isUpdate!=null && isUpdate)s+="isUpdate,";
			if(isDelete!=null && isDelete)s+="isDelete,";
			if(isDetail!=null && isDetail)s+="isDetail";
			return s;
	}

	public void setSet(String set) {
		this.set = set;
	}

	public Boolean getIsInsert() {
		if(isInsert==null)
			if(set!=null && set.contains("isInsert"))
				return true;else return false;
		return isInsert;
	}

	public void setIsInsert(Boolean isInsert) {
		this.isInsert = isInsert;
	}

	public Boolean getIsUpdate() {
		if(isUpdate==null)
			if(set!=null && set.contains("isUpdate"))
				return true;else return false;
		return isUpdate;
	}

	public void setIsUpdate(Boolean isUpdate) {
		this.isUpdate = isUpdate;
	}

	public Boolean getIsDelete() {
		if(isDelete==null)
			if(set!=null && set.contains("isDelete"))
				return true;else return false;
		return isDelete == null ? false : isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

	public Boolean getIsDetail() {
		if(isDetail==null)
			if(set!=null && set.contains("isDetail"))
				return true;else return false;
		return isDetail == null ? true : isDetail;
	}
	public Integer getDownloadCount() {
		return downloadCount;
	}
	public void setDownloadCount(Integer downloadCount) {
		this.downloadCount = downloadCount;
	}	
	public void setIsDetail(Boolean isDetail) {
		this.isDetail = isDetail;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id == null ? null : id.trim();
	}

	public String getOrg() {
		return org;
	}

	public void setOrg(String org) {
		this.org = org;
	}

	public String getIdField() {
		return idField;
	}

	public void setIdField(String idField) {
		this.idField = idField;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
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

	public String getpTypeName() {
		return pTypeName;
	}

	public void setpTypeName(String pTypeName) {
		this.pTypeName = pTypeName;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser == null ? null : createUser.trim();
	}

	public String getGridName() {
		return gridName;
	}

	public void setGridName(String gridName) {
		this.gridName = gridName == null ? null : gridName.trim();
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDataTime() {
		return dataTime;
	}

	public void setDataTime(String dataTime) {
		this.dataTime = dataTime;
	}

	
	public String getDataUpdateTime() {
		return dataUpdateTime;
	}

	public void setDataUpdateTime(String dataUpdateTime) {
		this.dataUpdateTime = dataUpdateTime;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public Integer getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(Integer visitCount) {
		this.visitCount = visitCount;
	}

	public String getShowDataQuery() {
		return showDataQuery;
	}

	public void setShowDataQuery(String showDataQuery) {
		this.showDataQuery = showDataQuery;
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
	
	public String getPublicType() {
		return publicType;
	}

	public void setPublicType(String publicType) {
		this.publicType = publicType;
	}

	public String getShareType() {
		return shareType;
	}

	public void setShareType(String shareType) {
		this.shareType = shareType;
	}

	@Override
	public String toString() {
		
		if(type!=null&&type.equals("0")){
			return "数据表 [id=" + id + ", tableName=" + tableName + ", status="
					+ status + ", sortField=" + sortField + ", whereField="
					+ whereField + ", info=" + info + ", createDate=" + createDate
					+ ", createUser=" + createUser + ", gridName=" + gridName
					+ ", idField=" + idField + ", dataTime=" + dataTime
					+ ", dataUpdateTime=" + dataUpdateTime + ", origin=" + origin
					+ ", org=" + org + ", dataCount=" + dataCount + ", pId=" + pId
					+ ", seq=" + seq + ", type=" + type + ", visitCount="
					+ visitCount + ", isInsert=" + isInsert + ", isUpdate="
					+ isUpdate + ", isDelete=" + isDelete + ", isDetail="
					+ isDetail + ", showDataQuery="
					+ showDataQuery + "]";
		}
		if(type!=null&&type.equals("1")){
			return "分类 [id=" + id + ", status="
					+ status + ", info=" + info + ", createDate=" + createDate
					+ ", createUser=" + createUser + ", typeName=" + gridName
					+ ", pId=" + pId
					+ ", seq=" + seq + ", type=" + type + ", code=" + code +
					", shareType=" + shareType + ", publicType=" + publicType + "]";
		}
		return "AtTable [id=" + id + ", tableName=" + tableName + ", status="
				+ status + ", sortField=" + sortField + ", whereField="
				+ whereField + ", info=" + info + ", createDate=" + createDate
				+ ", createUser=" + createUser + ", gridName=" + gridName
				+ ", idField=" + idField + ", dataTime=" + dataTime
				+ ", dataUpdateTime=" + dataUpdateTime + ", origin=" + origin
				+ ", org=" + org + ", dataCount=" + dataCount + ", pId=" + pId
				+ ", seq=" + seq + ", type=" + type + ", visitCount="
				+ visitCount + ", isInsert=" + isInsert + ", isUpdate="
				+ isUpdate + ", isDelete=" + isDelete + ", isDetail="
				+ isDetail + ", showDataQuery="
				+ showDataQuery + "]";
	}
	
	

}