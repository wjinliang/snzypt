package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 新农村建设[基本信息]
 * @author lyh
 */
@Document(collection="m_KJ_XNCJS")
public class XncJsJbxx implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String   id;  //
	@Field("ID")
	private Double   objectId;  //标识符
	/*@Field("GL_ID")
	private Double   glId;  //关联ID*/
	
	@Field("QX_MC")
	private String   qxMc;  //区县名称
	@Field("XZ_MC")
	private String   xzMc;  //	所在乡镇
	@Field("XZC_MC")
	private String   xzcMc;  //所在行政村
	@Field("TJ_ND")
	private String tjNd  ;//统计年度
	@Field("TYNZM_GS")
	private String tynzmGs  ;//太阳能照明个数(盏)
	@Field("TYNZM_ZJRL")
	private String tynzmZjrl  ;//太阳能照明装机容量(瓦)
	@Field("TYNRSQ_AZHS")
	private String tynrsqAzhs  ;//太阳能热水器安装户数(个)
	@Field("TYNRSQ_CRMJ")
	private String tynrsqCrmj  ;//太阳能热水器采暖面积(平方米)
	@Field("JNWS_DKGS")
	private String jnwsDkgs  ;//节能卫生吊炕个数(户)
	@Field("CXRLJGD_GS")
	private String cxrljgdGs  ;//成型燃料加工点个数(个)
	@Field("CXRLJGD_XHJG")
	private String cxrljgdXhjg  ;//成型燃料加工点消耗秸秆(吨)
	@Field("CXRLJGD_NCL")
	private String cxrljgdNcl  ;//成型燃料加工点年产量(吨)
	@Field("SWZRL_HS")
	private String swzrlHs  ;//生物质燃炉户数(户)
	@Field("SWZRL_CSYR")
	private String swzrlCsyr  ;//生物质燃炉炊事用炉数(台)
	@Field("SWZRL_CNR")
	private String swzrlCnr  ;//生物质燃炉采暖炉(台)
	@Field("NYJSFWZ_GS")
	private String nyjsfwzGs  ;//能源技术服务站个数(个)
	@Field("NCYHGC_GS")
	private String ncyhgcGs  ;//农村雨洪利用工程个数(个)
	@Field("NCYHGC_JSL")
	private String ncyhgcJsl  ;//农村雨洪利用工程集水量(立方米)
	@Field("ZQC_GS")
	private String zqcGs  ;//沼气池个数(个)
	@Field("ZQC_CR")
	private String zqcCr  ;//沼气池池容(立方米)
	@Field("ZQC_NCZQ")
	private String zqcNczq  ;//沼气池年产沼气(立方米)
	@Field("ZQ_SYHS")
	private String zqSyhs  ;//沼气使用户数(户)
	
	@Field("JGQHZ_GS")
	private String jgqhzGs  ;//秸秆气化站个数(个)
	@Field("JGQHZ_CLNL")
	private String jgqhzClnl  ;//秸秆气化站处理能力(吨)
	@Field("JGQHZ_SYHS")
	private String jgqhzSyhs  ;//秸秆气化站使用户数(户)
	@Field("YJHSCD_GS")
	private String yjhscdGs  ;//有机肥生产点个数(个)
	@Field("YJHSCD_NXHFB")
	private String yjhscdNxhfb  ;//有机肥生产点年消耗粪便(吨)
	@Field("YJHSCD_NCL")
	private String yjhscdNcl  ;//有机肥生产点年产量(吨)
	@Field("FWCLD_GS")
	private String fwcldGs  ;//粪污治理点个数
	@Field("FWCLD_NXHFB")
	private String fwcldNxhfb  ;//粪污治理点年消耗粪便(吨)
	@Field("BZ")
	private String bz  ;//备注

	

/*	public String getXzcCode() {
		return xzcCode;
	}


	public void setXzcCode(String xzcCode) {
		this.xzcCode = xzcCode;
	}*/

	



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


	public String getTjNd() {
		return tjNd;
	}


	public void setTjNd(String tjNd) {
		this.tjNd = tjNd;
	}


	public String getTynzmGs() {
		return tynzmGs;
	}


	public void setTynzmGs(String tynzmGs) {
		this.tynzmGs = tynzmGs;
	}


	public String getTynzmZjrl() {
		return tynzmZjrl;
	}


	public void setTynzmZjrl(String tynzmZjrl) {
		this.tynzmZjrl = tynzmZjrl;
	}


	public String getTynrsqAzhs() {
		return tynrsqAzhs;
	}


	public void setTynrsqAzhs(String tynrsqAzhs) {
		this.tynrsqAzhs = tynrsqAzhs;
	}


	public String getTynrsqCrmj() {
		return tynrsqCrmj;
	}


	public void setTynrsqCrmj(String tynrsqCrmj) {
		this.tynrsqCrmj = tynrsqCrmj;
	}


	public String getJnwsDkgs() {
		return jnwsDkgs;
	}


	public void setJnwsDkgs(String jnwsDkgs) {
		this.jnwsDkgs = jnwsDkgs;
	}


	public String getCxrljgdGs() {
		return cxrljgdGs;
	}


	public void setCxrljgdGs(String cxrljgdGs) {
		this.cxrljgdGs = cxrljgdGs;
	}


	public String getCxrljgdXhjg() {
		return cxrljgdXhjg;
	}


	public void setCxrljgdXhjg(String cxrljgdXhjg) {
		this.cxrljgdXhjg = cxrljgdXhjg;
	}


	public String getCxrljgdNcl() {
		return cxrljgdNcl;
	}


	public void setCxrljgdNcl(String cxrljgdNcl) {
		this.cxrljgdNcl = cxrljgdNcl;
	}


	public String getSwzrlHs() {
		return swzrlHs;
	}


	public void setSwzrlHs(String swzrlHs) {
		this.swzrlHs = swzrlHs;
	}


	public String getSwzrlCsyr() {
		return swzrlCsyr;
	}


	public void setSwzrlCsyr(String swzrlCsyr) {
		this.swzrlCsyr = swzrlCsyr;
	}


	public String getSwzrlCnr() {
		return swzrlCnr;
	}


	public void setSwzrlCnr(String swzrlCnr) {
		this.swzrlCnr = swzrlCnr;
	}


	public String getNyjsfwzGs() {
		return nyjsfwzGs;
	}


	public void setNyjsfwzGs(String nyjsfwzGs) {
		this.nyjsfwzGs = nyjsfwzGs;
	}


	public String getNcyhgcGs() {
		return ncyhgcGs;
	}


	public void setNcyhgcGs(String ncyhgcGs) {
		this.ncyhgcGs = ncyhgcGs;
	}


	public String getNcyhgcJsl() {
		return ncyhgcJsl;
	}


	public void setNcyhgcJsl(String ncyhgcJsl) {
		this.ncyhgcJsl = ncyhgcJsl;
	}


	public String getZqcGs() {
		return zqcGs;
	}


	public void setZqcGs(String zqcGs) {
		this.zqcGs = zqcGs;
	}


	public String getZqcCr() {
		return zqcCr;
	}


	public void setZqcCr(String zqcCr) {
		this.zqcCr = zqcCr;
	}


	public String getZqcNczq() {
		return zqcNczq;
	}


	public void setZqcNczq(String zqcNczq) {
		this.zqcNczq = zqcNczq;
	}


	public String getZqSyhs() {
		return zqSyhs;
	}


	public void setZqSyhs(String zqSyhs) {
		this.zqSyhs = zqSyhs;
	}


	public String getJgqhzGs() {
		return jgqhzGs;
	}


	public void setJgqhzGs(String jgqhzGs) {
		this.jgqhzGs = jgqhzGs;
	}


	public String getJgqhzClnl() {
		return jgqhzClnl;
	}


	public void setJgqhzClnl(String jgqhzClnl) {
		this.jgqhzClnl = jgqhzClnl;
	}


	public String getJgqhzSyhs() {
		return jgqhzSyhs;
	}


	public void setJgqhzSyhs(String jgqhzSyhs) {
		this.jgqhzSyhs = jgqhzSyhs;
	}


	public String getYjhscdGs() {
		return yjhscdGs;
	}


	public void setYjhscdGs(String yjhscdGs) {
		this.yjhscdGs = yjhscdGs;
	}


	public String getYjhscdNxhfb() {
		return yjhscdNxhfb;
	}


	public void setYjhscdNxhfb(String yjhscdNxhfb) {
		this.yjhscdNxhfb = yjhscdNxhfb;
	}


	public String getYjhscdNcl() {
		return yjhscdNcl;
	}


	public void setYjhscdNcl(String yjhscdNcl) {
		this.yjhscdNcl = yjhscdNcl;
	}


	public String getFwcldGs() {
		return fwcldGs;
	}


	public void setFwcldGs(String fwcldGs) {
		this.fwcldGs = fwcldGs;
	}


	public String getFwcldNxhfb() {
		return fwcldNxhfb;
	}


	public void setFwcldNxhfb(String fwcldNxhfb) {
		this.fwcldNxhfb = fwcldNxhfb;
	}


	public String getBz() {
		return bz;
	}


	public void setBz(String bz) {
		this.bz = bz;
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
		XncJsJbxx other = (XncJsJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
