package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

/**
 * @description 龙头企业【基本信息表】
 * @author huoge
 */
@Document(collection="m_ZYDP_ZH_LTQY_JBXX")
public class LtqyJbxx implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String  id;  //
	@Field("ID")
	private Double  objectId;  //
	@Field("GL_ID")
	private Double  glId;  //关联ID
	@Field("SZ_QX")
	private String  szQx;  //区县
	@Field("SZ_XZ")
	private String  szXz;  //乡镇(街道)
	@Field("SZ_XZC")
	private String  szXzc;  //行政村(社区)
	@Field("QY_FR")
	private String  qyFr;  //企业法人
	@Field("QY_XZ")
	private String  qyXz;  //企业性质
	@Field("QY_JB")
	private String  qyJb;  //企业级别
	@Field("ZNBM_FZRXM")
	private String znbmFzrxm;  //职能部门负责人姓名
	@Field("ZNBM_FZRDH")
	private String  znbmFzrdh;  //职能部门负责人电话
	@Field("BBLXR_XM")
	private String  bblxrXm;  //报表联系人姓名
	@Field("BBLXR_DH")
	private String  bblxrDh;  //报表联系人电话
	@Field("QY_ZJJ")
	private String  qyZjj;  //总经理
	@Field("QY_DZ")
	private String  qyDz;  //地址
	@Field("QY_YB")
	private String  qyYb;  //邮编
	@Field("QY_DH")
	private String  qyDh;  //电话
	@Field("QY_CZ")
	private String  qyCz;  //传真
	@Field("QY_YX")
	private String  qyYx;  //企业邮箱
	@Field("QY_WZ")
	private String  qyWz;  //企业网址
	@Field("TJ_ND")
	private String  tjNd;  //统计年度



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


	public String getQyFr() {
		return qyFr;
	}


	public void setQyFr(String qyFr) {
		this.qyFr = qyFr;
	}


	public String getQyXz() {
		return qyXz;
	}


	public void setQyXz(String qyXz) {
		this.qyXz = qyXz;
	}


	public String getQyJb() {
		return qyJb;
	}


	public void setQyJb(String qyJb) {
		this.qyJb = qyJb;
	}


	public String getZnbmFzrxm() {
		return znbmFzrxm;
	}


	public void setZnbmFzrxm(String znbmFzrxm) {
		this.znbmFzrxm = znbmFzrxm;
	}


	public String getZnbmFzrdh() {
		return znbmFzrdh;
	}


	public void setZnbmFzrdh(String znbmFzrdh) {
		this.znbmFzrdh = znbmFzrdh;
	}


	public String getBblxrXm() {
		return bblxrXm;
	}


	public void setBblxrXm(String bblxrXm) {
		this.bblxrXm = bblxrXm;
	}


	public String getBblxrDh() {
		return bblxrDh;
	}


	public void setBblxrDh(String bblxrDh) {
		this.bblxrDh = bblxrDh;
	}


	public String getQyZjj() {
		return qyZjj;
	}


	public void setQyZjj(String qyZjj) {
		this.qyZjj = qyZjj;
	}


	public String getQyDz() {
		return qyDz;
	}


	public void setQyDz(String qyDz) {
		this.qyDz = qyDz;
	}


	public String getQyYb() {
		return qyYb;
	}


	public void setQyYb(String qyYb) {
		this.qyYb = qyYb;
	}


	public String getQyDh() {
		return qyDh;
	}


	public void setQyDh(String qyDh) {
		this.qyDh = qyDh;
	}


	public String getQyCz() {
		return qyCz;
	}


	public void setQyCz(String qyCz) {
		this.qyCz = qyCz;
	}


	public String getQyYx() {
		return qyYx;
	}


	public void setQyYx(String qyYx) {
		this.qyYx = qyYx;
	}


	public String getQyWz() {
		return qyWz;
	}


	public void setQyWz(String qyWz) {
		this.qyWz = qyWz;
	}


	public String getTjNd() {
		return tjNd;
	}


	public void setTjNd(String tjNd) {
		this.tjNd = tjNd;
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
		LtqyJbxx other = (LtqyJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
