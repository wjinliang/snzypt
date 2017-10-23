package com.dm.app.datatopic.cunzhuangguhua.model;

import java.io.Serializable;

import javax.persistence.Id;

import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

@Document(collection="b_CountryPic")
public class CountryPic implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1411618423011725868L;
	
	@Id
	private String id;
	@Field("OBJECTID")
	private Integer objectId;
	@Field("COUNTRYID")
	private String countryId;
	@Field("FILENAME")
	private String fileName;
	@Field("COUNTRYNAME")
	private String countryName;
	@Field("SHORTNAME")
	private String shortName;
	@Field("TYPEID")
	private String typeId;
	@Field("OPERDATE")
	private String operDate;
	@Field("OPER")
	private String oper;
	@Field("OPERBRANCH")
	private String operbranch;
	@Field("exsit")
	private String exsit;
	
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
	public String getExsit() {
		return exsit;
	}
	public void setExsit(String exsit) {
		this.exsit = exsit;
	}
	public String getCountryId() {
		return countryId;
	}
	public void setCountryId(String countryId) {
		this.countryId = countryId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public String getOperDate() {
		return operDate;
	}
	public void setOperDate(String operDate) {
		this.operDate = operDate;
	}
	public String getOper() {
		return oper;
	}
	public void setOper(String oper) {
		this.oper = oper;
	}
	public String getOperbranch() {
		return operbranch;
	}
	public void setOperbranch(String operbranch) {
		this.operbranch = operbranch;
	}
	
	public String getUrl(){
		try{
		return countryId.substring(0,6)+"/"+countryId.substring(0,9)+"/"+countryId+"/"+ shortName;
		}catch(Exception e){
			System.err.println(countryId+"出现错误objectId="+objectId);
			e.printStackTrace();
			return countryId;
		}
	}
}
