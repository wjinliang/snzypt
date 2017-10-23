package com.dm.app.datatopic.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 
 * @author lyh
 * @description 农副市场 基本信息实体类
 * 
 */
@Document(collection="m_SCDP_CGXPT_NFSC_JBXX")
public class NfscJbxx implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id;  //monggoId
	@Field("ID")
	private Double objectId; //标识符	
	@Field("GL_ID")
	private Double glId; //关联id			
	@Field("SZ_QX")
	private String szQx;//所在区县
	@Field("SZ_XZ")
	private String szXz;//所在乡镇
	@Field("SZ_XZC")
	private String szXzc;//所在行政村
	@Field("GX_QX")
	private String gxQx;//管辖区县
	@Field("NFSC_ZH")
	private String nfscZh;//字号
	@Field("JY_HY")
	private String jyHy;//经营行业
	@Field("HY_DL")
	private String hyDl;//行业类别
	@Field("QY_LB")
	private String qyLb;//企业类别
	@Field("QY_LX")
	private String qyLx;//企业类型
	@Field("ZC_ZB")
	private Double zcZb;//注册资本
	@Field("YY_MJ")
	private Double yyMj;//营业面积
	@Field("TS_LX")
	private String tsLx;//特殊类型
	@Field("NFSC_FR")
	private String nfscFr;//法人
	@Field("NFSC_ZCH")
	private String nfscZch;//注册号
	@Field("NFSC_ZCQH")
	private String nfscZcqh;//注册全号
	@Field("QY_DAH")
	private String qyDah;//档案号
	@Field("CJ_ZH")
	private String cjZh;//筹建证号
	@Field("YE_FBS")
	private Double yeFbs;//副本号
	@Field("DW_BZ")
	private String dwBz;//定位标志
	@Field("QR_BJ")
	private String qrBj;//迁入标记
	@Field("QR_RQ")
	private String qrRq;//迁入日期
	@Field("NFSC_QCF")
	private String nfscQcf;//迁出方
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
	@Field("YE_ZZSJ")
	private Date yeZzsj;//营业截止日期
	@Field("BG_CS")
	private String bgCs;//变更次数
	@Field("BA_CS")
	private String baCs;//备案次数
	@Field("CY_RS")
	private Double cyRs;//从业人数
	@Field("BS_RS")
	private Double bsRs;//本市人数
	@Field("WD_RS")
	private Double wdRs;//外地人数
	@Field("XG_RS")
	private Double xgRs;//下岗人数
	@Field("LS_DW")
	private String lsDw;//隶属单位
	@Field("LSDW_ZCH")
	private String lsdwZch;//隶属单位注册号
	@Field("QY_SQR")
	private String qySqr;//申请人
	@Field("SP_JG")
	private String spJg;//审批机关
	@Field("SP_RQ")
	private String spRq;//审批日期
	@Field("LX_DH")
	private String lxDh;//联系电话
	@Field("QY_YB")
	private String qyYb;//邮编
	@Field("NFSC_DZ")
	private String nfscDz;//地址
	@Field("NFSC_CQDW")
	private String nfscCqdw;//地址产权单位
	@Field("NFSC_SYQX")
	private String nfscSyqx;//地址使用期限(年)

	private String gsmc;
	@Field("XZC_CODE")
	private String xzcCode;//行政村编码
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
	public String getNfscZh() {
		return nfscZh;
	}
	public void setNfscZh(String nfscZh) {
		this.nfscZh = nfscZh;
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
	public Double getZcZb() {
		return zcZb;
	}
	public void setZcZb(Double zcZb) {
		this.zcZb = zcZb;
	}
	public Double getYyMj() {
		return yyMj;
	}
	public void setYyMj(Double yyMj) {
		this.yyMj = yyMj;
	}
	public String getTsLx() {
		return tsLx;
	}
	public void setTsLx(String tsLx) {
		this.tsLx = tsLx;
	}
	public String getNfscFr() {
		return nfscFr;
	}
	public void setNfscFr(String nfscFr) {
		this.nfscFr = nfscFr;
	}
	public String getNfscZch() {
		return nfscZch;
	}
	public void setNfscZch(String nfscZch) {
		this.nfscZch = nfscZch;
	}
	public String getNfscZcqh() {
		return nfscZcqh;
	}
	public void setNfscZcqh(String nfscZcqh) {
		this.nfscZcqh = nfscZcqh;
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
	public Double getYeFbs() {
		return yeFbs;
	}
	public void setYeFbs(Double yeFbs) {
		this.yeFbs = yeFbs;
	}
	public String getDwBz() {
		return dwBz;
	}
	public void setDwBz(String dwBz) {
		this.dwBz = dwBz;
	}
	public String getQrBj() {
		return qrBj;
	}
	public void setQrBj(String qrBj) {
		this.qrBj = qrBj;
	}
	public String getQrRq() {
		return qrRq;
	}
	public void setQrRq(String qrRq) {
		this.qrRq = qrRq;
	}
	public String getNfscQcf() {
		return nfscQcf;
	}
	public void setNfscQcf(String nfscQcf) {
		this.nfscQcf = nfscQcf;
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
	public String getBaCs() {
		return baCs;
	}
	public void setBaCs(String baCs) {
		this.baCs = baCs;
	}
	public Double getCyRs() {
		return cyRs;
	}
	public void setCyRs(Double cyRs) {
		this.cyRs = cyRs;
	}
	public Double getBsRs() {
		return bsRs;
	}
	public void setBsRs(Double bsRs) {
		this.bsRs = bsRs;
	}
	public Double getWdRs() {
		return wdRs;
	}
	public void setWdRs(Double wdRs) {
		this.wdRs = wdRs;
	}
	public Double getXgRs() {
		return xgRs;
	}
	public void setXgRs(Double xgRs) {
		this.xgRs = xgRs;
	}
	public String getLsDw() {
		return lsDw;
	}
	public void setLsDw(String lsDw) {
		this.lsDw = lsDw;
	}
	public String getLsdwZch() {
		return lsdwZch;
	}
	public void setLsdwZch(String lsdwZch) {
		this.lsdwZch = lsdwZch;
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
	public String getSpRq() {
		return spRq;
	}
	public void setSpRq(String spRq) {
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
	public String getNfscDz() {
		return nfscDz;
	}
	public void setNfscDz(String nfscDz) {
		this.nfscDz = nfscDz;
	}
	public String getNfscCqdw() {
		return nfscCqdw;
	}
	public void setNfscCqdw(String nfscCqdw) {
		this.nfscCqdw = nfscCqdw;
	}
	public String getNfscSyqx() {
		return nfscSyqx;
	}
	public void setNfscSyqx(String nfscSyqx) {
		this.nfscSyqx = nfscSyqx;
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
		NfscJbxx other = (NfscJbxx) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	public String getGsmc() {
		return gsmc;
	}
	public void setGsmc(String gsmc) {
		this.gsmc = gsmc;
	}
	

}
