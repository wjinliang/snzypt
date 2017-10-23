package com.dm.app.datatopic.model;

import java.io.Serializable;
/**
 * @description 水产追溯企业【基本信息表】
 * @author huoge
 */
 
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection="m_ZYDP_YZ_SCZSQY_JBXX")
public class SczsqyyzJbxx implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String   id;  //
	@Field("SZ_QX")
	private String   szQx;  //区县
	@Field("SZ_XZ")
	private String   szXz;  //乡镇
	@Field("SZ_XZC")
	private String  szXzc ;  //行政村
	@Field("QY_PP")
	private String   qyPp;  //品牌
	@Field("YJ_CL")
	private String   yjCl;  //预计产量(万斤)
	@Field("ZY_CP")
	private String  zyCp ;  //主要产品
	@Field("ZS_FS")
	private String   zsFs;  //追溯方式
	@Field("XS_DQ")
	private String   xsDq;  //销售地区
	@Field("LXR")
	private String   lxr;  //联系人
	@Field("LX_DH")
	private String   lxDh;  //电话
	@Field("QY_YB")
	private String   qyYb;  //邮编
	@Field("QY_DZ")
	private String   qyDz;  //地址
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


	public String getQyPp() {
		return qyPp;
	}


	public void setQyPp(String qyPp) {
		this.qyPp = qyPp;
	}


	public String getYjCl() {
		return yjCl;
	}


	public void setYjCl(String yjCl) {
		this.yjCl = yjCl;
	}


	public String getZyCp() {
		return zyCp;
	}


	public void setZyCp(String zyCp) {
		this.zyCp = zyCp;
	}


	public String getZsFs() {
		return zsFs;
	}


	public void setZsFs(String zsFs) {
		this.zsFs = zsFs;
	}


	public String getXsDq() {
		return xsDq;
	}


	public void setXsDq(String xsDq) {
		this.xsDq = xsDq;
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


	public String getQyDz() {
		return qyDz;
	}


	public void setQyDz(String qyDz) {
		this.qyDz = qyDz;
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
		SczsqyyzJbxx other = (SczsqyyzJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	
}
