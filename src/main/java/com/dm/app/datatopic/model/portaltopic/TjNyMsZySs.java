package com.dm.app.datatopic.model.portaltopic;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 农业观光园、民俗旅游、种业和设施农业(2010-2014年) ch10-15.xls tj_NY_MS_ZY_SS
 * @author huoge
 */
@Document(collection="tj_NY_MS_ZY_SS")
public class TjNyMsZySs implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String id; 
	@Field("XM")
	private String xm;  //项目
	@Field("ELYL")
	private String ELYL; //2010
 	@Field("ELYY")
	private String ELYY; //2011
	@Field("ELYE")
	private String ELYE;  //2012
	@Field("ELYSAN")
	private String ELYSAN;  //2013
	@Field("ELYISI")
	private String ELYISI; //2014
	@Field("DW")
	private String dw;
	
	public String getDw() {
		return dw;
	}


	public void setDw(String dw) {
		this.dw = dw;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getXm() {
		return xm;
	}


	public void setXm(String xm) {
		this.xm = xm;
	}


	public String getELYL() {
		return ELYL;
	}


	public void setELYL(String eLYL) {
		ELYL = eLYL;
	}


	public String getELYY() {
		return ELYY;
	}


	public void setELYY(String eLYY) {
		ELYY = eLYY;
	}


	public String getELYE() {
		return ELYE;
	}


	public void setELYE(String eLYE) {
		ELYE = eLYE;
	}


	public String getELYSAN() {
		return ELYSAN;
	}


	public void setELYSAN(String eLYSAN) {
		ELYSAN = eLYSAN;
	}


	public String getELYISI() {
		return ELYISI;
	}


	public void setELYISI(String eLYISI) {
		ELYISI = eLYISI;
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
		TjNyMsZySs other = (TjNyMsZySs) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
