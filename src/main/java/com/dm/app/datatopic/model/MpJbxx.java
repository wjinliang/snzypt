package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 苗圃基地【基本信息】
 * @author huoge
 */
@Document(collection="m_LY_MP_JBXX")
public class MpJbxx implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String id; 
	@Field("ID")
	private Double objectId; //标识符
	@Field("GL_ID")
	private Double glId; //关联ID
	@Field("QX_MC")
	private String qxMc; //区县名称
	@Field("XZ_MC")
	private String xzMc; //乡镇名称
	@Field("XZC_MC")
	private String xzc; //行政村名称
	@Field("MP_MC")
	private String mpMc;//苗圃名称
	@Field("XX_DZ")
	private String xxDz; //详细地址
	@Field("FZR_XM")
	private String fzrXm;//负责人姓名
	@Field("LX_DH") 
	private String lxDh;//联系电话
	@Field("ZD_MJ")
	private Double zdMj; //占地面积(亩)
	@Field("TJ_ND")
	private String tjNd; //统计年度
	@Field("ZPMM_ZSL")
	private Integer zpmmZsl; //在圃苗木总数量(株)
	@Field("N_MPXSZSL")
	private Integer nmpxszsl; //年苗圃销售总数量(株)
	@Field("N_YYE")
	private Double  zyye;//年营业额(万元)
	@Field("JS_ND")
	private String jsNd;//建设年度
	@Field("DX_JJ")
	private String dxJj;//对象简介
	@Field("XZC_CODE")
	private String xzcCode;//对象简介
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
	
	public String getXzc() {
		return xzc;
	}
	public void setXzc(String xzc) {
		this.xzc = xzc;
	}
	public String getMpMc() {
		return mpMc;
	}
	public void setMpMc(String mpMc) {
		this.mpMc = mpMc;
	}
	public String getXxDz() {
		return xxDz;
	}
	public void setXxDz(String xxDz) {
		this.xxDz = xxDz;
	}
	public String getFzrXm() {
		return fzrXm;
	}
	public void setFzrXm(String fzrXm) {
		this.fzrXm = fzrXm;
	}
	public String getLxDh() {
		return lxDh;
	}
	public void setLxDh(String lxDh) {
		this.lxDh = lxDh;
	}
	public Double getZdMj() {
		return zdMj;
	}
	public void setZdMj(Double zdMj) {
		this.zdMj = zdMj;
	}
	public String getTjNd() {
		return tjNd;
	}
	public void setTjNd(String tjNd) {
		this.tjNd = tjNd;
	}
	public Integer getZpmmZsl() {
		return zpmmZsl;
	}
	public void setZpmmZsl(Integer zpmmZsl) {
		this.zpmmZsl = zpmmZsl;
	}
	public Integer getNmpxszsl() {
		return nmpxszsl;
	}
	public void setNmpxszsl(Integer nmpxszsl) {
		this.nmpxszsl = nmpxszsl;
	}
	public Double getZyye() {
		return zyye;
	}
	public void setZyye(Double zyye) {
		this.zyye = zyye;
	}
	public String getJsNd() {
		return jsNd;
	}
	public void setJsNd(String jsNd) {
		this.jsNd = jsNd;
	}
	public String getDxJj() {
		return dxJj;
	}
	public void setDxJj(String dxJj) {
		this.dxJj = dxJj;
	}
	

	public String getXzcCode() {
		return xzcCode;
	}
	public void setXzcCode(String xzcCode) {
		this.xzcCode = xzcCode;
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
		MpJbxx other = (MpJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
