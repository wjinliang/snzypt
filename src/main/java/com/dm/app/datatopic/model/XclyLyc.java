package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 
 *                  
 * @date: 2017年2月22日
 * @Author: lyh
 * @FileName: XclyLyh.java
 * @Version: 1.0
 * @About:  乡村旅游之旅游村
 *
 */
@Document(collection="im_qsmslycplbzsjcjb")
public class XclyLyc implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id; 
	@Field("shmcpoi_name")
	private String shMc;//商户名称 这里指的是村
	@Field("sfprovince")
	private String sfMc;//省份
	@Field("cscity")
	private String  szsMc;  //所在市
	@Field("qxtown")
	private String  qxMc;  //区县
	/*@Field("XZC_CODE")
	private String  xzcCode;  //行政村编码
*/	
	@Field("xxdzpoi_address")
	private String  address;  //详细地址 
	@Field("dhphone")
	private String  phone;  //
	@Field("jdwd")
	private String  jingDuWeiDu;  //
	@Field("yjxy")
	private String  yjhy;  //一级行业
	@Field("ejxy")
	private String  ejhy;  //二级行业
	@Field("sfysbddt")
	private String  sfBddt;  //是否已上百度地图
	
	@Field("zxrx")
	private String  zxrx;  //咨询热线
	@Field("ydrx")
	private String  ydrx;  //预订热线
	@Field("sfyWIFIfg")
	private String  sfWifi;  //是否有WIFI覆盖
	@Field("ywlyzxfwzx")
	private String  ywlyzxfwzx;
	@Field("czjj")
	private String  jianJie;  //简介
	/*@Field("XZC_CODE")
	private Double  jymj;  //经营面积（平米）
	@Field("XZC_CODE")
	private Integer  cw;  //床位
	@Field("XZC_CODE")
	private Double  jdJg;  //接待价格（每人/天）

	@Field("XZC_CODE")
	private String  jyTs;  //经营特色*/	
	@Field("zshj")
	private String  zsHj;  //住宿环境
	@Field("cyss")
	private String  cySs;  //餐饮设施
	@Field("ylxm")
	private String  ylXm;  //娱乐项目
	@Field("tsms")
	private String  msTs;  //特色美食
	@Field("tsncp")
	private String  tsNcp;  //特色农产品
	@Field("nfggcz")
	private String  nfGgcz;  //能否观光采摘
	@Field("czpzjj")
	private String  czPzJj;  //采摘品种、季节
	
	@Field("csdg")
	private String  csDg;  //传说、典故
	


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getShMc() {
		return shMc;
	}


	public void setShMc(String shMc) {
		this.shMc = shMc;
	}


	public String getSfMc() {
		return sfMc;
	}


	public void setSfMc(String sfMc) {
		this.sfMc = sfMc;
	}


	public String getSzsMc() {
		return szsMc;
	}


	public void setSzsMc(String szsMc) {
		this.szsMc = szsMc;
	}


	public String getQxMc() {
		return qxMc;
	}


	public void setQxMc(String qxMc) {
		this.qxMc = qxMc;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getJingDuWeiDu() {
		return jingDuWeiDu;
	}


	public void setJingDuWeiDu(String jingDuWeiDu) {
		this.jingDuWeiDu = jingDuWeiDu;
	}


	public String getYjhy() {
		return yjhy;
	}


	public void setYjhy(String yjhy) {
		this.yjhy = yjhy;
	}


	public String getEjhy() {
		return ejhy;
	}


	public void setEjhy(String ejhy) {
		this.ejhy = ejhy;
	}


	public String getSfBddt() {
		return sfBddt;
	}


	public void setSfBddt(String sfBddt) {
		this.sfBddt = sfBddt;
	}


	public String getZxrx() {
		return zxrx;
	}


	public void setZxrx(String zxrx) {
		this.zxrx = zxrx;
	}


	public String getYdrx() {
		return ydrx;
	}


	public void setYdrx(String ydrx) {
		this.ydrx = ydrx;
	}


	public String getSfWifi() {
		return sfWifi;
	}


	public void setSfWifi(String sfWifi) {
		this.sfWifi = sfWifi;
	}


	public String getYwlyzxfwzx() {
		return ywlyzxfwzx;
	}


	public void setYwlyzxfwzx(String ywlyzxfwzx) {
		this.ywlyzxfwzx = ywlyzxfwzx;
	}


	public String getJianJie() {
		return jianJie;
	}


	public void setJianJie(String jianJie) {
		this.jianJie = jianJie;
	}


	public String getZsHj() {
		return zsHj;
	}


	public void setZsHj(String zsHj) {
		this.zsHj = zsHj;
	}


	public String getCySs() {
		return cySs;
	}


	public void setCySs(String cySs) {
		this.cySs = cySs;
	}


	public String getYlXm() {
		return ylXm;
	}


	public void setYlXm(String ylXm) {
		this.ylXm = ylXm;
	}


	public String getMsTs() {
		return msTs;
	}


	public void setMsTs(String msTs) {
		this.msTs = msTs;
	}


	public String getTsNcp() {
		return tsNcp;
	}


	public void setTsNcp(String tsNcp) {
		this.tsNcp = tsNcp;
	}


	public String getNfGgcz() {
		return nfGgcz;
	}


	public void setNfGgcz(String nfGgcz) {
		this.nfGgcz = nfGgcz;
	}


	public String getCzPzJj() {
		return czPzJj;
	}


	public void setCzPzJj(String czPzJj) {
		this.czPzJj = czPzJj;
	}


	public String getCsDg() {
		return csDg;
	}


	public void setCsDg(String csDg) {
		this.csDg = csDg;
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
		XclyLyc other = (XclyLyc) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	


}
