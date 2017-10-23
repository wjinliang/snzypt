package com.dm.atform.model;

public class SysDataCount {
    private Long id;

    private String dbName;

    private String tableName;

    private Long fullCount;

    private Long addCount;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDbName() {
        return dbName;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName == null ? null : dbName.trim();
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName == null ? null : tableName.trim();
    }

    public Long getFullCount() {
        return fullCount;
    }

    public void setFullCount(Long fullCount) {
        this.fullCount = fullCount;
    }

    public Long getAddCount() {
        return addCount;
    }

    public void setAddCount(Long addCount) {
        this.addCount = addCount;
    }
}