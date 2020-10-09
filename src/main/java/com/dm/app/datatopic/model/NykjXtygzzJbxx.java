package com.dm.app.datatopic.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 农用科技:协调员工作站
 * @author lyh
 */
@Document(collection="m_KJZC_KJFW_XTYGZZ_JBXX")
public class NykjXtygzzJbxx implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String  id;  //
	@Field("ID")
	private Integer  objectId;  //标识符
	@Field("GL_ID")
	private Integer  glId;  //关联ID
	@Field("SZ_QX")
	private String  qxMc;  //区县名称
	@Field("SZ_XZ")
	private String  xzMc;  //所在乡镇
	@Field("SZ_XZC")
	private String  xzcMc;  //所在行政村
	@Field("XZC_CODE")
	private String  xzcCode;  //所在行政村编码
	@Field("YT_DW")
	private String ytDw  ;//依托单位
	@Field("RY_SL")
	private String rySl  ;//人员数量
	@Field("ZD_MC")
	private String zdMc  ;//站点名称
	
	
	@Field("FW_DX")
	private String fwDx  ;//服务对象
	@Field("FW_NW")
	private String fwNw  ;//服务内容
	@Field("JZ_SJ")
	private Date jzSj  ;//建站时间
	@Field("LXR")
	private String lxr  ;//联系人

	@Field("LX_DH")
	private String lxDh  ;//联系电话
	@Field("YD_DH")
	private String ydDh  ;//手机(移动电话)
	@Field("DZ_YJ")
	private String dzYj  ;//E-mail；(电子邮件)	
	
	
	public String getZdMc() {
		return zdMc;
	}
	public void setZdMc(String zdMc) {
		this.zdMc = zdMc;
	}

	public String getXzcCode() {
		return xzcCode;
	}


	public void setXzcCode(String xzcCode) {
		this.xzcCode = xzcCode;
	}


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


	public String getYtDw() {
		return ytDw;
	}


	public void setYtDw(String ytDw) {
		this.ytDw = ytDw;
	}


	public String getRySl() {
		return rySl;
	}


	public void setRySl(String rySl) {
		this.rySl = rySl;
	}





	public String getFwDx() {
		return fwDx;
	}


	public void setFwDx(String fwDx) {
		this.fwDx = fwDx;
	}


	public String getFwNw() {
		return fwNw;
	}


	public void setFwNw(String fwNw) {
		this.fwNw = fwNw;
	}


	public Date getJzSj() {
		return jzSj;
	}


	public void setJzSj(Date jzSj) {
		this.jzSj = jzSj;
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


	public String getYdDh() {
		return ydDh;
	}


	public void setYdDh(String ydDh) {
		this.ydDh = ydDh;
	}


	public String getDzYj() {
		return dzYj;
	}


	public void setDzYj(String dzYj) {
		this.dzYj = dzYj;
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
		NykjXtygzzJbxx other = (NykjXtygzzJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
