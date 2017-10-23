package com.dm.app.datatopic.model.portaltopic;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 
 * @description 农村基本情况(1978-2014年) ch10-01.xls   tj_NCJBQK
 * @author huoge
 */
@Document(collection="tj_NCJBQK")
public class TjNcjbqk implements Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String id; 
	@Field("TJNF")
	private String tjnf;  //统计年度
	@Field("XZF")
	private String xzf; //乡政府
 	@Field("ZZF")
	private String zzf; //镇政府
	@Field("CMWYH")
	private String cmwyh;  //村民委员会
	@Field("XZJXZCCZHS")
	private String xzjxzcczhs;  //乡镇及行政村常 住 户 数(万户)
	@Field("XZJXZCCZRK")
	private String xzjxzcczrk; //乡镇及行政村常 住 人 口(万人)
 	@Field("XZJXZCCYRY")
	private String xzjxzccyry; //乡镇及行政村从 业 人 员(万人)

	
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


	public String getXzf() {
		return xzf;
	}


	public void setXzf(String xzf) {
		this.xzf = xzf;
	}


	public String getZzf() {
		return zzf;
	}


	public void setZzf(String zzf) {
		this.zzf = zzf;
	}


	public String getCmwyh() {
		return cmwyh;
	}


	public void setCmwyh(String cmwyh) {
		this.cmwyh = cmwyh;
	}


	public String getXzjxzcczhs() {
		return xzjxzcczhs;
	}


	public void setXzjxzcczhs(String xzjxzcczhs) {
		this.xzjxzcczhs = xzjxzcczhs;
	}


	public String getXzjxzcczrk() {
		return xzjxzcczrk;
	}


	public void setXzjxzcczrk(String xzjxzcczrk) {
		this.xzjxzcczrk = xzjxzcczrk;
	}


	public String getXzjxzccyry() {
		return xzjxzccyry;
	}


	public void setXzjxzccyry(String xzjxzccyry) {
		this.xzjxzccyry = xzjxzccyry;
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
		TjNcjbqk other = (TjNcjbqk) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
