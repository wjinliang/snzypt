package com.dm.app.datatopic.model;

import java.util.Date;

import org.apache.solr.client.solrj.beans.Field;
import org.springframework.data.mongodb.core.mapping.Document;
@Document(collection="m_YZ_SCYZC_JYQK")
public class ScyzcJyqk {
	@Field("ID")
	private String id;
	@Field("YZ_MJ")
	private Double yzMj;
	@Field("N_YYE")
	private String nYye;
	@Field("N_DDNHS")
	private String nDdnhs;
	@Field("RZ_QK")
	private String rzQk;
	@Field("JD_JB")
	private String jdJb;
	@Field("TB_ND")
	private Double tbNd;
	@Field("TB_DW")
	private String tbDw;
	@Field("BM_FZR")
	private String bmFzr;
	@Field("TBR_XM")
	private String tbrXm;
	@Field("TB_RQ")
	private Date tbRq;
	@Field("LX_DH")
	private String lxDh;
	@Field("GL_ID")
	private Double glId;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Double getYzMj() {
		return yzMj;
	}
	public void setYzMj(Double yzMj) {
		this.yzMj = yzMj;
	}
	public String getnYye() {
		return nYye;
	}
	public void setnYye(String nYye) {
		this.nYye = nYye;
	}
	public String getnDdnhs() {
		return nDdnhs;
	}
	public void setnDdnhs(String nDdnhs) {
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
	public Double getTbNd() {
		return tbNd;
	}
	public void setTbNd(Double tbNd) {
		this.tbNd = tbNd;
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
	public Date getTbRq() {
		return tbRq;
	}
	public void setTbRq(Date tbRq) {
		this.tbRq = tbRq;
	}
	public String getLxDh() {
		return lxDh;
	}
	public void setLxDh(String lxDh) {
		this.lxDh = lxDh;
	}
	public Double getGlId() {
		return glId;
	}
	public void setGlId(Double glId) {
		this.glId = glId;
	}
	
}
