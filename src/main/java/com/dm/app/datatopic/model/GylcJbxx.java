package com.dm.app.datatopic.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 国有林场【基本信息】
 * @author huoge
 */
@Document(collection="m_ZYDP_LY_GYLC_JBXX")
public class GylcJbxx implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	private String id; 
	@Field("ID")
	private Double objectId; //标识符
	@Field("GL_ID")
	private Double glId; //关联ID
	 @Field("LC_MC")
	 private String lcMc; //林场名称
	 @Field("LC_LX")
	 private String lcLx; //林场类型
	 @Field("ZZ_ZGS")
	 private String zzZgs; //在职职工数
	 @Field("TX_ZGS")
	 private Integer txZgs; //退休职工数
	 @Field("JY_ZMJ")
	 private Double jyZmj; //经营总面积(亩
	 @Field("SPL_MJ")
	 private Double splMj; //商品林面积(亩)
	 @Field("GYL_MJ")
	 private Double gylMj; //公益林面积(亩)
	 @Field("ZDGYL_MJ")
	 private Double zdgylMj; //重点公益林面积(亩)
	 @Field("LYYD_ZMJ")
	 private Double lyydZmj; //林业用地总面积(亩)
	 @Field("YLD_MJ")
	 private Double yldMj; //有林地面积(亩)
	 @Field("HLM_ZXJL")
	 private Double hlmZxjl; //活立木总蓄积量(立方米)
	 @Field("TJ_ND")
	 private Date tjNd; //统计年度
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
	public String getLcMc() {
		return lcMc;
	}
	public void setLcMc(String lcMc) {
		this.lcMc = lcMc;
	}
	public String getLcLx() {
		return lcLx;
	}
	public void setLcLx(String lcLx) {
		this.lcLx = lcLx;
	}
	public String getZzZgs() {
		return zzZgs;
	}
	public void setZzZgs(String zzZgs) {
		this.zzZgs = zzZgs;
	}
	public Integer getTxZgs() {
		return txZgs;
	}
	public void setTxZgs(Integer txZgs) {
		this.txZgs = txZgs;
	}
	public Double getJyZmj() {
		return jyZmj;
	}
	public void setJyZmj(Double jyZmj) {
		this.jyZmj = jyZmj;
	}
	public Double getSplMj() {
		return splMj;
	}
	public void setSplMj(Double splMj) {
		this.splMj = splMj;
	}
	public Double getGylMj() {
		return gylMj;
	}
	public void setGylMj(Double gylMj) {
		this.gylMj = gylMj;
	}
	public Double getZdgylMj() {
		return zdgylMj;
	}
	public void setZdgylMj(Double zdgylMj) {
		this.zdgylMj = zdgylMj;
	}
	public Double getLyydZmj() {
		return lyydZmj;
	}
	public void setLyydZmj(Double lyydZmj) {
		this.lyydZmj = lyydZmj;
	}
	public Double getYldMj() {
		return yldMj;
	}
	public void setYldMj(Double yldMj) {
		this.yldMj = yldMj;
	}
	public Double getHlmZxjl() {
		return hlmZxjl;
	}
	public void setHlmZxjl(Double hlmZxjl) {
		this.hlmZxjl = hlmZxjl;
	}
	public Date getTjNd() {
		return tjNd;
	}
	public void setTjNd(Date tjNd) {
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
		GylcJbxx other = (GylcJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
