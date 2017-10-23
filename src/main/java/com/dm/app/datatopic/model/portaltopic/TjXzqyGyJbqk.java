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
 * @FileName: TjXzqyGyJbqk.java
 * @Version: 1.0
 * @About: 
 *乡镇企业各业基本情况(2014年)
 */
@Document(collection="tj_XZQYGYJBQK")
public class TjXzqyGyJbqk implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id;//
	@Field("XM")
	private String xm;//项      目
	@Field("SL_QYGS")
	private String slQygs;//数  量企业个数(个)
	@Field("GC_QYGS")
	private String gcQygs;//构成(%)企业个数(个)
	@Field("SL_CYGS")
	private String slCygs;//从业人员(人)数  量
	@Field("GC_CYGS")
	private String gcCygs;//从业人员(人)构成
	@Field("SL_ZSR")
	private String slZsr;// 总收入(万元)数  量
	@Field("GC_ZSR")
	private String gcZsr;//总收入(万元)构成
	@Field("SL_LRZE")
	private String slLrze;//利润总额(万元)数  量
	@Field("GC_LRZE")
	private String gcLrze;//利润总额(万元)构成
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getSlQygs() {
		return slQygs;
	}
	public void setSlQygs(String slQygs) {
		this.slQygs = slQygs;
	}
	public String getGcQygs() {
		return gcQygs;
	}
	public void setGcQygs(String gcQygs) {
		this.gcQygs = gcQygs;
	}
	public String getSlCygs() {
		return slCygs;
	}
	public void setSlCygs(String slCygs) {
		this.slCygs = slCygs;
	}
	public String getGcCygs() {
		return gcCygs;
	}
	public void setGcCygs(String gcCygs) {
		this.gcCygs = gcCygs;
	}
	public String getSlZsr() {
		return slZsr;
	}
	public void setSlZsr(String slZsr) {
		this.slZsr = slZsr;
	}
	public String getGcZsr() {
		return gcZsr;
	}
	public void setGcZsr(String gcZsr) {
		this.gcZsr = gcZsr;
	}
	public String getSlLrze() {
		return slLrze;
	}
	public void setSlLrze(String slLrze) {
		this.slLrze = slLrze;
	}
	public String getGcLrze() {
		return gcLrze;
	}
	public void setGcLrze(String gcLrze) {
		this.gcLrze = gcLrze;
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
		TjXzqyGyJbqk other = (TjXzqyGyJbqk) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	


}
