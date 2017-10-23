package com.dm.cms.dto;

/**
 * Created by cgj on 2015/12/11.
 */
public class FileDto implements Comparable {
    private String name;
    private String path;
    private Boolean isDirectory;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Boolean getIsDirectory() {
        return isDirectory;
    }

    public void setIsDirectory(Boolean isDirectory) {
        this.isDirectory = isDirectory;
    }

    @Override public int compareTo(Object o) {
        FileDto fileDto = (FileDto) o;
        return fileDto.getIsDirectory().compareTo(this.getIsDirectory());
    }
}
