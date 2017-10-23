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
 * @FileName: TjSsny.java
 * @Version: 1.0
 * @About: 
 *10-19  设施农业(2014年)
 */
@Document(collection="tj_SSNY")
public class TjSsny implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	private String id;//
	@Field("XM")
	private String xm;//项      目
	@Field("SSNYBZMJ")
	private String ssnybzmj;//设施农业播种面积
	@Field("SSNYCL")
	private String ssnycl;//设施农业产量(吨)
	
	@Field("SSNYSR")
	private String ssnysr;//设施农业收入(吨)
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
	public String getSsnybzmj() {
		return ssnybzmj;
	}
	public void setSsnybzmj(String ssnybzmj) {
		this.ssnybzmj = ssnybzmj;
	}
	public String getSsnycl() {
		return ssnycl;
	}
	public void setSsnycl(String ssnycl) {
		this.ssnycl = ssnycl;
	}
	public String getSsnysr() {
		return ssnysr;
	}
	public void setSsnysr(String ssnysr) {
		this.ssnysr = ssnysr;
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
		TjSsny other = (TjSsny) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	

}
