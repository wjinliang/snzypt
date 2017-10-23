package com.dm.app.datatopic.jichushujuguanli.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection="m_ZH_NJFWZZ_JBXX")
public class NjfuzzJbxx  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8460157757071357334L;

	@Id
	//@Indexed
	private String id;
	
	@Field("ID")
	private Integer ObjectId;
	@Field("QX_MC")
	private String qxMc;//区县名称
	@Field("XZ_MC")
	private String xzMc;//乡镇名称
	@Field("XZC_MC")
	private String xzcMc;//行政村名称
	@Field("XX_DZ")
	private String xxDz;//详细地址
	@Field("FZR_XM")
	private String fzrXm;//负责人姓名
	@Field("LX_DH")
	private String lxDh;//联系电话
	@Field("JS_SJ")
	private String jsSj;//建设时间
	@Field("DX_JJ")
	private String dxJj;//对象简介
	
	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public Integer getObjectId() {
		return ObjectId;
	}


	public void setObjectId(Integer objectId) {
		ObjectId = objectId;
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
		NjfuzzJbxx other = (NjfuzzJbxx) obj;
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
