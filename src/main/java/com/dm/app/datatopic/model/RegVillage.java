package com.dm.app.datatopic.model;

import java.io.Serializable;
import java.util.Map;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description  村庄基本信息
 * @author huoge 
 */
@Document(collection="m_ST_REG_VILLAGE")
public class RegVillage  implements Serializable{
	private static final long serialVersionUID = -2674636394731502319L;

	@Id
	private String id;
	@Field("ID")
	private Double aid;
	@Field("OBJECTID")
	private Double objectid;
	@Field("SZ_XZ_CODE")
	private String szXzCode;//所在乡镇编码
	@Field("CODE")
	private String code;//所在行政村编码
	@Field("SZ_QX")
	private String szQx;//所在区县
	@Field("SZ_QX_CODE")
	private String szQxCode;//所在区县编码
	@Field("SZ_XZ")
	private String szXz;//所在乡镇
	@Field("SZ_XZC")
	private String szXzC;//所在行政村
	@Field("MC")
	private String mc;//名称
	@Field("SHAPE")
	private Integer shape; 
	@Field("MJ")
	private Double mj;  //面积
	@Field("FULLNAME")
	private String fullname; //行政村全称
	private Double plantMj;
	private Double animalMj;
	private Map<String,Object> result;

	public Map<String, Object> getResult() {
		return result;
	}

	public void setResult(Map<String, Object> result) {
		this.result = result;
	}

	public Double getAnimalMj() {
		return animalMj;
	}

	public void setAnimalMj(Double animalMj) {
		this.animalMj = animalMj;
	}

	public Double getPlantMj() {
		return plantMj;
	}

	public void setPlantMj(Double plantMj) {
		this.plantMj = plantMj;
	}

	public Double getAid() {
		return aid;
	}

	public void setAid(Double aid) {
		this.aid = aid;
	}


	public Double getObjectid() {
		return objectid;
	}


	public void setObjectid(Double objectid) {
		this.objectid = objectid;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getSzQx() {
		return szQx;
	}


	public void setSzQx(String szQx) {
		this.szQx = szQx;
	}


	public String getSzXz() {
		return szXz;
	}


	public void setSzXz(String szXz) {
		this.szXz = szXz;
	}


	public String getMc() {
		return mc;
	}


	public void setMc(String mc) {
		this.mc = mc;
	}




	public Integer getShape() {
		return shape;
	}


	public void setShape(Integer shape) {
		this.shape = shape;
	}

	public String getSzXzC() {
		return szXzC;
	}


	public void setSzXzC(String szXzC) {
		this.szXzC = szXzC;
	}


	public Double getMj() {
		return mj;
	}


	public void setMj(Double mj) {
		this.mj = mj;
	}


	public String getSzQxCode() {
		return szQxCode;
	}


	public void setSzQxCode(String szQxCode) {
		this.szQxCode = szQxCode;
	}


	public String getSzXzCode() {
		return szXzCode;
	}


	public void setSzXzCode(String szXzCode) {
		this.szXzCode = szXzCode;
	}


	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getFullname() {
		return fullname;
	}


	public void setFullname(String fullname) {
		this.fullname = fullname;
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
		RegVillage other = (RegVillage) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	
}

