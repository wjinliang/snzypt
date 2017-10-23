package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection="m_ST_REG_COUNTY")
public class RegCounty  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1507525657094149476L;

	@Id
	//@Indexed
	private String id;
	
	@Field("SZ_QX")
	private String szQx;//所在区县
	@Field("MC")
	private String mc;//名称
	@Field("AREA")
	private Double area;
	@Field("LEN")
	private Double len;
	@Field("SHAPE")
	private Integer shape;
	@Field("CODE")
	private String code;//名称
	@Field("FULLNAME")
	private String fullname;//名称
	
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getId() {
		return id;
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
		RegCounty other = (RegCounty) obj;
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
