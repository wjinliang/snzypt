package com.dm.app.datatopic.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 果园基地【基本信息】
 * @author huoge
 */
@Document(collection="m_LY_GY_JBXX")
public class GyJbxx implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	private String id; 
	@Field("ID")
	private Double objectId; //标识符
	@Field("GL_ID")
	private Double glId; //关联ID
	 @Field("MC")
	 private String mc; //果园名称
	 @Field("SZ_QX")
	 private String qxMc; //区县名称
	 @Field("SZ_XZ")
	 private String xzMc; //乡镇名称
	 @Field("SZ_XZC")
	 private String xzc; //行政村名称
	 @Field("ZD_MJ")
	 private Double zdMj; //占地面积(亩)
	 @Field("XX_DZ")
	 private String xxDz; //
	 @Field("FZR")
	 private String fzr; //
	 @Field("GP_ZL")
	 private String gpZl; //果品种类
	 @Field("HJ_ZS")
	 private Double hjZs; //
	 @Field("RZ_QK")
	 private String rzQk;// 认证情况。无公害农产品、绿色食品、有机食品、ISO系列、HACCP、其它
	 @Field("SF_BZHJD")
	 private String sfBzhjd;//是否标准化基地
	 @Field("SF_GGCZY")
	 private String sfGgczy;//是否观光采摘园
	 @Field("JS_ND")
	 private String jsNd;//建设年度
	 @Field("DX_JJ")
	 private String dxJj;//对象简介
	 @Field("XZC_CODE")
	 private String xzcCode;//对象简介
	 
	public String getFzr() {
		return fzr;
	}
	public void setFzr(String fzr) {
		this.fzr = fzr;
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
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
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
	public String getXzc() {
		return xzc;
	}
	public void setXzc(String xzc) {
		this.xzc = xzc;
	}
	public Double getZdMj() {
		return zdMj;
	}
	public void setZdMj(Double zdMj) {
		this.zdMj = zdMj;
	}
	public String getGpZl() {
		return gpZl;
	}
	public void setGpZl(String gpZl) {
		this.gpZl = gpZl;
	}
	public String getRzQk() {
		return rzQk;
	}
	public void setRzQk(String rzQk) {
		this.rzQk = rzQk;
	}
	public String getSfBzhjd() {
		return sfBzhjd;
	}
	public void setSfBzhjd(String sfBzhjd) {
		this.sfBzhjd = sfBzhjd;
	}
	public String getSfGgczy() {
		return sfGgczy;
	}
	public void setSfGgczy(String sfGgczy) {
		this.sfGgczy = sfGgczy;
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
	
	
	public String getXxDz() {
		return xxDz;
	}
	public void setXxDz(String xxDz) {
		this.xxDz = xxDz;
	}
	
	public Double getHjZs() {
		return hjZs;
	}
	public void setHjZs(Double hjZs) {
		this.hjZs = hjZs;
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
		GyJbxx other = (GyJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
