package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection="m_ST_REG_TOWN")
public class RegTown  implements Serializable{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -2917847065105967316L;

	@Id
	//@Indexed
	private String id;
	@Field("ID")
	private String objectId;
	@Field("SZ_QX")
	private String szQx;//所在区县
	@Field("SZ_XZ")
	private String szXz;//所在乡镇
	@Field("MC")
	private String mc;//名称
	@Field("AREA_")
	private Double area;
	@Field("LEN")
	private Double len;
	@Field("SHAPE")
	private Integer shape;
	@Field("SUM_SHAPE_")
	private Double sumShape;//面积和
	@Field("SUM_SHAPE1")
	private Double sumShape1;//面积和
	@Field("SZ_QX_CODE")
	private String szQxCode ;//锁在区县编码
	@Field("CODE")
	private String code ;//锁在区县编码
	@Field("FULLNAME")
	private String fullname;
	
	
	public String getId() {
		return id;
	}


	public String getObjectId() {
		return objectId;
	}


	public void setObjectId(String objectId) {
		this.objectId = objectId;
	}


	public String getSzQxCode() {
		return szQxCode;
	}


	public void setSzQxCode(String szQxCode) {
		this.szQxCode = szQxCode;
	}


	public String getFullname() {
		return fullname;
	}


	public void setFullname(String fullname) {
		this.fullname = fullname;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getSzQx() {
		return szQx;
	}


	public void setSzQx(String szQx) {
		this.szQx = szQx;
	}


	public String getSzXz() {
		return szXz;
	}


	public void setSzXz(String szXz) {
		this.szXz = szXz;
	}


	public String getMc() {
		return mc;
	}


	public void setMc(String mc) {
		this.mc = mc;
	}


	public Double getArea() {
		return area;
	}


	public void setArea(Double area) {
		this.area = area;
	}


	public Double getLen() {
		return len;
	}


	public void setLen(Double len) {
		this.len = len;
	}


	public Integer getShape() {
		return shape;
	}


	public void setShape(Integer shape) {
		this.shape = shape;
	}


	public Double getSumShape() {
		return sumShape;
	}


	public void setSumShape(Double sumShape) {
		this.sumShape = sumShape;
	}


	public Double getSumShape1() {
		return sumShape1;
	}


	public void setSumShape1(Double sumShape1) {
		this.sumShape1 = sumShape1;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
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
		RegTown other = (RegTown) obj;
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
