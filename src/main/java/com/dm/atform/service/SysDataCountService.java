package com.dm.atform.service;

import java.util.Map;

import com.dm.atform.model.AtTable;

public interface SysDataCountService {
	//获取增量信息
	//全量
	public Map getSysDataCount();
	
	public long getCount(String tableName);

	public long getCount(AtTable table);
}
