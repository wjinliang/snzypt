package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 
 * @author lyh
 * @description 科技示范户基本信息  实体类
 */
@Document(collection="m_KJ_KJSFH_JBXX")
public class KjsfhJbxx implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id;  //monggoId
	@Field("ID")
	private Integer objectId; //标识符	
	@Field("GL_ID")
	private Integer glId; //关联id
	@Field("QX_MC")
	private String qxMc;//区县名称
	@Field("XZ_MC")
	private String xzMc;//所在乡镇
	@Field("XZC_MC")
	private String xzcMc;//所在行政村
	@Field("XB")
	private String xb;//性别
	@Field("CS_RQ")
	private String cRq;//出生日期
	@Field("XL")
	private String xl;//学历
	@Field("LX_DH")
	private String lxDh;//联系电话
	@Field("SF_JS")
	private String sfJs;//示范技术
	@Field("DX_JJ")
	private String dxJj;//对象简介
	@Field("TJ_ND")
	private String tjNd;//统计年度
	private String fzrName;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getObjectId() {
		return objectId;
	}
	public void setObjectId(Integer objectId) {
		this.objectId = objectId;
	}
	public Integer getGlId() {
		return glId;
	}
	public void setGlId(Integer glId) {
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
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getcRq() {
		return cRq;
	}
	public void setcRq(String cRq) {
		this.cRq = cRq;
	}
	public String getXl() {
		return xl;
	}
	public void setXl(String xl) {
		this.xl = xl;
	}
	public String getLxDh() {
		return lxDh;
	}
	public void setLxDh(String lxDh) {
		this.lxDh = lxDh;
	}
	public String getSfJs() {
		return sfJs;
	}
	public void setSfJs(String sfJs) {
		this.sfJs = sfJs;
	}
	public String getDxJj() {
		return dxJj;
	}
	public void setDxJj(String dxJj) {
		this.dxJj = dxJj;
	}
	public String getTjNd() {
		return tjNd;
	}
	public void setTjNd(String tjNd) {
		this.tjNd = tjNd;
	}

	public String getFzrName() {
		return fzrName;
	}
	public void setFzrName(String fzrName) {
		this.fzrName = fzrName;
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
		KjsfhJbxx other = (KjsfhJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
