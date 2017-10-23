package com.dm.atform.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.util.StringUtils;

public class AtField {
	private String id;

	private String tableId;

	private String aTitle;

	private String aField;

	private String aWidth;

	private String aFormat;

	private Boolean aSort;

	private String aType;

	private Boolean gridShow;

	private Boolean detailShow;

	private Boolean aSearch;

	private Integer aSeq;
	
	private String set;

	public Map toGridItem() {
		Map map = new HashMap();
		map.put("title", aTitle);
		map.put("field", aField);
		map.put("type", aType);
		map.put("sort", aSort);
		map.put("width", aWidth);
		if (StringUtils.hasText(aFormat)) {
			String[] arr = aFormat.split("_");
			String m="";
			for (int i = 0; i < arr.length; i+=2) {
				m+="'"+arr[i]+"':'"+arr[i+1]+"',";
			}
			String fun = "";
			fun += "var map={"+m+"}; return map[data."+aField+"];";
			map.put("format", fun);

		}
		return map;
	}

	public Map toFormItem() {
		Map map = new HashMap();
		map.put("label", aTitle);
		map.put("type", aType);
		map.put("name", aField);
		map.put("id", aField);
		if (StringUtils.hasText(aFormat)) {
			String[] arr = aFormat.split("_");
			List<Map> list = new ArrayList<Map>();
			for (int i = 0; i < arr.length; i+=2) {
				Map m = new HashMap();
				m.put("text", arr[i+1]);
				m.put("value",arr[i]);
				list.add(m);
			}
			map.put("items", list);

		}
		return map;
	}

	public Map toSearchItem() {
		Map map = new HashMap();
		map.put("label", aTitle);
		map.put("type", aType);
		map.put("name", aField);
		map.put("id", "s_"+aField);
		if (StringUtils.hasText(aFormat)) {
			String[] arr = aFormat.split("_");
			List<Map> list = new ArrayList<Map>();
			Map m1 = new HashMap();
			m1.put("text", "全部");
			m1.put("value","");
			list.add(m1);
			for (int i = 0; i < arr.length; i+=2) {
				Map m = new HashMap();
				m.put("text", arr[i+1]);
				m.put("value",arr[i]);
				list.add(m);
			}
			map.put("items", list);

		}
		return map;
	}

	
	public String getSet() {
		String s = "";
		if(aSort!=null && aSort)s+="sort,";
		if(aSearch!=null && aSearch)s+="search,";
		if(gridShow!=null && gridShow)s+="grid,";
		if(detailShow!=null && detailShow)s+="form";
		return s;
	}

	public void setSet(String set) {
		this.set = set;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id == null ? null : id.trim();
	}

	public String getTableId() {
		return tableId;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	public String getaTitle() {
		return aTitle;
	}

	public void setaTitle(String aTitle) {
		this.aTitle = aTitle == null ? null : aTitle.trim();
	}

	public String getaField() {
		return aField;
	}

	public void setaField(String aField) {
		this.aField = aField == null ? null : aField.trim();
	}

	public String getaWidth() {
		return aWidth;
	}

	public void setaWidth(String aWidth) {
		this.aWidth = aWidth;
	}

	public String getaFormat() {
		return aFormat;
	}

	public void setaFormat(String aFormat) {
		this.aFormat = aFormat == null ? null : aFormat.trim();
	}

	public Boolean getaSort() {
		if(aSort==null)
			if(set!=null && set.contains("sort"))
				return true;else return false;
		return aSort;
	}

	public void setaSort(Boolean aSort) {
		this.aSort = aSort ;
		if(aSort!=null && aSort){
			if(set==null){
				set="sort";
			}else{
				set+=",sort";
			}
		}
	}

	public String getaType() {
		return aType;
	}

	public void setaType(String aType) {
		this.aType = aType == null ? null : aType.trim();
	}

	public Boolean getGridShow() {
		if(gridShow==null)
			if(set!=null && set.contains("grid"))
				return true;else return false;
		return gridShow;
	}

	public void setGridShow(Boolean gridShow) {
		this.gridShow = gridShow;
		if(gridShow!=null && gridShow){
			if(set==null){
				set="grid";
			}else{
				set+=",grid";
			}
		}
	}

	public Boolean getDetailShow() {
		if(detailShow==null)
			if(set!=null && set.contains("form"))
				return true;else return false;
		return detailShow;
	}

	public void setDetailShow(Boolean detailShow) {
		this.detailShow = detailShow;
		if(detailShow!=null && detailShow){
			if(set==null){
				set="form";
			}else{
				set+=",form";
			}
		}
	}

	public Boolean getaSearch() {
		if(aSearch==null)
			if(set!=null && set.contains("search"))
				return true;else return false;
		return aSearch;
	}

	public void setaSearch(Boolean aSearch) {
		this.aSearch = aSearch;
		if(aSearch!=null && aSearch){
			if(set==null){
				set="search";
			}else{
				set+=",search";
			}
		}
	}

	public Integer getaSeq() {
		return aSeq;
	}

	public void setaSeq(Integer aSeq) {
		this.aSeq = aSeq;
	}

	@Override
	public String toString() {
		return "AtField [id=" + id + ", tableId=" + tableId + ", aTitle="
				+ aTitle + ", aField=" + aField + ", aWidth=" + aWidth
				+ ", aFormat=" + aFormat + ", aSort=" + aSort + ", aType="
				+ aType + ", gridShow=" + gridShow + ", detailShow="
				+ detailShow + ", aSearch=" + aSearch + ", aSeq=" + aSeq + "]";
	}
	
}