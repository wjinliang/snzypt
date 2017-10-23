package com.dm.atform.util;

import java.util.List;

import com.github.pagehelper.PageInfo;

public class MyPageInfo<T> extends PageInfo<T> {
	private List<T> list;
	
	public MyPageInfo(List<T> list) {
		super(list);
		this.list=list;
	}
	@Override
	public List<T> getList() {
		return list;
	}

}
