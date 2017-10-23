package com.dm.app.datatopic.model.portaltopic;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import com.dm.app.datatopic.model.DanjiJbxx;
/**
 * @description 耕地面积(2009-2013年)ch10-07.xls  
 * @author huoge
 */
@Document(collection="tj_GDMJ")
public class TjGdmj implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String id;
	@Field("XM")
	private String xm;//项目
	@Field("ELLJ")
	private String ellj; //2009
	@Field("ELYL")
	private String elyj;//2010
	@Field("ELYY")
	private String elyy;//2011
	@Field("ELYE")
	private String elye;//2012
	@Field("ELYS")
	private String elys;//2013
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
	public String getEllj() {
		return ellj;
	}
	public void setEllj(String ellj) {
		this.ellj = ellj;
	}
	public String getElyj() {
		return elyj;
	}
	public void setElyj(String elyj) {
		this.elyj = elyj;
	}
	public String getElyy() {
		return elyy;
	}
	public void setElyy(String elyy) {
		this.elyy = elyy;
	}
	public String getElye() {
		return elye;
	}
	public void setElye(String elye) {
		this.elye = elye;
	}
	public String getElys() {
		return elys;
	}
	public void setElys(String elys) {
		this.elys = elys;
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
		TjGdmj other = (TjGdmj) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
