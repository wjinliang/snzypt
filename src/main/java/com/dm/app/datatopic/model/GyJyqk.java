package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

/**
 * 
 *                  
 * @date: 2017年2月23日
 * @Author:lyh
 * @FileName: GyJyqk.java
 * @Version: 1.0
 * @About: 果园经营情况
 *
 */
@Document(collection="m_LY_GY_JYQK")
public class GyJyqk implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id; 
	@Field("ID")
	private Double objectId; //标识符
	@Field("GL_ID")
	private Double glId; //关联ID
	@Field("N_CL")
	private Double nCl  ;//年产量(吨)
	@Field("N_YYE")
	private String nYye  ;//年营业额(万元)
	@Field("N_LR")
	private String nLr  ;//年利润(万元)
	@Field("N_DDNHS")
	private String nDdnhs  ;//年带动农户数(户)
	@Field("TJ_ND")
	private String tjNd  ;//统计年度
	@Field("TB_DW")
	private String tbDw  ;//填报单位
	@Field("BM_FZR")
	private String bmFzr  ;//部门负责人
	@Field("TBR_XM")
	private String tbrXm  ;//填报人
	@Field("TB_RQ")
	private String tbRq  ;//填报日期
	@Field("LX_DH")
	private String lxDh  ;//联系电话
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
	public Double getnCl() {
		return nCl;
	}
	public void setnCl(Double nCl) {
		this.nCl = nCl;
	}
	public String getnYye() {
		return nYye;
	}
	public void setnYye(String nYye) {
		this.nYye = nYye;
	}
	public String getnLr() {
		return nLr;
	}
	public void setnLr(String nLr) {
		this.nLr = nLr;
	}
	public String getnDdnhs() {
		return nDdnhs;
	}
	public void setnDdnhs(String nDdnhs) {
		this.nDdnhs = nDdnhs;
	}
	public String getTjNd() {
		return tjNd;
	}
	public void setTjNd(String tjNd) {
		this.tjNd = tjNd;
	}
	public String getTbDw() {
		return tbDw;
	}
	public void setTbDw(String tbDw) {
		this.tbDw = tbDw;
	}
	public String getBmFzr() {
		return bmFzr;
	}
	public void setBmFzr(String bmFzr) {
		this.bmFzr = bmFzr;
	}
	public String getTbrXm() {
		return tbrXm;
	}
	public void setTbrXm(String tbrXm) {
		this.tbrXm = tbrXm;
	}
	public String getTbRq() {
		return tbRq;
	}
	public void setTbRq(String tbRq) {
		this.tbRq = tbRq;
	}
	public String getLxDh() {
		return lxDh;
	}
	public void setLxDh(String lxDh) {
		this.lxDh = lxDh;
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
		GyJyqk other = (GyJyqk) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
