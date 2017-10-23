package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * @description 一村一品食兒  一村一品網站採集
 * @author jl
 */
@Document(collection="cms_ycyp_shier")
public class CmsYcypShier implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String   id;  //
	@Field("id")
	private String   objectId;  //标识符
	/*@Field("GL_ID")
	private Double   glId;  //关联ID*/

	@Field("title")
	private String title  ;//标题

	@Field("subTitle")
	private String subTitle  ;//简介
	@Field("publishTime")
	private String publishTime  ;//发布时间
	@Field("content")
	private String content  ;//内容

	@Field("XZC_CODE")
	private String xzcCode  ;//行政村编码
	
	public String getId() {
		return id;
	}

	public String getSubTitle() {
		return subTitle;
	}
	
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	
	public String getXzcCode() {
		return xzcCode;
	}
	
	public void setXzcCode(String xzcCode) {
		this.xzcCode = xzcCode;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
		CmsYcypShier other = (CmsYcypShier) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
