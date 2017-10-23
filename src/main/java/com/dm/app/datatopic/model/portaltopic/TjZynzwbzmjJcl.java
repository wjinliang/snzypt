package com.dm.app.datatopic.model.portaltopic;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

/**
 * 
 *                  
 * @date: 2017年2月27日
 * @Author:lyh
 * @FileName: TjZynzwbzmjJcl.java
 * @Version: 1.0
 * @About: 10-11  主要农作物播种面积及产量
 *
 */
@Document(collection="tj_ZYNZWBZMJJCL")
public class TjZynzwbzmjJcl implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id;//
	@Field("XM")
	private String xm;//项    目
	@Field("BZMJ_SI")
	private String bzmjSi;//播种面积 2014
	@Field("DC_SI")
	private String dcSi;//单  产 2014
	@Field("ZCL_SI")
	private String zclSi;//总 产 量 2014
	@Field("BZMJ_SAN")
	private String bzmjSan;//播种面积 
	@Field("DC_SAN")
	private String dcSan;// 单  产 2013
	@Field("ZCL_SAN")
	private String zclSan;//总 产 量 2013
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getBzmjSi() {
		return bzmjSi;
	}
	public void setBzmjSi(String bzmjSi) {
		this.bzmjSi = bzmjSi;
	}
	public String getDcSi() {
		return dcSi;
	}
	public void setDcSi(String dcSi) {
		this.dcSi = dcSi;
	}
	public String getZclSi() {
		return zclSi;
	}
	public void setZclSi(String zclSi) {
		this.zclSi = zclSi;
	}
	public String getBzmjSan() {
		return bzmjSan;
	}
	public void setBzmjSan(String bzmjSan) {
		this.bzmjSan = bzmjSan;
	}
	public String getDcSan() {
		return dcSan;
	}
	public void setDcSan(String dcSan) {
		this.dcSan = dcSan;
	}
	public String getZclSan() {
		return zclSan;
	}
	public void setZclSan(String zclSan) {
		this.zclSan = zclSan;
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
		TjZynzwbzmjJcl other = (TjZynzwbzmjJcl) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
