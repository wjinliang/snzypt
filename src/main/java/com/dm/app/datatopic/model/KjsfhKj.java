package com.dm.app.datatopic.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
/**
 * 
 * @author hge
 * @description 科技示范户空间数据表实体类
 */
@Document(collection="m_KJ_ST_KJSFH")
public class KjsfhKj implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id;  //monggoId
	@Field("ID")
	private Integer markId; //标识符	
	@Field("OBJECTID")
	private Integer objectId; //关联id
	@Field("MC")
	private String mc;//区县名称
	@Field("SHAPE")
	private String shape;//所在乡镇
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getObjectId() {
		return objectId;
	}
	public void setObjectId(Integer objectId) {
		this.objectId = objectId;
	}
	public Integer getMarkId() {
		return markId;
	}
	public void setMarkId(Integer markId) {
		this.markId = markId;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}
	public String getMc() {
		return mc;	
	}

}
