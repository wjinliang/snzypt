package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 农用机械
 * @author lyh
 */
@Document(collection="m_ZZ_NYJX_JBXX")
public class NyJxJbxx implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String  id;  //
	@Field("ID")
	private Double  objectId;  //标识符
	@Field("QX_MC")
	private String  qxMc;  //区县名称
	@Field("XZ_MC")
	private String  xzMc;  //所在乡镇
	@Field("NJ_ZDL")
	private Double njZdl  ;//农业机械总动力(万千瓦)
	@Field("DXTLJ_SL")
	private Double dxtljSl  ;//大型拖拉机数量(台)
	@Field("DXTLJ_DL")
	private Double dxtljDl  ;//大型拖拉机动力(万千瓦)
	@Field("XXTLJ_SL")
	private Double xxtljSl  ;//小型拖拉机数量(台)

	@Field("XXTLJ_DL")
	private Double xxtljDl  ;//小型拖拉机动力(万千瓦)
	@Field("DXTLJ_PTJJ")
	private Double dxtljPtjj  ;//大中型拖拉配套机具(部)
	@Field("XXTLJ_PTJJ")
	private Double xxtljPtjj  ;//小型拖拉机拉配套机(部)
	@Field("PGCYJ_SL")
	private Double pgcyjSl  ;//排灌柴油机数量(台)
	@Field("PGCYJ_DL")
	private Double pgcyjDl  ;//排灌柴油机动力(万千瓦)
	@Field("TJ_ND")
	private Double tjNd  ;//统计年度
	@Field("TB_DW")
	private String tbDw  ;//填报单位
	@Field("BM_FZR")
	private String bmFzr  ;//	部门负责人
	@Field("TBR_XM")
	private String tbrXm  ;//填报人
	@Field("TB_RQ")
	private String tbRq  ;//填报日期
	@Field("LX_DH")
	private String lxDh  ;//联系电话


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public Double getObjectId() {
		return objectId;
	}


	public void setObjectId(Double objectId) {
		this.objectId = objectId;
	}


	


	public String getQxMc() {
		return qxMc;
	}


	public void setQxMc(String qxMc) {
		this.qxMc = qxMc;
	}


	public String getXzMc() {
		return xzMc;
	}


	public void setXzMc(String xzMc) {
		this.xzMc = xzMc;
	}


	public Double getNjZdl() {
		return njZdl;
	}


	public void setNjZdl(Double njZdl) {
		this.njZdl = njZdl;
	}


	public Double getDxtljSl() {
		return dxtljSl;
	}


	public void setDxtljSl(Double dxtljSl) {
		this.dxtljSl = dxtljSl;
	}


	public Double getDxtljDl() {
		return dxtljDl;
	}


	public void setDxtljDl(Double dxtljDl) {
		this.dxtljDl = dxtljDl;
	}


	public Double getXxtljSl() {
		return xxtljSl;
	}


	public void setXxtljSl(Double xxtljSl) {
		this.xxtljSl = xxtljSl;
	}


	public Double getXxtljDl() {
		return xxtljDl;
	}


	public void setXxtljDl(Double xxtljDl) {
		this.xxtljDl = xxtljDl;
	}


	public Double getDxtljPtjj() {
		return dxtljPtjj;
	}


	public void setDxtljPtjj(Double dxtljPtjj) {
		this.dxtljPtjj = dxtljPtjj;
	}


	public Double getXxtljPtjj() {
		return xxtljPtjj;
	}


	public void setXxtljPtjj(Double xxtljPtjj) {
		this.xxtljPtjj = xxtljPtjj;
	}


	public Double getPgcyjSl() {
		return pgcyjSl;
	}


	public void setPgcyjSl(Double pgcyjSl) {
		this.pgcyjSl = pgcyjSl;
	}


	public Double getPgcyjDl() {
		return pgcyjDl;
	}


	public void setPgcyjDl(Double pgcyjDl) {
		this.pgcyjDl = pgcyjDl;
	}


	public Double getTjNd() {
		return tjNd;
	}


	public void setTjNd(Double tjNd) {
		this.tjNd = tjNd;
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
		NyJxJbxx other = (NyJxJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
