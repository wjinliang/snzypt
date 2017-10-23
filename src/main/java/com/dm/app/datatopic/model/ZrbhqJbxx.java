package com.dm.app.datatopic.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

/**
 * 
 *                  
 * @date: 2017年2月23日
 * @FileName: ZrbhqJbxx.java
 * @Version: 1.0
 * @About:  自然保护区： 基本信息
 *
 */
@Document(collection="m_ZYDP_LY_ZRBHQ_JBXX")
public class ZrbhqJbxx implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id; 
	@Field("ID")
	private Integer objectId; //标识符
	@Field("GL_ID")
	private Double glId; //关联ID
	@Field("BHQ_MC") 
	private String bhqMc  ;//保护区名称
	@Field("SZ_QX") 
	private String szQx   ;//区县
	@Field("ZG_BM") 
	private String zgBm  ;//主管部门
	@Field("JL_SJ") 
	private Date jlSj  ;//建立时间
	@Field("BHQ_MJ")  
	private Double bhqMj  ;//保护区面积(公顷)
	@Field("BHQ_LX") 
	private String bhqLx  ;//保护区类型
	@Field("BH_DX")  
	private String bhDx  ;//保护对象
	@Field("TJ_ND")
	private String tjNd  ;//统计年度
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
	public Double getGlId() {
		return glId;
	}
	public void setGlId(Double glId) {
		this.glId = glId;
	}
	public String getBhqMc() {
		return bhqMc;
	}
	public void setBhqMc(String bhqMc) {
		this.bhqMc = bhqMc;
	}
	public String getSzQx() {
		return szQx;
	}
	public void setSzQx(String szQx) {
		this.szQx = szQx;
	}
	public String getZgBm() {
		return zgBm;
	}
	public void setZgBm(String zgBm) {
		this.zgBm = zgBm;
	}
	public Date getJlSj() {
		return jlSj;
	}
	public void setJlSj(Date jlSj) {
		this.jlSj = jlSj;
	}
	public Double getBhqMj() {
		return bhqMj;
	}
	public void setBhqMj(Double bhqMj) {
		this.bhqMj = bhqMj;
	}
	public String getBhqLx() {
		return bhqLx;
	}
	public void setBhqLx(String bhqLx) {
		this.bhqLx = bhqLx;
	}
	public String getBhDx() {
		return bhDx;
	}
	public void setBhDx(String bhDx) {
		this.bhDx = bhDx;
	}
	public String getTjNd() {
		return tjNd;
	}
	public void setTjNd(String tjNd) {
		this.tjNd = tjNd;
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
		ZrbhqJbxx other = (ZrbhqJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	
	
	

}
