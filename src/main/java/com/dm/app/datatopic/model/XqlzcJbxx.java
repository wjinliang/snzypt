package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 畜禽良种场【基本信息】
 * @author huoge
 */
@Document(collection="m_ZYDP_YZ_XQLZC_JBXX")
public class XqlzcJbxx implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id;
	@Field("ID")
	private Double  objectid;  //标识符
	@Field("GL_ID")
	private Double  glId;  //关联ID
	@Field("SZ_QX")
	private String  szQx;  //所在区县
	@Field("SZ_XZ")
	private String  szXz;  //所在乡镇
	@Field("SZ_XZC")
	private String  szXzc;  //所在行政村
	@Field("YZC_DC")
	private String  yzcDc;  //代次
	@Field("DW_PZ")
	private String  dwPz;  //动物种类
	@Field("SL_DW")
	private String  slDw;  //数量级单位
	@Field("JY_FW")
	private String  jyFw;  //经营范围
	@Field("DW_CLL")
	private String  dwCll;  //存栏量
	@Field("FR_DB")
	private String  frDb;  //法人
	@Field("LX_DH")
	private String  lxDh;  //联系电话
	@Field("YZC_YB")
	private String  yzcYb;  //邮编
	@Field("YZC_DZ")
	private String  yzcDz;  //地址
	@Field("TJ_ND")
	private String  tjNd;  //统计年度
	@Field("XZC_CODE")
	private String  xzcCode;  //行政村编码
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Double getObjectid() {
		return objectid;
	}
	public void setObjectid(Double objectid) {
		this.objectid = objectid;
	}
	public Double getGlId() {
		return glId;
	}
	public void setGlId(Double glId) {
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
	public String getYzcDc() {
		return yzcDc;
	}
	public void setYzcDc(String yzcDc) {
		this.yzcDc = yzcDc;
	}
	public String getDwPz() {
		return dwPz;
	}
	public void setDwPz(String dwPz) {
		this.dwPz = dwPz;
	}
	public String getSlDw() {
		return slDw;
	}
	public void setSlDw(String slDw) {
		this.slDw = slDw;
	}
	public String getJyFw() {
		return jyFw;
	}
	public void setJyFw(String jyFw) {
		this.jyFw = jyFw;
	}
	public String getDwCll() {
		return dwCll;
	}
	public void setDwCll(String dwCll) {
		this.dwCll = dwCll;
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
	public String getYzcYb() {
		return yzcYb;
	}
	public void setYzcYb(String yzcYb) {
		this.yzcYb = yzcYb;
	}
	public String getYzcDz() {
		return yzcDz;
	}
	public void setYzcDz(String yzcDz) {
		this.yzcDz = yzcDz;
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
		XqlzcJbxx other = (XqlzcJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}


}
