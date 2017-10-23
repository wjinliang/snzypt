package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 兽药经营企业【基本信息】
 * @author huoge
 */
@Document(collection="m_YZ_SYJYQY_JBXX")
public class SyjyqyJbxx implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private String  id;  //
	@Field("ID")
	private Double  objectId;  //标识符
	@Field("GL_ID")
	private Double  glId;  //关联ID
	@Field("QX_MC")
	private String  qxMc;  //区县名称
	@Field("XZ_MC")
	private String  xzMc;  //所在乡镇
	@Field("XZC_MC")
	private String  xzcMc;  //所在行政村
	@Field("QY_MC")
	private String  qyMc;  //企业名称
	@Field("XX_DZ")
	private String  xxDz;  //详细地址
	@Field("FZR_XM")
	private String  fzrXm;  //负责人姓名
	@Field("LX_DH")
	private String  lxDh;  //联系电话
	@Field("JS_ND")
	private String  jsNd;  //建设年度
	@Field("DX_JJ")
	private String  dxJj;  //对象简介
	@Field("XZC_CODE")
	private String  xzcCode;  //对象简介

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


	public String getQyMc() {
		return qyMc;
	}


	public void setQyMc(String qyMc) {
		this.qyMc = qyMc;
	}


	public String getXxDz() {
		return xxDz;
	}


	public void setXxDz(String xxDz) {
		this.xxDz = xxDz;
	}


	public String getFzrXm() {
		return fzrXm;
	}


	public void setFzrXm(String fzrXm) {
		this.fzrXm = fzrXm;
	}


	public String getLxDh() {
		return lxDh;
	}


	public void setLxDh(String lxDh) {
		this.lxDh = lxDh;
	}


	public String getJsNd() {
		return jsNd;
	}


	public void setJsNd(String jsNd) {
		this.jsNd = jsNd;
	}


	public String getDxJj() {
		return dxJj;
	}


	public void setDxJj(String dxJj) {
		this.dxJj = dxJj;
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
		SyjyqyJbxx other = (SyjyqyJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
