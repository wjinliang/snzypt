package com.dm.timer.dto;


public class Area {
	private String fullName="";
	private int level=0;
	public String getFullName() {
		return fullName;
	}
	public Area setFullName(String fullName) {
		this.fullName = fullName;
		return this;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
}
