package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 
 *                  
 * @date: 2017年3月14日
 * @Author: lyh
 * @FileName: NatureNyd.java
 * @Version: 1.0
 * @About:  自然资源:非农用地资源
 *
 */
@Document(collection="m_ZZ_ST_NOAGRILAND")
public class NatureFnyd implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id  ;//标识符
	@Field("ID")
	private String id1  ;//标识符
	@Field("OBJECTID")
	private Double objectId;//
	@Field("OBJECTID_1")
	private Integer objectId1;//
	@Field("DL_ZL")
	private String dlZl  ;//地类种类
	@Field("DL_MC")
	private String dlMc  ;//地类名称
	@Field("DL_BM")
	private String dlBm  ;//地类编码
	@Field("XZC_CODE")
	private String  xzcCode;  //所在行政村编码
	
	@Field("SHAPE")
	private Double shape  ;//面积
	
	
	
	@Field("LEN")
	private Double len  ;//
	
	
	@Field("AREA")
	private Double area  ;//
	

	@Field("MC")
	private String MC  ;//名称

	

	public String getXzcCode() {
		return xzcCode;
	}


	public void setXzcCode(String xzcCode) {
		this.xzcCode = xzcCode;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getId1() {
		return id1;
	}


	public void setId1(String id1) {
		this.id1 = id1;
	}


	public Double getObjectId() {
		return objectId;
	}


	public void setObjectId(Double objectId) {
		this.objectId = objectId;
	}


	public Integer getObjectId1() {
		return objectId1;
	}


	public void setObjectId1(Integer objectId1) {
		this.objectId1 = objectId1;
	}


	public String getDlZl() {
		return dlZl;
	}


	public void setDlZl(String dlZl) {
		this.dlZl = dlZl;
	}


	public String getDlMc() {
		return dlMc;
	}


	public void setDlMc(String dlMc) {
		this.dlMc = dlMc;
	}


	public String getDlBm() {
		return dlBm;
	}


	public void setDlBm(String dlBm) {
		this.dlBm = dlBm;
	}


	public Double getShape() {
		return shape;
	}


	public void setShape(Double shape) {
		this.shape = shape;
	}


	public Double getLen() {
		return len;
	}


	public void setLen(Double len) {
		this.len = len;
	}


	public Double getArea() {
		return area;
	}


	public void setArea(Double area) {
		this.area = area;
	}


	public String getMC() {
		return MC;
	}


	public void setMC(String mC) {
		MC = mC;
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
		NatureFnyd other = (NatureFnyd) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	


}
