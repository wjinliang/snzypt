package com.dm.app.datatopic.model.portaltopic;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

/**
 * 
 *                  
 * @date: 2017年2月27日
 * @Author:lyh
 * @FileName: TjZynzwbzmjJcl.java
 * @Version: 1.0
 * @About:  10-5  主要农业产品产量(1978-2014年)
 *
 */
@Document(collection="tj_ZYNYCPCL")
public class TjZyncpcl implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id;//
	@Field("TJNF")
	private String tjnf;//年   份
	@Field("LS")
	private String ls;//粮  食
	@Field("YL")
	private String yl;//油  料
	@Field("SCJSYJ")
	private String scjsyj;//蔬菜及食用菌
	@Field("GXGP")
	private String gxgp;//干鲜果品
	@Field("NN")
	private String nn;// 牛  奶
	@Field("RL")
	private String rl;//肉  类
	@Field("ZRYR")
	private String zryr;//猪牛羊肉
	@Field("QDCL")
	private String qdcl;//禽蛋产量
	@Field("SCP")
	private String scp;//水产品
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTjnf() {
		return tjnf;
	}
	public void setTjnf(String tjnf) {
		this.tjnf = tjnf;
	}
	public String getLs() {
		return ls;
	}
	public void setLs(String ls) {
		this.ls = ls;
	}
	public String getYl() {
		return yl;
	}
	public void setYl(String yl) {
		this.yl = yl;
	}
	public String getScjsyj() {
		return scjsyj;
	}
	public void setScjsyj(String scjsyj) {
		this.scjsyj = scjsyj;
	}
	public String getGxgp() {
		return gxgp;
	}
	public void setGxgp(String gxgp) {
		this.gxgp = gxgp;
	}
	public String getNn() {
		return nn;
	}
	public void setNn(String nn) {
		this.nn = nn;
	}
	public String getRl() {
		return rl;
	}
	public void setRl(String rl) {
		this.rl = rl;
	}
	public String getZryr() {
		return zryr;
	}
	public void setZryr(String zryr) {
		this.zryr = zryr;
	}
	public String getQdcl() {
		return qdcl;
	}
	public void setQdcl(String qdcl) {
		this.qdcl = qdcl;
	}
	public String getScp() {
		return scp;
	}
	public void setScp(String scp) {
		this.scp = scp;
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
		TjZyncpcl other = (TjZyncpcl) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}


}
