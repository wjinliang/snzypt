package com.dm.app.datatopic.model.portaltopic;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 农村固定资产投资情况(2014年) ch10-08.xls tj_NCGDZCTZQK
 * @author huoge
 */
@Document(collection="tj_NCGDZCTZQK")
public class TjNcgdzctzqk implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String id; 
	@Field("XM")
	private String xm;  //项目
	@Field("HJ")
	private String hj; //合计
 	@Field("FNY")
	private String fny; //非农业
	@Field("NY")
	private String ny;  //农业
	
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


	public String getHj() {
		return hj;
	}


	public void setHj(String hj) {
		this.hj = hj;
	}


	public String getFny() {
		return fny;
	}


	public void setFny(String fny) {
		this.fny = fny;
	}


	public String getNy() {
		return ny;
	}


	public void setNy(String ny) {
		this.ny = ny;
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
		TjNcgdzctzqk other = (TjNcgdzctzqk) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
