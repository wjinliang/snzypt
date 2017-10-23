package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 
 *                  
 * @date: 2017年3月14日
 * @Author: lyh
 * @FileName: NatureNyd.java
 * @Version: 1.0
 * @About:  自然资源:农用地资源
 *
 */
@Document(collection="m_ZZ_ST_AGRILAND")
public class NatureNyd implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id  ;//
	@Field("ID")
	private String   objectId;  //标识符
	@Field("SZ_QX")
	private String   szQx;  //所在区县
	@Field("SZ_XZ")
	private String   szXz;  //所在乡镇
	@Field("SZ_XZC")
	private String   szXzc;  //所在行政村
	@Field("DL_BM")
	private String   dlBm;  //地类编码
	@Field("JMD_JL")
	private String   jmdJl;  //居民点距离
	@Field("DL_JL")
	private String   dlJl;  //道路距离
	@Field("ZH_XJ")
	private String   zhXj;  //综合星级
	@Field("ID_JMD")
	private String  idJmd ;  //居民点ID
	@Field("ID_DLGK")
	private String   idDlgk;  //道路工矿ID
	@Field("DLGK_JL")
	private String  dlgkJl ;  //	道路工矿距离
	@Field("ID_DL")
	private String   idDl;  //道路ID
	@Field("XZYS_DJ")
	private String   xzysDj;  //限制因素等级
	@Field("FXZYS_FZ")
	private String   fxzysFz;  //非限制因素分值
	@Field("ZH_PF")
	private String  zhPf ;  //综合评分
	@Field("WR_ZS")
	private String  wrZs ;  //污染质数
	@Field("WR_ZS2")
	private String   wrZs2;  //污染质数2
	@Field("WR_ZS3")
	private String   wrZs3;  //污染质数3
	@Field("DL_MC")
	private String  dlMc ;  //地类名称
	@Field("ZR_DB")
	private String  zrDb;  //自然等别
	@Field("LY_DB")
	private String  lyDb ;  //来源等别
	@Field("JJ_DB")
	private String  jjDb ;  //经济等别
	@Field("XZC_CODE")
	private String  xzcCode ;  //经济等别

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getObjectId() {
		return objectId;
	}


	public void setObjectId(String objectId) {
		this.objectId = objectId;
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


	public String getDlBm() {
		return dlBm;
	}


	public void setDlBm(String dlBm) {
		this.dlBm = dlBm;
	}


	public String getJmdJl() {
		return jmdJl;
	}


	public void setJmdJl(String jmdJl) {
		this.jmdJl = jmdJl;
	}


	public String getDlJl() {
		return dlJl;
	}


	public void setDlJl(String dlJl) {
		this.dlJl = dlJl;
	}


	public String getZhXj() {
		return zhXj;
	}


	public void setZhXj(String zhXj) {
		this.zhXj = zhXj;
	}


	public String getIdJmd() {
		return idJmd;
	}


	public void setIdJmd(String idJmd) {
		this.idJmd = idJmd;
	}


	public String getIdDlgk() {
		return idDlgk;
	}


	public void setIdDlgk(String idDlgk) {
		this.idDlgk = idDlgk;
	}


	public String getDlgkJl() {
		return dlgkJl;
	}


	public void setDlgkJl(String dlgkJl) {
		this.dlgkJl = dlgkJl;
	}


	public String getIdDl() {
		return idDl;
	}


	public void setIdDl(String idDl) {
		this.idDl = idDl;
	}


	public String getXzysDj() {
		return xzysDj;
	}


	public void setXzysDj(String xzysDj) {
		this.xzysDj = xzysDj;
	}


	public String getFxzysFz() {
		return fxzysFz;
	}


	public void setFxzysFz(String fxzysFz) {
		this.fxzysFz = fxzysFz;
	}


	public String getZhPf() {
		return zhPf;
	}


	public void setZhPf(String zhPf) {
		this.zhPf = zhPf;
	}


	public String getWrZs() {
		return wrZs;
	}


	public void setWrZs(String wrZs) {
		this.wrZs = wrZs;
	}


	public String getWrZs2() {
		return wrZs2;
	}


	public void setWrZs2(String wrZs2) {
		this.wrZs2 = wrZs2;
	}


	public String getWrZs3() {
		return wrZs3;
	}


	public void setWrZs3(String wrZs3) {
		this.wrZs3 = wrZs3;
	}


	public String getDlMc() {
		return dlMc;
	}


	public void setDlMc(String dlMc) {
		this.dlMc = dlMc;
	}


	public String getZrDb() {
		return zrDb;
	}


	public void setZrDb(String zrDb) {
		this.zrDb = zrDb;
	}


	public String getLyDb() {
		return lyDb;
	}


	public void setLyDb(String lyDb) {
		this.lyDb = lyDb;
	}


	public String getJjDb() {
		return jjDb;
	}


	public void setJjDb(String jjDb) {
		this.jjDb = jjDb;
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
		NatureNyd other = (NatureNyd) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}



}
