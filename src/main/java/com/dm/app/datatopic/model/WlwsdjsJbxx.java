package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 物联网示范点【基本信息】
 * @author huoge
 */
@Document(collection="m_KJSF_WLWSDJS_JBXX")
public class WlwsdjsJbxx implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	private String  id;  //
	@Field("ID")
	private Double  objectId;  //标识符
	@Field("GL_ID")
	private Double  glId;  //关联ID
	@Field("SZ_QX")
	private String  szQx;  //区县
	@Field("SZ_XZ")
	private String  szXz;  //乡镇
	@Field("SZ_XZC")
	private String  szXzc;  //行政村
	@Field("XX_DZ")
	private String  xxDz;  //地址
	@Field("DW_FR")
	private String  dwFr;  //法人
	@Field("LXR_XM")
	private String  lxrXm;  //联系人
	@Field("LX_DH")
	private String  lxDh;  //联系电话
	@Field("ZD_MJ")
	private Double  zdMj;  //面积
	@Field("JS_ND")
	private String  jsNd;  //建设年度
	@Field("JB_GK")
	private String  jbGk;  //基本概况
	@Field("SP_URL")
	private String  spUrl;  //视频URL
	@Field("YZ_URL")
	private String  yzUrl;  //**URL


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


	public String getSzXzc() {
		return szXzc;
	}


	public void setSzXzc(String szXzc) {
		this.szXzc = szXzc;
	}


	public String getXxDz() {
		return xxDz;
	}


	public void setXxDz(String xxDz) {
		this.xxDz = xxDz;
	}


	public String getDwFr() {
		return dwFr;
	}


	public void setDwFr(String dwFr) {
		this.dwFr = dwFr;
	}


	public String getLxrXm() {
		return lxrXm;
	}


	public void setLxrXm(String lxrXm) {
		this.lxrXm = lxrXm;
	}


	public String getLxDh() {
		return lxDh;
	}


	public void setLxDh(String lxDh) {
		this.lxDh = lxDh;
	}


	public Double getZdMj() {
		return zdMj;
	}


	public void setZdMj(Double zdMj) {
		this.zdMj = zdMj;
	}


	public String getJsNd() {
		return jsNd;
	}


	public void setJsNd(String jsNd) {
		this.jsNd = jsNd;
	}


	public String getJbGk() {
		return jbGk;
	}


	public void setJbGk(String jbGk) {
		this.jbGk = jbGk;
	}


	public String getSpUrl() {
		return spUrl;
	}


	public void setSpUrl(String spUrl) {
		this.spUrl = spUrl;
	}


	public String getYzUrl() {
		return yzUrl;
	}


	public void setYzUrl(String yzUrl) {
		this.yzUrl = yzUrl;
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
		WlwsdjsJbxx other = (WlwsdjsJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
