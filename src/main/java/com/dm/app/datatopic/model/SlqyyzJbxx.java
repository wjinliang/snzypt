package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 饲料企业【基本信息】
 * @author huoge
 */
@Document(collection="m_ZYDP_YZ_SLQY_JBXX")
public class SlqyyzJbxx implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String   id;  //
	@Field("ID")
	 private Integer   objectId;  //标识符
	@Field("GL_ID")
	 private Integer   glId;  //关联ID
	@Field("SZ_QX")
	 private String   szQx;  //所在区县
	@Field("SZ_XZ")
	 private String   szXz;  //所在乡镇
	@Field("SZ_XZC")
	 private String   szXzc;  //所在行政村
	@Field("CL_RQ")
	 private String   clRq;  //成立日期
	@Field("ZZJJ_DM")
	 private String   zzjjDm;  //组织机构代码
	@Field("SC_NL")
	 private Double   scNl;  //生产能力
	@Field("CP_LB")
	 private String   cpLb;  //产品类别
	@Field("LXR")
	 private String   lxr;  //联系人
	@Field("LX_DH")
	 private String   lxDh;  //联系电话
	@Field("QY_YB")
	 private String   qyYb;  //邮编
	@Field("ZC_DZ")
	 private String   zcDz;  //注册地址
	@Field("SC_DZ")
	 private String   scDz;  //生产地址
	@Field("TX_DZ")
	 private String   txDz;  //通讯地址
	@Field("XZC_CODE")
	private String   xzcCode;  //行政村编码
	
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


	public String getSzXzc() {
		return szXzc;
	}


	public void setSzXzc(String szXzc) {
		this.szXzc = szXzc;
	}


	public String getClRq() {
		return clRq;
	}


	public void setClRq(String clRq) {
		this.clRq = clRq;
	}


	public String getZzjjDm() {
		return zzjjDm;
	}


	public void setZzjjDm(String zzjjDm) {
		this.zzjjDm = zzjjDm;
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


	public Double getScNl() {
		return scNl;
	}


	public void setScNl(Double scNl) {
		this.scNl = scNl;
	}


	public String getCpLb() {
		return cpLb;
	}


	public void setCpLb(String cpLb) {
		this.cpLb = cpLb;
	}


	public String getLxr() {
		return lxr;
	}


	public void setLxr(String lxr) {
		this.lxr = lxr;
	}


	public String getLxDh() {
		return lxDh;
	}


	public void setLxDh(String lxDh) {
		this.lxDh = lxDh;
	}


	public String getQyYb() {
		return qyYb;
	}


	public void setQyYb(String qyYb) {
		this.qyYb = qyYb;
	}


	public String getZcDz() {
		return zcDz;
	}


	public void setZcDz(String zcDz) {
		this.zcDz = zcDz;
	}


	public String getScDz() {
		return scDz;
	}


	public void setScDz(String scDz) {
		this.scDz = scDz;
	}


	public String getTxDz() {
		return txDz;
	}


	public void setTxDz(String txDz) {
		this.txDz = txDz;
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
		SlqyyzJbxx other = (SlqyyzJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
