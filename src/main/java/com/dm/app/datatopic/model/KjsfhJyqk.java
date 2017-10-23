package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

/**
 * 
 *                  
 * @date: 2017年2月25日
 * @Author: lyh
 * @FileName: KjsfhJyqk.java
 * @Version: 1.0
 * @About: 科技示范户 经营情况 
 *
 */
@Document(collection="m_KJ_KJSFH_JYQK")
public class KjsfhJyqk implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id;  //monggoId
	@Field("ID")
	private Integer objectId; //标识符	
	@Field("GL_ID")
	private Integer glId; //关联id
	@Field("ZZ_ZW")
	private String zzZw  ;//种植作物
	@Field("ZZ_MJ")
	private String zzMj  ;//种植面积(亩)
	@Field("YZ_ZL")
	private String yzZl  ;//养殖种类
	@Field("YZ_GM")
	private String yzGm  ;//养殖规模(头、只)
	@Field("DD_NHS")
	private String ddNhs  ;//带动农户数(户)
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
	public String getZzZw() {
		return zzZw;
	}
	public void setZzZw(String zzZw) {
		this.zzZw = zzZw;
	}
	public String getZzMj() {
		return zzMj;
	}
	public void setZzMj(String zzMj) {
		this.zzMj = zzMj;
	}
	public String getYzZl() {
		return yzZl;
	}
	public void setYzZl(String yzZl) {
		this.yzZl = yzZl;
	}
	public String getYzGm() {
		return yzGm;
	}
	public void setYzGm(String yzGm) {
		this.yzGm = yzGm;
	}
	public String getDdNhs() {
		return ddNhs;
	}
	public void setDdNhs(String ddNhs) {
		this.ddNhs = ddNhs;
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
		KjsfhJyqk other = (KjsfhJyqk) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	


}
