package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 
 * @author huoge
 * @description 劳动力资料【郊农业户籍劳动力】 实体类
 */
@Document(collection="m_ZYDP_NCJJ_JQNHLDL")
public class Jqnhldl implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;  //monggoId
	@Field("ID")
	private String   objectId;  //标识符
	@Field("JG_MC")
	private String   jgMc;  //机构名称
	@Field("JG_BH")
	private String   jgBh;  //机构编号
	@Field("TQNT_RY")
	private String   tqntRy;  //提前内退人员
	@Field("XS")
	private String   xs;  //学生
	@Field("XY_JR")
	private String   xyJr;  //现役军人
	@Field("LL_RY")
	private String  llRy;  //两劳人员
	@Field("CJ")
	private String   cj;  //残疾
	@Field("QT")
	private String   qt;  //其他
	@Field("XY_YQ")
	private String   xyYq;  //年收入小于1000元
	@Field("YQ_LQ")
	private String   yqLq;  //1000-2000元
	@Field("LQ_SQ")
	private String   lqSq;  //2000-3000元
	@Field("SQ_SQ")
	private String   sqSq;  //3000-4000元
	@Field("SQ_WQ")
	private String   sqWq;  //4000-5000元
	@Field("WQ_LQ")
	private String   wqLq;  //5000-6000元
	@Field("LQ_QQ")
	private String   lqQq;  //6000-7000元
	@Field("QQ_BQ")
	private String   qqBq;  //7000-8000元
	@Field("BQ_JQ")
	private String   bqJq;  //8000-9000元
	@Field("JQ_YW")
	private String   jqYw;  //9000-10000元
	@Field("YW_YS")
	private String   ywYs;  //一万以上
	@Field("TJ_ND")
	private String   tjNd;  //统计年度

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


	public String getJgMc() {
		return jgMc;
	}


	public void setJgMc(String jgMc) {
		this.jgMc = jgMc;
	}


	public String getJgBh() {
		return jgBh;
	}


	public void setJgBh(String jgBh) {
		this.jgBh = jgBh;
	}


	public String getTqntRy() {
		return tqntRy;
	}


	public void setTqntRy(String tqntRy) {
		this.tqntRy = tqntRy;
	}


	public String getXs() {
		return xs;
	}


	public void setXs(String xs) {
		this.xs = xs;
	}


	public String getXyJr() {
		return xyJr;
	}


	public void setXyJr(String xyJr) {
		this.xyJr = xyJr;
	}


	public String getLlRy() {
		return llRy;
	}


	public void setLlRy(String llRy) {
		this.llRy = llRy;
	}


	public String getCj() {
		return cj;
	}


	public void setCj(String cj) {
		this.cj = cj;
	}


	public String getQt() {
		return qt;
	}


	public void setQt(String qt) {
		this.qt = qt;
	}


	public String getXyYq() {
		return xyYq;
	}


	public void setXyYq(String xyYq) {
		this.xyYq = xyYq;
	}


	public String getYqLq() {
		return yqLq;
	}


	public void setYqLq(String yqLq) {
		this.yqLq = yqLq;
	}


	public String getLqSq() {
		return lqSq;
	}


	public void setLqSq(String lqSq) {
		this.lqSq = lqSq;
	}


	public String getSqSq() {
		return sqSq;
	}


	public void setSqSq(String sqSq) {
		this.sqSq = sqSq;
	}


	public String getSqWq() {
		return sqWq;
	}


	public void setSqWq(String sqWq) {
		this.sqWq = sqWq;
	}


	public String getWqLq() {
		return wqLq;
	}


	public void setWqLq(String wqLq) {
		this.wqLq = wqLq;
	}


	public String getLqQq() {
		return lqQq;
	}


	public void setLqQq(String lqQq) {
		this.lqQq = lqQq;
	}


	public String getQqBq() {
		return qqBq;
	}


	public void setQqBq(String qqBq) {
		this.qqBq = qqBq;
	}


	public String getBqJq() {
		return bqJq;
	}


	public void setBqJq(String bqJq) {
		this.bqJq = bqJq;
	}


	public String getJqYw() {
		return jqYw;
	}


	public void setJqYw(String jqYw) {
		this.jqYw = jqYw;
	}


	public String getYwYs() {
		return ywYs;
	}


	public void setYwYs(String ywYs) {
		this.ywYs = ywYs;
	}


	public String getTjNd() {
		return tjNd;
	}


	public void setTjNd(String tjNd) {
		this.tjNd = tjNd;
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
		Jqnhldl other = (Jqnhldl) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}





}
