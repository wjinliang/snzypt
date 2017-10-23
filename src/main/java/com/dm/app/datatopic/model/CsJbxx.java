package com.dm.app.datatopic.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 
 * @author lyh
 * @description 超市基本信息实体类
 */
@Document(collection="m_SCDP_CGXPT_CS_JBXX")
public class CsJbxx implements Serializable {

	
	private static final long serialVersionUID = 1L;
	@Id
	private String id;  //monggoId
	@Field("ID")
	private Double objectId; //标识符	
	@Field("GL_ID")
	private Double glId; //关联id
	@Field("SZ_QX")
	private String szQx; //所在区县
	
	@Field("SZ_XZ")
	private String szXz;//所在乡镇
	@Field("SZ_XZC")
	private String szXzc;//所在行政村
	@Field("GX_QX")
	private String gxQx;//管辖区县
	@Field("CS_ZH")
	private String csZh;//字号
	@Field("JY_HY")
	private String jyHy;//经营行业
	@Field("HY_DL")
	private String hyDl;//行业类别
	@Field("QY_LB")
	private String qyLb;//企业类别
	@Field("QY_LX")
	private String qyLx;//企业类型
	@Field("ZC_ZB")
	private String zcZb;//注册资本
	@Field("YY_MJ")
	private String yyMj;//营业面积
	@Field("TS_LX")
	private String tsLx;//特殊类型
	@Field("CS_FR")
	private String csFr;//法人
	@Field("CS_ZCH")
	private String csZch;//注册号
	@Field("CS_ZCQH")
	private String csZcqh;//注册全号
	@Field("QY_BSM")
	private String qyBsm;//企业标识码
	@Field("QY_DAH")
	private String qyDah;//档案号
	@Field("CJ_ZH")
	private String cjZh;//筹建证号
	@Field("YE_FBS")
	private String yeFbs;//副本号
	@Field("DW_BZ")
	private String dwBz;//定位标志
	@Field("CS_QCF")
	private String csQcf;//迁出方
	@Field("JY_FW")
	private String jyFw;//经营范围
	@Field("JY_CS")
	private String jyCs;//经营场所
	@Field("CL_RQ")
	private Date clRq;//成立日期
	@Field("HZ_RQ")
	private Date hzRq;//核准日期
	@Field("YE_QSSJ")
	private Date yeQssj;//营业起始日期
	@Field("YE_ZZSJ")//
	private Date yeZzsj; //营业截止日期
	@Field("BG_CS")
	private String bgCs; //变更次数
	@Field("BZ_SM")
	private String bzSm;//备注说明
	@Field("CY_RS")
	private String cyRs;//从业人数
	@Field("BS_RS")
	private String bsRs;//本市人数
	@Field("WD_RS")
	private String wdRs;//外地人数
	@Field("XG_RS")
	private String xgRs;//下岗人数
	@Field("LS_DW")
	private String lsDw;//隶属单位
	@Field("LSDW_ZCH")
	private String lsdwZch;//隶属单位注册号
	@Field("QY_SQR")
	private String qySqr;//申请人
	@Field("SP_JG")
	private String spJg;//审批机关
	@Field("SP_RQ")
	private Date spRq;//审批日期
	@Field("LX_DH")
	private String lxDh;//联系电话
	@Field("QY_YB")
	private String qyYb;//邮编
	@Field("CS_DZ")
	private String csDz;//地址
	@Field("DZ_CQDW")
	private String dzCqdw;//地址产权单位
	@Field("DZ_SYQX")
	private String dzSyqx;//地址使用期限(年)
	
	
	
	
	
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


	public String getGxQx() {
		return gxQx;
	}


	public void setGxQx(String gxQx) {
		this.gxQx = gxQx;
	}


	public String getCsZh() {
		return csZh;
	}


	public void setCsZh(String csZh) {
		this.csZh = csZh;
	}


	public String getJyHy() {
		return jyHy;
	}


	public void setJyHy(String jyHy) {
		this.jyHy = jyHy;
	}


	public String getHyDl() {
		return hyDl;
	}


	public void setHyDl(String hyDl) {
		this.hyDl = hyDl;
	}


	public String getQyLb() {
		return qyLb;
	}


	public void setQyLb(String qyLb) {
		this.qyLb = qyLb;
	}


	public String getQyLx() {
		return qyLx;
	}


	public void setQyLx(String qyLx) {
		this.qyLx = qyLx;
	}


	public String getZcZb() {
		return zcZb;
	}


	public void setZcZb(String zcZb) {
		this.zcZb = zcZb;
	}


	public String getYyMj() {
		return yyMj;
	}


	public void setYyMj(String yyMj) {
		this.yyMj = yyMj;
	}


	public String getTsLx() {
		return tsLx;
	}


	public void setTsLx(String tsLx) {
		this.tsLx = tsLx;
	}


	public String getCsFr() {
		return csFr;
	}


	public void setCsFr(String csFr) {
		this.csFr = csFr;
	}


	public String getCsZch() {
		return csZch;
	}


	public void setCsZch(String csZch) {
		this.csZch = csZch;
	}


	public String getCsZcqh() {
		return csZcqh;
	}


	public void setCsZcqh(String csZcqh) {
		this.csZcqh = csZcqh;
	}


	public String getQyBsm() {
		return qyBsm;
	}


	public void setQyBsm(String qyBsm) {
		this.qyBsm = qyBsm;
	}


	public String getQyDah() {
		return qyDah;
	}


	public void setQyDah(String qyDah) {
		this.qyDah = qyDah;
	}


	public String getCjZh() {
		return cjZh;
	}


	public void setCjZh(String cjZh) {
		this.cjZh = cjZh;
	}


	public String getYeFbs() {
		return yeFbs;
	}


	public void setYeFbs(String yeFbs) {
		this.yeFbs = yeFbs;
	}


	public String getDwBz() {
		return dwBz;
	}


	public void setDwBz(String dwBz) {
		this.dwBz = dwBz;
	}


	public String getCsQcf() {
		return csQcf;
	}


	public void setCsQcf(String csQcf) {
		this.csQcf = csQcf;
	}


	public String getJyFw() {
		return jyFw;
	}


	public void setJyFw(String jyFw) {
		this.jyFw = jyFw;
	}


	public String getJyCs() {
		return jyCs;
	}


	public void setJyCs(String jyCs) {
		this.jyCs = jyCs;
	}


	public Date getClRq() {
		return clRq;
	}


	public void setClRq(Date clRq) {
		this.clRq = clRq;
	}


	public Date getHzRq() {
		return hzRq;
	}


	public void setHzRq(Date hzRq) {
		this.hzRq = hzRq;
	}


	public Date getYeQssj() {
		return yeQssj;
	}


	public void setYeQssj(Date yeQssj) {
		this.yeQssj = yeQssj;
	}


	public Date getYeZzsj() {
		return yeZzsj;
	}


	public void setYeZzsj(Date yeZzsj) {
		this.yeZzsj = yeZzsj;
	}


	public String getBgCs() {
		return bgCs;
	}


	public void setBgCs(String bgCs) {
		this.bgCs = bgCs;
	}


	public String getBzSm() {
		return bzSm;
	}


	public void setBzSm(String bzSm) {
		this.bzSm = bzSm;
	}


	public String getCyRs() {
		return cyRs;
	}


	public void setCyRs(String cyRs) {
		this.cyRs = cyRs;
	}


	public String getBsRs() {
		return bsRs;
	}


	public void setBsRs(String bsRs) {
		this.bsRs = bsRs;
	}


	public String getWdRs() {
		return wdRs;
	}


	public void setWdRs(String wdRs) {
		this.wdRs = wdRs;
	}


	public String getXgRs() {
		return xgRs;
	}


	public void setXgRs(String xgRs) {
		this.xgRs = xgRs;
	}


	public String getLsDw() {
		return lsDw;
	}


	public void setLsDw(String lsDw) {
		this.lsDw = lsDw;
	}


	public String getQySqr() {
		return qySqr;
	}


	public void setQySqr(String qySqr) {
		this.qySqr = qySqr;
	}


	public String getSpJg() {
		return spJg;
	}


	public void setSpJg(String spJg) {
		this.spJg = spJg;
	}


	public Date getSpRq() {
		return spRq;
	}


	public void setSpRq(Date spRq) {
		this.spRq = spRq;
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


	public String getCsDz() {
		return csDz;
	}


	public void setCsDz(String csDz) {
		this.csDz = csDz;
	}


	public String getDzCqdw() {
		return dzCqdw;
	}


	public void setDzCqdw(String dzCqdw) {
		this.dzCqdw = dzCqdw;
	}


	public String getDzSyqx() {
		return dzSyqx;
	}


	public void setDzSyqx(String dzSyqx) {
		this.dzSyqx = dzSyqx;
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
		CsJbxx other = (CsJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	

}
