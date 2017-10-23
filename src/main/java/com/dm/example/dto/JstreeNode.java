package com.dm.example.dto;

import java.io.File;
import java.util.Map;

/**
 * Created by cgj on 2015/12/13.
 */
public class JstreeNode implements Comparable {

    public JstreeNode(File file, String parent, String rootName) {
        this.id = parent + "/" + file.getName();
        this.parent = file.getParentFile().getName().equals(rootName) ? "#" : parent;
        this.text = file.getName();
        this.children = file.isDirectory() ? true : false;
        this.isDirectory = file.isDirectory() ? true : false;
        this.icon = file.isDirectory() ?
            "jstree-icon jstree-themeicon fa fa-folder icon-state-warning icon-lg jstree-themeicon-custom" :
            "jstree-icon jstree-themeicon fa fa-file icon-state-warning icon-lg jstree-themeicon-custom";
    }

    private String id;
    private String parent;
    private boolean children;
    private boolean isDirectory;
    private String text;
    private String icon;
    private JstreeState jstreeState;
    private Map li_attr;
    private Map a_attr;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getParent() {
        return parent;
    }

    public void setParent(String parent) {
        this.parent = parent;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public JstreeState getJstreeState() {
        return jstreeState;
    }

    public void setJstreeState(JstreeState jstreeState) {
        this.jstreeState = jstreeState;
    }

    public Map getLi_attr() {
        return li_attr;
    }

    public void setLi_attr(Map li_attr) {
        this.li_attr = li_attr;
    }

    public Map getA_attr() {
        return a_attr;
    }

    public void setA_attr(Map a_attr) {
        this.a_attr = a_attr;
    }

    public Boolean isChildren() {
        return children;
    }

    public void setChildren(boolean children) {
        this.children = children;
    }

    public Boolean isDirectory() {
        return isDirectory;
    }

    public void setIsDirectory(boolean isDirectory) {
        this.isDirectory = isDirectory;
    }

    @Override public int compareTo(Object o) {
        JstreeNode jstreeNode = (JstreeNode) o;
        return jstreeNode.isDirectory().compareTo(this.isDirectory);
    }
}
