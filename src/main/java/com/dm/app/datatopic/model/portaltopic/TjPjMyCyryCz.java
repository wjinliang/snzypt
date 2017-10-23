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
 * @FileName: TjPjMyCyryCz.java
 * @Version: 1.0
 * @About: 
 *110-6  平均每一从业人员创造农、林、牧、渔业产值(1990-2014年)
 */
@Document(collection="tj_PJMYCYRYCZ")
public class TjPjMyCyryCz implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	private String id;//
	@Field("TJNF")
	private String tjnf;//年  份
	@Field("NLMYYZCZ")
	private String nlmyyzcz;//农林牧渔业
	@Field("NY")
	private String ny;//农  业
	@Field("LY")
	private String ly;//林  业
	@Field("XMY")
	private String xmy;//畜牧业
	@Field("YY")
	private String yy;//渔  业
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTjnf() {
		return tjnf;
	}
	public void setTjnf(String tjnf) {
		this.tjnf = tjnf;
	}
	public String getNlmyyzcz() {
		return nlmyyzcz;
	}
	public void setNlmyyzcz(String nlmyyzcz) {
		this.nlmyyzcz = nlmyyzcz;
	}
	public String getNy() {
		return ny;
	}
	public void setNy(String ny) {
		this.ny = ny;
	}
	public String getLy() {
		return ly;
	}
	public void setLy(String ly) {
		this.ly = ly;
	}
	public String getXmy() {
		return xmy;
	}
	public void setXmy(String xmy) {
		this.xmy = xmy;
	}
	public String getYy() {
		return yy;
	}
	public void setYy(String yy) {
		this.yy = yy;
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
		TjPjMyCyryCz other = (TjPjMyCyryCz) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	

}
