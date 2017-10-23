package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 
 *                  
 * @date: 2017年2月18日
 * @Author: 龙亚辉
 * @Email: 502230926@qq.com
 * @FileName: GggyJbxx.java
 * @Version: 1.0
 * @About: 观光果园 基本信息
 *
 */
@Document(collection="m_ZYDP_LY_GGGY_JBXX")
public class GggyJbxx implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id; 
	@Field("ID")
	private Integer objectId; //标识符
	@Field("GL_ID")
	private Integer glId; //关联ID
	@Field("SZ_QX")
	private String szQx;//区县
	@Field("SZ_XZ")
	private String szXz;//乡镇
	@Field("SZ_XZC")
	private String szXzc;//行政村
	@Field("GY_MJ")
	private Double gyMj;//面积(亩)
	@Field("GY_CL")
	private Double gyCl;//产量(万斤)
	@Field("JY_FW")
	private String jyFw;//经营范围
	@Field("LXR")
	private String lxr;//联系人
	@Field("LX_DH")
	private String lxDh;//联系电话
	@Field("GY_DZ")
	private String gyDz;//地址
	@Field("TJ_ND")
	private String tjNd;//统计年度
	@Field("XZC_CODE")
	private String xzcCode;//行政村编码
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
	public Double getGyMj() {
		return gyMj;
	}
	public void setGyMj(Double gyMj) {
		this.gyMj = gyMj;
	}
	public Double getGyCl() {
		return gyCl;
	}
	public void setGyCl(Double gyCl) {
		this.gyCl = gyCl;
	}
	public String getJyFw() {
		return jyFw;
	}
	public void setJyFw(String jyFw) {
		this.jyFw = jyFw;
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
	public String getGyDz() {
		return gyDz;
	}
	public void setGyDz(String gyDz) {
		this.gyDz = gyDz;
	}
	public String getTjNd() {
		return tjNd;
	}
	public void setTjNd(String tjNd) {
		this.tjNd = tjNd;
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
		GggyJbxx other = (GggyJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
