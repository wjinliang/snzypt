package com.dm.app.datatopic.model.portaltopic;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;


/**
 * 
 *                  
 * @date: 2017年2月27日
 * @Author: lyh
 * @FileName: TjZzsc.java
 * @Version: 1.0
 * @About: 种植生产 统计 2015  excel 18
 *
 */
@Document(collection="tj_ZZSC")
public class TjZzsc implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id;//
	@Field("XM")
	private String xm;//项    目
	@Field("CL_SI")
	private String clSi;//产量 2014
	@Field("CL_SAN")
	private String clSan;//产量 2013
	public String getDw() {
		return dw;
	}
	public void setDw(String dw) {
		this.dw = dw;
	}


	@Field("ZB_SI")
	private String zbSi;//14 占比
	@Field("SI_SR")
	private String siSr;//14 收入
	@Field("SAN_SR")
	private String sanSr;// 13收入 
	@Field("ZB_SR")
	private String zbSr;// 14占13 占比
	@Field("DW")
	private String dw;
	
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
	public String getClSi() {
		return clSi;
	}
	public void setClSi(String clSi) {
		this.clSi = clSi;
	}
	public String getClSan() {
		return clSan;
	}
	public void setClSan(String clSan) {
		this.clSan = clSan;
	}
	public String getZbSi() {
		return zbSi;
	}
	public void setZbSi(String zbSi) {
		this.zbSi = zbSi;
	}
	public String getSiSr() {
		return siSr;
	}
	public void setSiSr(String siSr) {
		this.siSr = siSr;
	}
	public String getSanSr() {
		return sanSr;
	}
	public void setSanSr(String sanSr) {
		this.sanSr = sanSr;
	}
	public String getZbSr() {
		return zbSr;
	}
	public void setZbSr(String zbSr) {
		this.zbSr = zbSr;
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
		TjZzsc other = (TjZzsc) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
