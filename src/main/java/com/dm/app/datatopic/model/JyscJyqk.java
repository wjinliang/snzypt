package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 
 * @author lyh
 * @description 经营市场基本信息
 */
@Document(collection="m_SCDP_JYSC_JYQK")
public class JyscJyqk implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id;  //monggoId
	@Field("ID")
	private Double objectId; //标识符	
	@Field("GL_ID")
	private Double glId; //关联id
	@Field("JY_FW")
	private String jyFw  ;//经营范围
	@Field("SYWS_FZR")
	private String sywsFzr  ;//***负责人
	@Field("FJY_XM")
	private String fjyXm  ;//***姓名
	@Field("DWCP_TWS")
	private String dwcpTws  ;//动物产品**数
	@Field("TBR_XM")
	private String tbrXm  ;//填报人
	@Field("TB_SJ")
	private String tbSj  ;//填报时间
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
	public String getJyFw() {
		return jyFw;
	}
	public void setJyFw(String jyFw) {
		this.jyFw = jyFw;
	}
	public String getSywsFzr() {
		return sywsFzr;
	}
	public void setSywsFzr(String sywsFzr) {
		this.sywsFzr = sywsFzr;
	}
	public String getFjyXm() {
		return fjyXm;
	}
	public void setFjyXm(String fjyXm) {
		this.fjyXm = fjyXm;
	}
	public String getDwcpTws() {
		return dwcpTws;
	}
	public void setDwcpTws(String dwcpTws) {
		this.dwcpTws = dwcpTws;
	}
	public String getTbrXm() {
		return tbrXm;
	}
	public void setTbrXm(String tbrXm) {
		this.tbrXm = tbrXm;
	}
	public String getTbSj() {
		return tbSj;
	}
	public void setTbSj(String tbSj) {
		this.tbSj = tbSj;
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
		JyscJyqk other = (JyscJyqk) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
