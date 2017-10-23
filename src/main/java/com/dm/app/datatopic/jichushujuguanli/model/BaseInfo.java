package com.dm.app.datatopic.jichushujuguanli.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection="h_TB_BaseInfo")
public class BaseInfo  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6711139025796569983L;

	@Id
	//@Indexed
	private String id;
	
	@Field("BaseInfo_ID")
	private Integer baseInfoId;
	@Field("Area_QXID")
	private String areaQxid;//区县名称
	@Field("Area_XzID")
	private String areaXzid;//乡镇名称
	@Field("Area_CjID")
	private String areaCjid;//行政村名称
	@Field("BaseInfo_IDNumber")
	private String baseInfoIDNumber;//身份证
	@Field("BaseInfo_Name")
	private String caseInfoName;//姓名
	@Field("BaseInfo_Sex")
	private String sex;//性别
	@Field("BaseInfo_Birthday")
	private Date baseInfoBirthday;//生日
	@Field("BaseInfo_Cydz")
	private String baseInfoCydz;//常用地址
	@Field("BaseInfo_Phone")
	private String baseInfoPhone;//电话
	@Field("BaseInfo_CellPhone")
	private String baseInfoCellPhone;//电话
	@Field("BaseInfo_Byyx")
	private String baseInfoByyx;//毕业院校
	@Field("BaseInfo_Address")
	private String baseInfoAddress;//地址
	

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public Integer getBaseInfoId() {
		return baseInfoId;
	}


	public void setBaseInfoId(Integer baseInfoId) {
		this.baseInfoId = baseInfoId;
	}


	public String getAreaQxid() {
		return areaQxid;
	}


	public void setAreaQxid(String areaQxid) {
		this.areaQxid = areaQxid;
	}


	public String getAreaXzid() {
		return areaXzid;
	}


	public void setAreaXzid(String areaXzid) {
		this.areaXzid = areaXzid;
	}


	public String getAreaCjid() {
		return areaCjid;
	}


	public void setAreaCjid(String areaCjid) {
		this.areaCjid = areaCjid;
	}


	public String getBaseInfoIDNumber() {
		return baseInfoIDNumber;
	}


	public void setBaseInfoIDNumber(String baseInfoIDNumber) {
		this.baseInfoIDNumber = baseInfoIDNumber;
	}


	public String getCaseInfoName() {
		return caseInfoName;
	}


	public void setCaseInfoName(String caseInfoName) {
		this.caseInfoName = caseInfoName;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public Date getBaseInfoBirthday() {
		return baseInfoBirthday;
	}


	public void setBaseInfoBirthday(Date baseInfoBirthday) {
		this.baseInfoBirthday = baseInfoBirthday;
	}


	public String getBaseInfoCydz() {
		return baseInfoCydz;
	}


	public void setBaseInfoCydz(String baseInfoCydz) {
		this.baseInfoCydz = baseInfoCydz;
	}


	public String getBaseInfoPhone() {
		return baseInfoPhone;
	}


	public void setBaseInfoPhone(String baseInfoPhone) {
		this.baseInfoPhone = baseInfoPhone;
	}


	public String getBaseInfoCellPhone() {
		return baseInfoCellPhone;
	}


	public void setBaseInfoCellPhone(String baseInfoCellPhone) {
		this.baseInfoCellPhone = baseInfoCellPhone;
	}


	public String getBaseInfoByyx() {
		return baseInfoByyx;
	}


	public void setBaseInfoByyx(String baseInfoByyx) {
		this.baseInfoByyx = baseInfoByyx;
	}


	public String getBaseInfoAddress() {
		return baseInfoAddress;
	}


	public void setBaseInfoAddress(String baseInfoAddress) {
		this.baseInfoAddress = baseInfoAddress;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BaseInfo other = (BaseInfo) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
//	"OBJECTID" : 3,
//    "SZ_QX" : "朝阳区",
//    "MC" : "朝阳区",
//    "ID" : 3,
//    "AREA" : 0.0,
//    "LEN" : 0.0,
//    "SHAPE" : 3
	
	
	
}
