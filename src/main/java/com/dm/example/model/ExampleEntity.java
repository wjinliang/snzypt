package com.dm.example.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity @Table(name = "T_EXAMPLE") public class ExampleEntity implements Serializable {

    /**
     * CGJ
     */
    private static final long serialVersionUID = -3894220609107521829L;

    @Id @GeneratedValue(strategy = GenerationType.AUTO) private Long id;

    @Column(name = "NAME", length = 50) private String name;

    @Column(name = "password", length = 20) private String password;

    @Column(name = "textarea", length = 225) private String textarea;

    @Column(name = "checkbox", length = 225) private String checkbox;

    @Column(name = "tag", length = 225) private String tag;

    @Column(name = "radio", length = 32) private String radio;

    @Column(name = "selector", length = 32) private String selector;

    @Column(name = "datepicker", length = 32) private String datepicker;

    @Lob @Column(name = "editor") private String editor;

    @Column(name = "color", length = 10) private String color;

    @Column(name = "tree", length = 225) private String tree;

    @Column(name = "node", length = 32) private String node;

    @Column(name = "file1", length = 225) private String file1;

    @Column(name = "image", length = 225) private String image;

    @Column(name = "file_ids", length = 225) private String fileIds;

    public String getFileIds() {
        return fileIds;
    }

    public void setFileIds(String fileIds) {
        this.fileIds = fileIds;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTextarea() {
        return textarea;
    }

    public void setTextarea(String textarea) {
        this.textarea = textarea;
    }

    public String getCheckbox() {
        return checkbox;
    }

    public void setCheckbox(String checkbox) {
        this.checkbox = checkbox;
    }

    public String getRadio() {
        return radio;
    }

    public void setRadio(String radio) {
        this.radio = radio;
    }

    public String getSelector() {
        return selector;
    }

    public void setSelector(String selector) {
        this.selector = selector;
    }

    public String getDatepicker() {
        return datepicker;
    }

    public void setDatepicker(String datepicker) {
        this.datepicker = datepicker;
    }

    public String getNode() {
        return node;
    }

    public void setNode(String node) {
        this.node = node;
    }

    @Column(name = "CREATOR", length = 50) private String creator;

    @Column(name = "CREATETIME", length = 50) private String createTime;

    @Column(name = "MODIFIER", length = 50) private String modifier;

    @Column(name = "UPDATETIME", length = 50) private String updateTime;

    @Column(name = "VALIDFLAG", length = 5) private String validFlag;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getModifier() {
        return modifier;
    }

    public void setModifier(String modifier) {
        this.modifier = modifier;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getValidFlag() {
        return validFlag;
    }

    public void setValidFlag(String validFlag) {
        this.validFlag = validFlag;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getEditor() {
        return editor;
    }

    public void setEditor(String editor) {
        this.editor = editor;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getTree() {
        return tree;
    }

    public void setTree(String tree) {
        this.tree = tree;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getFile1() {
        return file1;
    }

    public void setFile1(String file1) {
        this.file1 = file1;
    }


}
