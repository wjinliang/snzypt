package com.dm.app.datatopic.jichushujuguanli.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection="m_ZYDP_ST_ZZ_TRYF")
public class ZydpstZZTryf  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2076329181956474472L;
	@Id
	//@Indexed
	private String id;
	@Field("SZ_QX")
	private String szQx;//
	@Field("SZ_XZ")
	private String szXz;//
	@Field("SZ_XZC")
	private String szXzc;//
	@Field("SHAPE_MJ")
	private String shapeMj;//
	@Field("DL_MC")
	private String dlMc;//
	@Field("FAST_P")
	private String fastP;//
	@Field("FAST_K")
	private String fastK;//
	@Field("ALKA_N")
	private String alkaN;//
	@Field("ORGANIC")
	private String organiC;//
	@Field("ENT_N")
	private String entN;//
	@Field("YJZ_FZ")
	private String yjzFz;//
	@Field("YXP_FZ")
	private String yxpFz;//
	@Field("QN_FZ")
	private String qnFz;//
	@Field("SXK_FZ")
	private String sxkFz;//
	@Field("JJN_FZ")
	private String jjnFz;//
	@Field("XZQ_BS")
	private String xzqBs;//
	@Field("AREA_")
	private String area_;//
	@Field("LEN")
	private String len;//
	@Field("AREA")
	private String area;//
	@Field("LEN_1")
	private String len1;//
	@Field("MC")
	private String mc;//
	@Field("AREA_1")
	private String area1;//
	@Field("LEN_12")
	private String len12;//
	@Field("SHAPE")
	private Integer shape;//

	
	
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



	public String getSzXzc() {
		return szXzc;
	}


	public void setSzXzc(String szXzc) {
		this.szXzc = szXzc;
	}


	public String getShapeMj() {
		return shapeMj;
	}


	public void setShapeMj(String shapeMj) {
		this.shapeMj = shapeMj;
	}


	public String getDlMc() {
		return dlMc;
	}


	public void setDlMc(String dlMc) {
		this.dlMc = dlMc;
	}


	public String getFastP() {
		return fastP;
	}


	public void setFastP(String fastP) {
		this.fastP = fastP;
	}


	public String getFastK() {
		return fastK;
	}


	public void setFastK(String fastK) {
		this.fastK = fastK;
	}


	public String getAlkaN() {
		return alkaN;
	}


	public void setAlkaN(String alkaN) {
		this.alkaN = alkaN;
	}


	public String getOrganiC() {
		return organiC;
	}


	public void setOrganiC(String organiC) {
		this.organiC = organiC;
	}


	public String getEntN() {
		return entN;
	}


	public void setEntN(String entN) {
		this.entN = entN;
	}


	public String getYjzFz() {
		return yjzFz;
	}


	public void setYjzFz(String yjzFz) {
		this.yjzFz = yjzFz;
	}


	public String getYxpFz() {
		return yxpFz;
	}


	public void setYxpFz(String yxpFz) {
		this.yxpFz = yxpFz;
	}


	public String getQnFz() {
		return qnFz;
	}


	public void setQnFz(String qnFz) {
		this.qnFz = qnFz;
	}


	public String getSxkFz() {
		return sxkFz;
	}


	public void setSxkFz(String sxkFz) {
		this.sxkFz = sxkFz;
	}


	public String getJjnFz() {
		return jjnFz;
	}


	public void setJjnFz(String jjnFz) {
		this.jjnFz = jjnFz;
	}


	public String getXzqBs() {
		return xzqBs;
	}


	public void setXzqBs(String xzqBs) {
		this.xzqBs = xzqBs;
	}


	public String getArea_() {
		return area_;
	}


	public void setArea_(String area_) {
		this.area_ = area_;
	}


	public String getLen() {
		return len;
	}


	public void setLen(String len) {
		this.len = len;
	}


	public String getArea() {
		return area;
	}


	public void setArea(String area) {
		this.area = area;
	}


	public String getLen1() {
		return len1;
	}


	public void setLen1(String len1) {
		this.len1 = len1;
	}


	public String getArea1() {
		return area1;
	}


	public void setArea1(String area1) {
		this.area1 = area1;
	}


	public String getLen12() {
		return len12;
	}


	public void setLen12(String len12) {
		this.len12 = len12;
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
		ZydpstZZTryf other = (ZydpstZZTryf) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
//	"OBJECTID" : 3,
//    "SZ_QX" : "朝阳区",
//    "MC" : "朝阳区",
//    "ID" : 3,
//    "AREA" : 0.0,
//    "LEN" : 0.0,
//    "SHAPE" : 3
	
	
	
}
