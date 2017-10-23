package com.dm.app.datatopic.jichushujuguanli.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection="m_ST_REG_VILLAGE")
public class RegVillage  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2674636394731502319L;

	@Id
	//@Indexed
	private String id;
	
	@Field("SZ_QX")
	private String szQx;//所在区县
	@Field("SZ_XZ")
	private String szXz;//所在乡镇
	@Field("SZ_XZC")
	private String szXzC;//所在行政村
	@Field("MC")
	private String mc;//名称
	@Field("SHAPE")
	private Integer shape;
	@Field("MJ")
	private Double mj;
	
	
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




	public Integer getShape() {
		return shape;
	}


	public void setShape(Integer shape) {
		this.shape = shape;
	}

	public String getSzXzC() {
		return szXzC;
	}


	public void setSzXzC(String szXzC) {
		this.szXzC = szXzC;
	}


	public Double getMj() {
		return mj;
	}


	public void setMj(Double mj) {
		this.mj = mj;
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
		RegVillage other = (RegVillage) obj;
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
