package com.dm.dataprocessing.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "conf_proces_log")
public class ProcesLog implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5113368753602920839L;

	@Id
	private String id; // monggoId

	@Field
	private String title;
	@Field
	private String type;
	@Field
	private String name;
	@Field
	private String content;
	@Field
	private String time;
	@Field
	private String collname;
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getCollname() {
		return collname;
	}

	public void setCollname(String collname) {
		this.collname = collname;
	}
	

}
