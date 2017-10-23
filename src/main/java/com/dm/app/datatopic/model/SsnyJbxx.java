package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 
 * @author lyh
 * @description 设施农业  基本信息实体类
 * 
 */
@Document(collection="m_ZZ_SSNY_JBXX")
public class SsnyJbxx implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id;  //monggoId
	@Field("ID")
	private Integer objectId; //标识符	
	@Field("GL_ID")
	private Integer glId; //关联id	
	@Field("C_COUNTY")
	private String cCounty;//所在区县
	@Field("C_TOWN")
	private String cTown;//所在乡镇
	@Field("C_VILLAGE")
	private String cVillage;//所在行政村
	@Field("C_PLOTNUM")
	private String cPlotnum;//地块数
	@Field("C_ADDR")
	private String cAddr;//地址
	@Field("C_ESTABLIS")
	private String cEstablis;//类型
	@Field("C_WALLSTRU")
	private String cWallstru;//墙结构
	@Field("C_FRAMTYPE")
	private String cFramtype;//框架类型
	@Field("C_PLANTCRO")
	private String cPlantcro;//作物
	@Field("N_ESTABLIS")
	private Double nEstablis;//年建立数量
	@Field("XZC_CODE")
	private String xzcCode;//行政村编码
	
	public String getXzcCode() {
		return xzcCode;
	}
	public void setXzcCode(String xzcCode) {
		this.xzcCode = xzcCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getObjectId() {
		return objectId;
	}
	public void setObjectId(Integer objectId) {
		this.objectId = objectId;
	}
	public Integer getGlId() {
		return glId;
	}
	public void setGlId(Integer glId) {
		this.glId = glId;
	}
	public String getcCounty() {
		return cCounty;
	}
	public void setcCounty(String cCounty) {
		this.cCounty = cCounty;
	}
	public String getcTown() {
		return cTown;
	}
	public void setcTown(String cTown) {
		this.cTown = cTown;
	}
	public String getcVillage() {
		return cVillage;
	}
	public void setcVillage(String cVillage) {
		this.cVillage = cVillage;
	}
	public String getcPlotnum() {
		return cPlotnum;
	}
	public void setcPlotnum(String cPlotnum) {
		this.cPlotnum = cPlotnum;
	}
	public String getcAddr() {
		return cAddr;
	}
	public void setcAddr(String cAddr) {
		this.cAddr = cAddr;
	}
	public String getcEstablis() {
		return cEstablis;
	}
	public void setcEstablis(String cEstablis) {
		this.cEstablis = cEstablis;
	}
	public String getcWallstru() {
		return cWallstru;
	}
	public void setcWallstru(String cWallstru) {
		this.cWallstru = cWallstru;
	}
	public String getcFramtype() {
		return cFramtype;
	}
	public void setcFramtype(String cFramtype) {
		this.cFramtype = cFramtype;
	}
	public String getcPlantcro() {
		return cPlantcro;
	}
	public void setcPlantcro(String cPlantcro) {
		this.cPlantcro = cPlantcro;
	}
	public Double getnEstablis() {
		return nEstablis;
	}
	public void setnEstablis(Double nEstablis) {
		this.nEstablis = nEstablis;
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
		SsnyJbxx other = (SsnyJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	
}
