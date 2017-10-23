package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
/**
 * @description 作物
 * @author huoge
 */
import org.springframework.data.mongodb.core.mapping.Field;
@Document(collection="m_ZZ_ZWSC")
public class ZzZwsc implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String id;
	@Field("ID")
	private String objectId;
	@Field("BZ_MJ")
	private String bzMj;
	@Field("CL")
	private String cl;
	@Field("DW")
	private String dw;
	@Field("SC_LB")
	private String scLb;
	@Field("SZ_QX")
	private String szQx;
	@Field("SZ_XZC")
	private String szXzc;
	@Field("NF")
	private String nf;
	@Field("ZW_FL")
	private String zwFl;
	@Field("ZW_ZL")
	private String zwZl;
	@Field("ZW_MC")
	private String zwMc;
	@Field("ZW_PZ")
	private String zwPz;
	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getObjectId() {
		return objectId;
	}


	public void setObjectId(String objectId) {
		this.objectId = objectId;
	}


	public String getBzMj() {
		return bzMj;
	}


	public void setBzMj(String bzMj) {
		this.bzMj = bzMj;
	}


	public String getCl() {
		return cl;
	}


	public void setCl(String cl) {
		this.cl = cl;
	}


	public String getDw() {
		return dw;
	}


	public void setDw(String dw) {
		this.dw = dw;
	}


	public String getScLb() {
		return scLb;
	}


	public void setScLb(String scLb) {
		this.scLb = scLb;
	}


	public String getSzQx() {
		return szQx;
	}


	public void setSzQx(String szQx) {
		this.szQx = szQx;
	}


	public String getSzXzc() {
		return szXzc;
	}


	public void setSzXzc(String szXzc) {
		this.szXzc = szXzc;
	}


	public String getNf() {
		return nf;
	}


	public void setNf(String nf) {
		this.nf = nf;
	}


	public String getZwFl() {
		return zwFl;
	}


	public void setZwFl(String zwFl) {
		this.zwFl = zwFl;
	}


	public String getZwZl() {
		return zwZl;
	}


	public void setZwZl(String zwZl) {
		this.zwZl = zwZl;
	}


	public String getZwMc() {
		return zwMc;
	}


	public void setZwMc(String zwMc) {
		this.zwMc = zwMc;
	}


	public String getZwPz() {
		return zwPz;
	}


	public void setZwPz(String zwPz) {
		this.zwPz = zwPz;
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
		ZzZwsc other = (ZzZwsc) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	

}
