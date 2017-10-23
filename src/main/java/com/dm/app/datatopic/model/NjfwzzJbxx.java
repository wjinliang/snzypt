package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 农机服务组织【基本信息】
 * @author huoge
 */
@Document(collection="m_ZH_NJFWZZ_JBXX")
public class NjfwzzJbxx implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String id;//
	@Field("ID")
	private String   objectId;  //标识符
	@Field("GL_ID")
	private String   glId;  //关联ID
	@Field("QX_MC")
	private String   qxMc;  //区县名称
	@Field("XZ_MC")
	private String   xzMc;  //乡镇名称
	@Field("XZC_MC")
	private String   xzcMc;  //所在行政村
	@Field("XX_DZ")
	private String  xxDz ;  //详细地址
	@Field("FZR_XM")
	private String   fzrXm;  //负责人姓名
	@Field("LX_DH")
	private String  lxDh ;  //联系电话
	@Field("JS_SJ")
	private String   jsSj;  //建设时间
	@Field("DX_JJ")
	private String   dxJj;  //对象简介
	@Field("XZC_CODE")
	private String xzcCode;//对象简介
	
	
	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getObjectId() {
		return objectId;
	}


	public void setObjectId(String objectId) {
		this.objectId = objectId;
	}


	public String getGlId() {
		return glId;
	}


	public void setGlId(String glId) {
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


	public String getJsSj() {
		return jsSj;
	}


	public void setJsSj(String jsSj) {
		this.jsSj = jsSj;
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
		NjfwzzJbxx other = (NjfwzzJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
