package com.dm.app.datatopic.model.portaltopic;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 农林牧渔业总产值(1978-2014年) ch10-04.xls tj_NLMYYZCZFL
 * @author huoge
 */
@Document(collection="tj_NLMYYZCZFL")
public class TjNlmyyzczfl implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String id; 
	@Field("TJNF")
	private String tjnf;  //统计年份
	@Field("NLMYYZZC")
	private String nlmyyzzc; //农林牧渔业总  产  值(亿元)
 	@Field("NL")
	private String nl; //农业
	@Field("LY")
	private String ly;  //林业
	@Field("MY")
	private String my;  //牧业
	@Field("YY")
	private String yy; //渔业
 	@Field("NLMYFWY")
	private String nlmyfwy; //农林牧渔服务业
	@Field("AXJJS")
	private String axjjs;  //按现价计  算
	@Field("AKBJJS")
	private String akbjjs;  //按可比价计   算

	
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


	public String getNlmyyzzc() {
		return nlmyyzzc;
	}


	public void setNlmyyzzc(String nlmyyzzc) {
		this.nlmyyzzc = nlmyyzzc;
	}


	public String getNl() {
		return nl;
	}


	public void setNl(String nl) {
		this.nl = nl;
	}


	public String getLy() {
		return ly;
	}


	public void setLy(String ly) {
		this.ly = ly;
	}


	public String getMy() {
		return my;
	}


	public void setMy(String my) {
		this.my = my;
	}


	public String getYy() {
		return yy;
	}


	public void setYy(String yy) {
		this.yy = yy;
	}


	public String getNlmyfwy() {
		return nlmyfwy;
	}


	public void setNlmyfwy(String nlmyfwy) {
		this.nlmyfwy = nlmyfwy;
	}


	public String getAxjjs() {
		return axjjs;
	}


	public void setAxjjs(String axjjs) {
		this.axjjs = axjjs;
	}


	public String getAkbjjs() {
		return akbjjs;
	}


	public void setAkbjjs(String akbjjs) {
		this.akbjjs = akbjjs;
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
		TjNlmyyzczfl other = (TjNlmyyzczfl) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
