package com.dm.importmanage.model;

import java.util.Date;

public class ExclImportConf {
    private Integer id;

    private String name;

    private String tableName;

    private String enName;

    private String collectionNames;

    private String collectionIndexs;

    private String collectionTitles;

    private Integer startRow;

    private Integer endRow;

    private String status;

    private Date creatime;

    private Boolean isDelta;

    private String filePath;
    
    private String collectionKey;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getEnName() {
        return enName;
    }

    public void setEnName(String enName) {
        this.enName = enName == null ? null : enName.trim();
    }

    public String getCollectionNames() {
        return collectionNames;
    }

    public void setCollectionNames(String collectionNames) {
        this.collectionNames = collectionNames == null ? null : collectionNames.trim();
    }

    public String getCollectionIndexs() {
        return collectionIndexs;
    }

    public void setCollectionIndexs(String collectionIndexs) {
        this.collectionIndexs = collectionIndexs == null ? null : collectionIndexs.trim();
    }

    public String getCollectionTitles() {
        return collectionTitles;
    }

    public void setCollectionTitles(String collectionTitles) {
        this.collectionTitles = collectionTitles == null ? null : collectionTitles.trim();
    }

    public Integer getStartRow() {
        return startRow;
    }

    public void setStartRow(Integer startRow) {
        this.startRow = startRow;
    }

    public Integer getEndRow() {
        return endRow;
    }

    public void setEndRow(Integer endRow) {
        this.endRow = endRow;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Date getCreatime() {
        return creatime;
    }

    public void setCreatime(Date creatime) {
        this.creatime = creatime;
    }

    public Boolean getIsDelta() {
        return isDelta;
    }

    public void setIsDelta(Boolean isDelta) {
        this.isDelta = isDelta;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath == null ? null : filePath.trim();
    }

	public String getCollectionKey() {
		return collectionKey;
	}

	public void setCollectionKey(String collectionKey) {
		this.collectionKey = collectionKey;
	}
    
}