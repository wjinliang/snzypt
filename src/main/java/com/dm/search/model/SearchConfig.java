package com.dm.search.model;

public class SearchConfig {
    private String id;

    private String ipAddress;

    private String coreName;

    private Boolean attachment;

    private Boolean cmsContent;

    private Boolean spider;

    private Boolean highlight;

    private Integer snippets;

    private String highlightcolor;

    private Integer snippetsNum;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress == null ? null : ipAddress.trim();
    }

    public String getCoreName() {
        return coreName;
    }

    public void setCoreName(String coreName) {
        this.coreName = coreName == null ? null : coreName.trim();
    }

    public Boolean getAttachment() {
        return attachment;
    }

    public void setAttachment(Boolean attachment) {
        this.attachment = attachment;
    }

    public Boolean getCmsContent() {
        return cmsContent;
    }

    public void setCmsContent(Boolean cmsContent) {
        this.cmsContent = cmsContent;
    }

    public Boolean getSpider() {
        return spider;
    }

    public void setSpider(Boolean spider) {
        this.spider = spider;
    }

    public Boolean getHighlight() {
        return highlight;
    }

    public void setHighlight(Boolean highlight) {
        this.highlight = highlight;
    }

    public Integer getSnippets() {
        return snippets;
    }

    public void setSnippets(Integer snippets) {
        this.snippets = snippets;
    }

    public String getHighlightcolor() {
        return highlightcolor;
    }

    public void setHighlightcolor(String highlightcolor) {
        this.highlightcolor = highlightcolor == null ? null : highlightcolor.trim();
    }

    public Integer getSnippetsNum() {
        return snippetsNum;
    }

    public void setSnippetsNum(Integer snippetsNum) {
        this.snippetsNum = snippetsNum;
    }
}