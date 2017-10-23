package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 
 *                  
 * @date: 2017年3月14日
 * @Author: lyh
 * @FileName: NatureSoil.java
 * @Version: 1.0
 * @About:  自然资源土壤资源:土壤养分
 *
 */
@Document(collection="m_ZYDP_ST_ZZ_TRYF")
public class NatureSoil implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id  ;//标识符
	@Field("ID")
	private String id1  ;//标识符
	@Field("OBJECTID")
	private Integer objectId;//
	@Field("SZ_QX")
	private String szQx  ;//所在区县
	@Field("SZ_XZ")
	private String szXz  ;//所在乡镇
	@Field("SZ_XZC")
	private String szXzc  ;//所在行政村
	@Field("XZC_CODE")
	private String  xzcCode;  //所在行政村编码
	@Field("DL_MC")
	private String dlMc  ;//地类名称
	@Field("FAST_P")
	private Double fastP  ;//速效磷
	@Field("FAST_K")
	private Double fastK  ;//速效钾
	@Field("ALKA_N")
	private Double alkaN ;//破解氮
	@Field("ORGANIC")
	private Double organic  ;//有机质
	@Field("ENT_N")
	private Double entN  ;//全氮
	@Field("YJZ_FZ")
	private Double yjzFz  ;//有机质分值
	@Field("YXP_FZ")
	private Double yxpFz  ;//有效磷分值
	@Field("QN_FZ")
	private Double qnFz  ;//全氮分值
	@Field("SXK_FZ")
	private Double sxkFz  ;//速效钾分值
	@Field("JJN_FZ")
	private Double jjnFz  ;//**氮分值
	
	@Field("SHAPE_MJ")
	private Double shapeMj  ;//面积
	
	@Field("SHAPE")
	private Double shape  ;//面积
	
	
	@Field("AREA_")
	private Double area0  ;//
	
	@Field("LEN")
	private Double len  ;//
	
	@Field("LEN_12")
	private Double len12  ;//
	
	@Field("LEN_1")
	private Double len1  ;//
	
	@Field("AREA")
	private Double area  ;//
	
	@Field("AREA_1")
	private Double area1  ;//

	@Field("MC")
	private String mc  ;//
	
	
	

	public String getXzcCode() {
		return xzcCode;
	}


	public void setXzcCode(String xzcCode) {
		this.xzcCode = xzcCode;
	}


	public String getId1() {
		return id1;
	}


	public void setId1(String id1) {
		this.id1 = id1;
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


	public String getSzXzc() {
		return szXzc;
	}


	public void setSzXzc(String szXzc) {
		this.szXzc = szXzc;
	}


	public String getDlMc() {
		return dlMc;
	}


	public void setDlMc(String dlMc) {
		this.dlMc = dlMc;
	}


	public Double getFastP() {
		return fastP;
	}


	public void setFastP(Double fastP) {
		this.fastP = fastP;
	}


	public Double getFastK() {
		return fastK;
	}


	public void setFastK(Double fastK) {
		this.fastK = fastK;
	}


	public Double getAlkaN() {
		return alkaN;
	}


	public void setAlkaN(Double alkaN) {
		this.alkaN = alkaN;
	}


	public Double getOrganic() {
		return organic;
	}


	public void setOrganic(Double organic) {
		this.organic = organic;
	}


	public Double getEntN() {
		return entN;
	}


	public void setEntN(Double entN) {
		this.entN = entN;
	}


	public Double getYjzFz() {
		return yjzFz;
	}


	public void setYjzFz(Double yjzFz) {
		this.yjzFz = yjzFz;
	}


	public Double getYxpFz() {
		return yxpFz;
	}


	public void setYxpFz(Double yxpFz) {
		this.yxpFz = yxpFz;
	}


	public Double getQnFz() {
		return qnFz;
	}


	public void setQnFz(Double qnFz) {
		this.qnFz = qnFz;
	}


	public Double getSxkFz() {
		return sxkFz;
	}


	public void setSxkFz(Double sxkFz) {
		this.sxkFz = sxkFz;
	}


	public Double getJjnFz() {
		return jjnFz;
	}


	public void setJjnFz(Double jjnFz) {
		this.jjnFz = jjnFz;
	}


	public Double getShapeMj() {
		return shapeMj;
	}


	public void setShapeMj(Double shapeMj) {
		this.shapeMj = shapeMj;
	}


	public Double getShape() {
		return shape;
	}


	public void setShape(Double shape) {
		this.shape = shape;
	}


	public Double getArea0() {
		return area0;
	}


	public void setArea0(Double area0) {
		this.area0 = area0;
	}


	public Double getLen() {
		return len;
	}


	public void setLen(Double len) {
		this.len = len;
	}


	public Double getLen12() {
		return len12;
	}


	public void setLen12(Double len12) {
		this.len12 = len12;
	}


	public Double getLen1() {
		return len1;
	}


	public void setLen1(Double len1) {
		this.len1 = len1;
	}


	public Double getArea() {
		return area;
	}


	public void setArea(Double area) {
		this.area = area;
	}


	public Double getArea1() {
		return area1;
	}


	public void setArea1(Double area1) {
		this.area1 = area1;
	}


	public String getMc() {
		return mc;
	}


	public void setMc(String mc) {
		this.mc = mc;
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
		NatureSoil other = (NatureSoil) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	


}
