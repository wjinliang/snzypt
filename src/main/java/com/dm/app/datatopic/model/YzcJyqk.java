package com.dm.app.datatopic.model;

import java.util.Date;

import org.apache.solr.client.solrj.beans.Field;
import org.springframework.data.mongodb.core.mapping.Document;
@Document(collection="m_YZ_YZC_JYQK")
public class YzcJyqk {
	@Field("ID")
	private String id;
	@Field("GL_ID")
	private Double glId;
	@Field("YZ_ZL")
	private Double yzZl;
	@Field("YZ_NCL1")
	private Double yzNcl1;
	@Field("YZ_NCL2")
	private Double yzNcl2;
	@Field("YZ_NCL3")
	private Double yzNcl3;
	@Field("ZYYZ_NCL1")
	private Double zyyzNcl1;
	@Field("ZYYZ_NCL2")
	private Double zyyzNcl2;
	@Field("N_YYE")
	private Double nYye;
	@Field("N_DDNHS")
	private Double nDdnhs;
	@Field("RZ_QK")
	private String rzQk;
	@Field("JD_JB")
	private String jdJb;
	@Field("CRN_SL")
	private Double	 crnSl;
	@Field("FMZ_SL")
	private Double	 fmzSl;
	@Field("TB_DW")
	private String tbDw;
	@Field("BM_FZR")
	private String bmFzr;
	@Field("TBR_XM")
	private String tbrXm;
	@Field("TB_RQ")
	private String tbRq;
	@Field("LX_DH")
	private String lxDh;
	@Field("TJ_ND")
	private String tjNd;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Double getGlId() {
		return glId;
	}
	public void setGlId(Double glId) {
		this.glId = glId;
	}
	public Double getYzZl() {
		return yzZl;
	}
	public void setYzZl(Double yzZl) {
		this.yzZl = yzZl;
	}
	public Double getYzNcl1() {
		return yzNcl1;
	}
	public void setYzNcl1(Double yzNcl1) {
		this.yzNcl1 = yzNcl1;
	}
	public Double getYzNcl2() {
		return yzNcl2;
	}
	public void setYzNcl2(Double yzNcl2) {
		this.yzNcl2 = yzNcl2;
	}
	public Double getYzNcl3() {
		return yzNcl3;
	}
	public void setYzNcl3(Double yzNcl3) {
		this.yzNcl3 = yzNcl3;
	}
	public Double getZyyzNcl1() {
		return zyyzNcl1;
	}
	public void setZyyzNcl1(Double zyyzNcl1) {
		this.zyyzNcl1 = zyyzNcl1;
	}
	public Double getZyyzNcl2() {
		return zyyzNcl2;
	}
	public void setZyyzNcl2(Double zyyzNcl2) {
		this.zyyzNcl2 = zyyzNcl2;
	}
	public Double getnYye() {
		return nYye;
	}
	public void setnYye(Double nYye) {
		this.nYye = nYye;
	}
	public Double getnDdnhs() {
		return nDdnhs;
	}
	public void setnDdnhs(Double nDdnhs) {
		this.nDdnhs = nDdnhs;
	}
	public String getRzQk() {
		return rzQk;
	}
	public void setRzQk(String rzQk) {
		this.rzQk = rzQk;
	}
	public String getJdJb() {
		return jdJb;
	}
	public void setJdJb(String jdJb) {
		this.jdJb = jdJb;
	}
	public Double getCrnSl() {
		return crnSl;
	}
	public void setCrnSl(Double crnSl) {
		this.crnSl = crnSl;
	}
	public Double getFmzSl() {
		return fmzSl;
	}
	public void setFmzSl(Double fmzSl) {
		this.fmzSl = fmzSl;
	}
	public String getTbDw() {
		return tbDw;
	}
	public void setTbDw(String tbDw) {
		this.tbDw = tbDw;
	}
	public String getBmFzr() {
		return bmFzr;
	}
	public void setBmFzr(String bmFzr) {
		this.bmFzr = bmFzr;
	}
	public String getTbrXm() {
		return tbrXm;
	}
	public void setTbrXm(String tbrXm) {
		this.tbrXm = tbrXm;
	}
	public String getTbRq() {
		return tbRq;
	}
	public void setTbRq(String tbRq) {
		this.tbRq = tbRq;
	}
	public String getLxDh() {
		return lxDh;
	}
	public void setLxDh(String lxDh) {
		this.lxDh = lxDh;
	}
	public String getTjNd() {
		return tjNd;
	}
	public void setTjNd(String tjNd) {
		this.tjNd = tjNd;
	}
	
	
}
