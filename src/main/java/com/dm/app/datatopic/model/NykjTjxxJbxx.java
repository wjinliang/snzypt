package com.dm.app.datatopic.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 农用科技:田间学校
 * @author lyh
 */
@Document(collection="m_KJZC_KJFW_TJXX_JBXX")
public class NykjTjxxJbxx implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String  id;  //
	@Field("ID")
	private Double  objectId;  //标识符
	@Field("GL_ID")
	private Double  glId;  //关联ID
	@Field("SZ_QX")
	private String  qxMc;  //区县名称
	@Field("SZ_XZ")
	private String  xzMc;  //所在乡镇
	@Field("SZ_XZC")
	private String  xzcMc;  //所在行政村
	@Field("XZC_CODE")
	private String  xzcCode;  //所在行政村编码

	@Field("TJXX_LX")
	private String tjxxLx  ;//田间学校类型
	@Field("HJSK_SJ")
	private String hjskSj  ;//合计授课时间(小时)
	@Field("JB_DW")
	private String jbDw  ;//举办单位
	@Field("FZR_XM")
	private String fzrXm  ;//	负责人姓名
	@Field("LX_DH")
	private String lxDh  ;//联系电话
	@Field("XY_SM")
	private Double xySm  ;//学员数目(人)
	@Field("YTG_JS")
	private String ytgJs  ;//	已推广技术
	@Field("TJ_ND")
	private String tjNd  ;//统计年度
	@Field("TB_DW")
	private String tbDw  ;//	填报单位
	@Field("BM_FZ")
	private String bmFz  ;//部门负责
	@Field("TBR_XM")
	private String tbrXm  ;//	填报人姓名
	@Field("TB_RQ")
	private String tbRq  ;//填报日期
	@Field("LX_FS")
	private String lxFs  ;//联系方式
	
	
	



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


	public String getXzcMc() {
		return xzcMc;
	}


	public void setXzcMc(String xzcMc) {
		this.xzcMc = xzcMc;
	}


	public String getTjxxLx() {
		return tjxxLx;
	}


	public void setTjxxLx(String tjxxLx) {
		this.tjxxLx = tjxxLx;
	}


	public String getHjskSj() {
		return hjskSj;
	}


	public void setHjskSj(String hjskSj) {
		this.hjskSj = hjskSj;
	}


	public String getJbDw() {
		return jbDw;
	}


	public void setJbDw(String jbDw) {
		this.jbDw = jbDw;
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


	public Double getXySm() {
		return xySm;
	}


	public void setXySm(Double xySm) {
		this.xySm = xySm;
	}


	public String getYtgJs() {
		return ytgJs;
	}


	public void setYtgJs(String ytgJs) {
		this.ytgJs = ytgJs;
	}


	public String getTjNd() {
		return tjNd;
	}


	public void setTjNd(String tjNd) {
		this.tjNd = tjNd;
	}


	public String getTbDw() {
		return tbDw;
	}


	public void setTbDw(String tbDw) {
		this.tbDw = tbDw;
	}


	public String getBmFz() {
		return bmFz;
	}


	public void setBmFz(String bmFz) {
		this.bmFz = bmFz;
	}


	public String getTbrXm() {
		return tbrXm;
	}


	public void setTbrXm(String tbrXm) {
		this.tbrXm = tbrXm;
	}


	public String getTbRq() {
		return tbRq;
	}


	public void setTbRq(String tbRq) {
		this.tbRq = tbRq;
	}


	public String getLxFs() {
		return lxFs;
	}


	public void setLxFs(String lxFs) {
		this.lxFs = lxFs;
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
		NykjTjxxJbxx other = (NykjTjxxJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
