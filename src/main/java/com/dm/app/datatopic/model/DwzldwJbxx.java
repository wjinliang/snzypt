package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 动物诊疗单位【基本信息】
 * @author huoge
 */
@Document(collection="m_YZ_DWZLDW_JBXX")
public class DwzldwJbxx implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String   id;  //
	@Field("ID")
	private Integer   objectId;  //
	@Field("GL_ID")
	private Integer   glId;  //
	@Field("QX_MC")
	private String   qxMc;  //区县
	@Field("XZ_MC")
	private String   xzMc;  //乡镇
	@Field("XZC_MC")
	private String   xzcMc;  //行政村
	@Field("DW_MC")
	private String   dwMc;  //单位名称
	@Field("XX_DZ")
	private String  xxDz ;  //详细地址
	@Field("FZR_XM")
	private String   fzrXm;  //负责人姓名
	@Field("LX_DH")
	private String   lxDh;  //联系电话
	@Field("JS_ND")
	private String   jsNd;  //建设年度
	@Field("DX_JJ")
	private String  dxJj ;  //简介
	@Field("XZC_CODE")
	private String   xzcCode;  //行政村编码
	
	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
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


	public String getDwMc() {
		return dwMc;
	}


	public void setDwMc(String dwMc) {
		this.dwMc = dwMc;
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
		DwzldwJbxx other = (DwzldwJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
}
