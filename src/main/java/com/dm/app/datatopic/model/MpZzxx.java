package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 
 *                  
 * @date: 2017年2月22日
 * @Author: lyh
 * @FileName: MpZzxx.java
 * @Version: 1.0
 * @About:  苗圃种植信息 种植情况
 *
 */
@Document(collection="m_LY_MP_ZZXX")
public class MpZzxx implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id; 
	@Field("ID")
	private Double objectId; //标识符
	@Field("GL_ID")
	private Double glId; //关联ID
	@Field("SZ_MC")  
	private String szMc; //树种名称
	@Field("ZZ_MJ") 
	private String ZZ_MJ;//种植面积(亩)
	@Field("ZPMM_SL")  
	private String zpmmSl;  //	年苗圃销售数量(株)
	@Field("N_MPXSSL")  
	private String nMpxssl;  //在圃苗木数量(株)
	
	
	
	
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


	public String getSzMc() {
		return szMc;
	}


	public void setSzMc(String szMc) {
		this.szMc = szMc;
	}


	public String getZZ_MJ() {
		return ZZ_MJ;
	}


	public void setZZ_MJ(String zZ_MJ) {
		ZZ_MJ = zZ_MJ;
	}


	public String getZpmmSl() {
		return zpmmSl;
	}


	public void setZpmmSl(String zpmmSl) {
		this.zpmmSl = zpmmSl;
	}


	public String getnMpxssl() {
		return nMpxssl;
	}


	public void setnMpxssl(String nMpxssl) {
		this.nMpxssl = nMpxssl;
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
		MpZzxx other = (MpZzxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	


}
