package com.dm.dataprocessing.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection = "conf_spider_to_content")
public class ContentPublishProces implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1183575914436268015L;

	@Id
	private String id; // monggoId

	@Field("collection")
	private String collection;
	@Field
	private String name;
	
	@Field("channelId")
	private String channelId;
	@Field
	private String templateId;
	@Field
	private String author;
	@Field("id")
	private String tableid;
	@Field
	private String publishTime;
	@Field
	private String publishTimeFormat;
	@Field
	private String origion;
	@Field
	private String type;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getChannelId() {
		return channelId;
	}

	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}

	public String getTemplateId() {
		return templateId;
	}

	public void setTemplateId(String templateId) {
		this.templateId = templateId;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
 
	public String getCollection() {
		return collection;
	}

	public void setCollection(String collection) {
		this.collection = collection;
	}

	public String getTableid() {
		return tableid;
	}

	public void setTableid(String tableid) {
		this.tableid = tableid;
	}

	public String getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}

	public String getPublishTimeFormat() {
		return publishTimeFormat;
	}

	public void setPublishTimeFormat(String publishTimeFormat) {
		this.publishTimeFormat = publishTimeFormat;
	}

	public String getOrigion() {
		return origion;
	}

	public void setOrigion(String origion) {
		this.origion = origion;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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
