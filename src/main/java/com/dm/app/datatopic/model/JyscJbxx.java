package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 
 * @author lyh
 * @description 经营市场基本信息
 */
@Document(collection="m_SCDP_JYSC_JBXX")
public class JyscJbxx implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id;  //monggoId
	@Field("ID")
	private Double objectId; //标识符	
	@Field("GL_ID")
	private Double glId; //关联id	
	@Field("MC")
	private String mc;//名称
	@Field("QX_MC")
	private String qxMc;//区县
	@Field("XZ_MC")
	private String xzMc;//乡镇
	@Field("XZC_MC")
	private String xzcMc;//行政村
	@Field("XX_DZ")
	private String xxDz;//地址
	@Field("DWFY_HGZBH")
	private String dwfyHgzbh;//动物防疫合格证编号
	@Field("FR_DB")
	private String frDb;//法人
	@Field("LX_DH")
	private String lxDh;//联系电话
	@Field("CZ_HM")
	private String czHm;//**号码
	@Field("YZ_BM")
	private String yzBm;//邮编
	@Field("XZC_CODE")
	private String xzcCode;//行政村编码
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
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
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
	public String getXzcMc() {
		return xzcMc;
	}
	public void setXzcMc(String xzcMc) {
		this.xzcMc = xzcMc;
	}
	public String getXxDz() {
		return xxDz;
	}
	public void setXxDz(String xxDz) {
		this.xxDz = xxDz;
	}
	public String getDwfyHgzbh() {
		return dwfyHgzbh;
	}
	public void setDwfyHgzbh(String dwfyHgzbh) {
		this.dwfyHgzbh = dwfyHgzbh;
	}
	public String getFrDb() {
		return frDb;
	}
	public void setFrDb(String frDb) {
		this.frDb = frDb;
	}
	public String getLxDh() {
		return lxDh;
	}
	public void setLxDh(String lxDh) {
		this.lxDh = lxDh;
	}
	public String getCzHm() {
		return czHm;
	}
	public void setCzHm(String czHm) {
		this.czHm = czHm;
	}
	public String getYzBm() {
		return yzBm;
	}
	public void setYzBm(String yzBm) {
		this.yzBm = yzBm;
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
		JyscJbxx other = (JyscJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
