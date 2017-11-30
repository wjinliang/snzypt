package com.dm.dataprocessing.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "conf_detail")
public class VillageNameProces implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5113368753602920839L;

	@Id
	private String id; // monggoId

	@Field
	private String coll;
	@Field
	private String qx;
	@Field
	private String xz;
	@Field
	private String xzc;
	@Field("id")
	private String collid;
	@Field
	private String type;
	@Field
	private String name;
	@Field
	private String jg;
	@Field
	private String title;
	@Field
	private String content;
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getColl() {
		return coll;
	}

	public void setColl(String coll) {
		this.coll = coll;
	}

	public String getQx() {
		return qx;
	}

	public void setQx(String qx) {
		this.qx = qx;
	}

	public String getXz() {
		return xz;
	}

	public void setXz(String xz) {
		this.xz = xz;
	}

	public String getXzc() {
		return xzc;
	}

	public void setXzc(String xzc) {
		this.xzc = xzc;
	}

	public String getCollid() {
		return collid;
	}

	public void setCollid(String collid) {
		this.collid = collid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJg() {
		return jg;
	}

	public void setJg(String jg) {
		this.jg = jg;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
