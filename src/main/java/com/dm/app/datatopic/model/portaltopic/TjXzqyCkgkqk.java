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
 * @FileName: TjXzqyCkgkqk.java
 * @Version: 1.0
 * @About: 
 *10-22  乡镇企业出口供货情况
 */
@Document(collection="tj_XZQYCKGHQK")
public class TjXzqyCkgkqk implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	private String id;//
	@Field("XM")
	private String xm;//项      目
	@Field("SI")
	private String si;//2014
	@Field("SAN")
	private String san;//2013
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
	public String getSi() {
		return si;
	}
	public void setSI(String si) {
		this.si = si;
	}
	public String getSan() {
		return san;
	}
	public void setSAN(String san) {
		this.san = san;
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
		TjXzqyCkgkqk other = (TjXzqyCkgkqk) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	

}
