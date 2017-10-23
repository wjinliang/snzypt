package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 
 * @author lyh
 * @description 三品基地  基本信息实体类
 * 
 */
@Document(collection="m_ZZ_SPBASE")
public class ZzSpbase implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id;  //monggoId
	@Field("ID")
	private Double objectId; //标识符	
	@Field("GL_ID")
	private Double glId; //关联id	
	@Field("SZ_QX")
	private String szQx;//所在区县
	@Field("SZ_XZ")
	private String szXz;//所在乡镇
	@Field("SZ_XZC")
	private String szXzc;//所在行政村
	@Field("JD_DZ")
	private String jdDz;//基地地址
	@Field("FZR")
	private String fzr;//负责人
	@Field("LX_DH")
	private String lxDh;//联系电话
	@Field("ZD_MJ")
	private String zdMj;//占地面积
	@Field("YHRZ_QK")
	private Double yhrzQk;//已获认证情况
	@Field("BZHJD_QK")
	private String bzhjdQk;//标准化基地情况
	@Field("SF_GGCZY")
	private String sfGgczy;//是否观光采摘园
	@Field("JS_ND")
	private String jsNd;//建设年度
	@Field("NR_JJ")
	private String nrJj;//
	@Field("BZ")
	private String bz;//备注
	@Field("QT_RZ")
	private String qtRz;//
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
	public Double getGlId() {
		return glId;
	}
	public void setGlId(Double glId) {
		this.glId = glId;
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
	public String getJdDz() {
		return jdDz;
	}
	public void setJdDz(String jdDz) {
		this.jdDz = jdDz;
	}
	public String getFzr() {
		return fzr;
	}
	public void setFzr(String fzr) {
		this.fzr = fzr;
	}
	public String getLxDh() {
		return lxDh;
	}
	public void setLxDh(String lxDh) {
		this.lxDh = lxDh;
	}
	public String getZdMj() {
		return zdMj;
	}
	public void setZdMj(String zdMj) {
		this.zdMj = zdMj;
	}
	public Double getYhrzQk() {
		return yhrzQk;
	}
	public void setYhrzQk(Double yhrzQk) {
		this.yhrzQk = yhrzQk;
	}
	public String getBzhjdQk() {
		return bzhjdQk;
	}
	public void setBzhjdQk(String bzhjdQk) {
		this.bzhjdQk = bzhjdQk;
	}
	public String getSfGgczy() {
		return sfGgczy;
	}
	public void setSfGgczy(String sfGgczy) {
		this.sfGgczy = sfGgczy;
	}
	public String getJsNd() {
		return jsNd;
	}
	public void setJsNd(String jsNd) {
		this.jsNd = jsNd;
	}
	public String getNrJj() {
		return nrJj;
	}
	public void setNrJj(String nrJj) {
		this.nrJj = nrJj;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getQtRz() {
		return qtRz;
	}
	public void setQtRz(String qtRz) {
		this.qtRz = qtRz;
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
		ZzSpbase other = (ZzSpbase) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
