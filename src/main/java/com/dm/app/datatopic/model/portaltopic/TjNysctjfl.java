package com.dm.app.datatopic.model.portaltopic;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 农业生产条件(1978-2014年) ch10-02.xls tj_NYSCTJFL
 * @author huoge
 */
@Document(collection="tj_NYSCTJFL")
public class TjNysctjfl implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String id; 
	@Field("TJNF")
	private String tjnf;  //统计年份
	@Field("NMSYGDMJ")
	private String nmsygdmj; //年末实有耕地面积(万公顷)
 	@Field("YXGGMJ")
	private String yxggmj; //有    效灌溉面积(千公顷)
	@Field("NYJXZDL")
	private String nyjxzdl;  //农业机械总 动 力(万千瓦)
	@Field("NCYDL")
	private String ncydl;  //农  村用电量(万千瓦小时)
	@Field("HFSYL")
	private String hfsyl; //化  肥施用量(万吨)
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


	public String getNmsygdmj() {
		return nmsygdmj;
	}


	public void setNmsygdmj(String nmsygdmj) {
		this.nmsygdmj = nmsygdmj;
	}


	public String getYxggmj() {
		return yxggmj;
	}


	public void setYxggmj(String yxggmj) {
		this.yxggmj = yxggmj;
	}


	public String getNyjxzdl() {
		return nyjxzdl;
	}


	public void setNyjxzdl(String nyjxzdl) {
		this.nyjxzdl = nyjxzdl;
	}


	public String getNcydl() {
		return ncydl;
	}


	public void setNcydl(String ncydl) {
		this.ncydl = ncydl;
	}


	public String getHfsyl() {
		return hfsyl;
	}


	public void setHfsyl(String hfsyl) {
		this.hfsyl = hfsyl;
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
		TjNysctjfl other = (TjNysctjfl) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
