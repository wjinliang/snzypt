package com.dm.atform.model;

import java.io.Serializable;

public class DataResourceRecord implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8688064042991551846L;
	
	private String key;
	private String title;
	private int typeCount;
	private int tableCount;
	private long dataCount;
	private int incrementCount;
	private String info;
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getTypeCount() {
		return typeCount;
	}
	public void setTypeCount(int typeCount) {
		this.typeCount = typeCount;
	}
	public int getTableCount() {
		return tableCount;
	}
	public void setTableCount(int tableCount) {
		this.tableCount = tableCount;
	}
	public long getDataCount() {
		return dataCount;
	}
	public void setDataCount(long dataCount) {
		this.dataCount = dataCount;
	}
	public int getIncrementCount() {
		return incrementCount;
	}
	public void setIncrementCount(int incrementCount) {
		this.incrementCount = incrementCount;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	
	
}
