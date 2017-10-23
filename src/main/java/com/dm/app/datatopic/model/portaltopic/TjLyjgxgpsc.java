package com.dm.app.datatopic.model.portaltopic;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 林业及干鲜果品生产ch10-12.xls  tj_LYJGXGPSC
 * @author huoge
 */
@Document(collection="tj_LYJGXGPSC")
public class TjLyjgxgpsc implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String id; 
	@Field("XM")
	private String xm;  //项目
	@Field("DW")
	private String dw; //单位
	@Field("SI")
	private String si; //2014
 	@Field("SAN")
	private String san; //2013
	@Field("ZB")
	private String zb;  //2014占2013占比
	
	public String getDw() {
		return dw;
	}


	public void setDw(String dw) {
		this.dw = dw;
	}


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


	public void setSi(String si) {
		this.si = si;
	}


	public String getSan() {
		return san;
	}


	public void setSan(String san) {
		this.san = san;
	}


	public String getZb() {
		return zb;
	}


	public void setZb(String zb) {
		this.zb = zb;
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
		TjLyjgxgpsc other = (TjLyjgxgpsc) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
