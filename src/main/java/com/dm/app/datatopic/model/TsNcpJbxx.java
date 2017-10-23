package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 特色农产品【基本信息】
 * @author huoge
 */
@Document(collection="m_ZZ_TSNCP_JBXX")
public class TsNcpJbxx implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	 private String   id;  //
	@Field("ID")
	 private Double  objectId ;  //标识符
	@Field("GL_ID")
	 private Double   glId;  //关联ID
	@Field("SZ_QX")
	 private String  qxMc ;  //区县名称
	@Field("SZ_XZ")
	 private String   xzMc;  //所在乡镇
	@Field("SZ_XZC")
	 private String  xzcMc ;  //所在行政村
	@Field("TSCP_MC")
	 private String  tscpMc ;  //特色产品
	@Field("XZC_CODE")
	 private String   xzcCode; //行政村编码
	@Field("SF_YCYP")
	 private String   sfYcyp; //
	@Field("DX_JJ")
	 private String   dxJj; //对象简介
	


	public String getSfYcyp() {
		return sfYcyp;
	}



	public void setSfYcyp(String sfYcyp) {
		this.sfYcyp = sfYcyp;
	}



	public String getDxJj() {
		return dxJj;
	}



	public void setDxJj(String dxJj) {
		this.dxJj = dxJj;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public Double getObjectId() {
		return objectId;
	}



	public void setObjectId(Double objectId) {
		this.objectId = objectId;
	}



	public Double getGlId() {
		return glId;
	}



	public void setGlId(Double glId) {
		this.glId = glId;
	}



	public String getQxMc() {
		return qxMc;
	}



	public void setQxMc(String qxMc) {
		this.qxMc = qxMc;
	}



	public String getXzMc() {
		return xzMc;
	}



	public void setXzMc(String xzMc) {
		this.xzMc = xzMc;
	}



	public String getXzcMc() {
		return xzcMc;
	}



	public void setXzcMc(String xzcMc) {
		this.xzcMc = xzcMc;
	}



	public String getTscpMc() {
		return tscpMc;
	}



	public void setTscpMc(String tscpMc) {
		this.tscpMc = tscpMc;
	}



	public String getXzcCode() {
		return xzcCode;
	}



	public void setXzcCode(String xzcCode) {
		this.xzcCode = xzcCode;
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
		TsNcpJbxx other = (TsNcpJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
