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
 * @FileName: TjNzwBzmjHzlmj.java
 * @Version: 1.0
 * @About: 
 *10-3  农作物播种面积和造林面积(1978-2014年)
 */
@Document(collection="tj_NZWBZMJHZLMJ")
public class TjNzwBzmjHzlmj implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	private String id;//
	@Field("TJNF")
	private String tjnf;//年  份
	@Field("NZWBZMJ")
	private String nzwbzmj;//农 作 物播种面积(万公顷)
	@Field("LSZW")
	private String lszw;//粮  食作物
	@Field("YM")
	private String ym;//玉 米
	@Field("XM")
	private String xm;//小 麦
	@Field("YL")
	private String yl;//油 料
	@Field("SCJYYJ")
	private String scjsyj;//蔬菜及食用菌
	@Field("GLJCM")
	private String gljcm;//瓜类及草  莓
	@Field("SL")
	private String sl;//饲 料
	@Field("ZLMJ")
	private String zlmj;//造林面积(万公顷)
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
	public String getNzwbzmj() {
		return nzwbzmj;
	}
	public void setNzwbzmj(String nzwbzmj) {
		this.nzwbzmj = nzwbzmj;
	}
	public String getLszw() {
		return lszw;
	}
	public void setLszw(String lszw) {
		this.lszw = lszw;
	}
	public String getYm() {
		return ym;
	}
	public void setYm(String ym) {
		this.ym = ym;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getYl() {
		return yl;
	}
	public void setYl(String yl) {
		this.yl = yl;
	}
	public String getScjsyj() {
		return scjsyj;
	}
	public void setScjsyj(String scjsyj) {
		this.scjsyj = scjsyj;
	}
	public String getGljcm() {
		return gljcm;
	}
	public void setGljcm(String gljcm) {
		this.gljcm = gljcm;
	}
	public String getSl() {
		return sl;
	}
	public void setSl(String sl) {
		this.sl = sl;
	}
	public String getZlmj() {
		return zlmj;
	}
	public void setZlmj(String zlmj) {
		this.zlmj = zlmj;
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
		TjNzwBzmjHzlmj other = (TjNzwBzmjHzlmj) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	

}
