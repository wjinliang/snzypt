package com.dm.app.datatopic.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 农用科技:远程教育站点
 * @author lyh
 */
@Document(collection="m_KJZC_KJFW_YCJY_JBXX")
public class NykjYcjyzdJbxx implements Serializable {
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
	@Field("JZ_SJ")
	private Date jzSj  ;//建站时间
	@Field("FW_SJ")
	private String fwSj  ;//服务时间
	
	@Field("RY_SL")
	private String rySl  ;//人员数量

	@Field("PX_GM")
	private Double pxGm  ;//培训规模
	@Field("LXR")
	private String lxr  ;//联系人
	@Field("LX_DH")
	private String lxDh  ;//联系电话
	@Field("YD_DH")
	private String ydDh  ;//手机(移动电话)
	@Field("DZ_YJ")
	private String dzYj  ;//E-mail；(电子邮件)	
	
	
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


	public Date getJzSj() {
		return jzSj;
	}


	public void setJzSj(Date jzSj) {
		this.jzSj = jzSj;
	}


	public String getFwSj() {
		return fwSj;
	}


	public void setFwSj(String fwSj) {
		this.fwSj = fwSj;
	}


	public String getRySl() {
		return rySl;
	}


	public void setRySl(String rySl) {
		this.rySl = rySl;
	}


	public Integer getObjectId() {
		return objectId;
	}


	public void setObjectId(Integer objectId) {
		this.objectId = objectId;
	}


	public Double getPxGm() {
		return pxGm;
	}


	public void setPxGm(Double pxGm) {
		this.pxGm = pxGm;
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
		NykjYcjyzdJbxx other = (NykjYcjyzdJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
