package com.dm.importmanage.service;

import java.util.Map;

import com.dm.importmanage.model.ExclImportConf;
import com.github.pagehelper.PageInfo;

public interface ImportManageService {
	PageInfo<ExclImportConf> findByPage(Integer pageNum, Integer pageSize,
			Map map);

	void save(ExclImportConf conf);

	void update(ExclImportConf conf);

	void delete(ExclImportConf conf);

	ExclImportConf findById(Integer id);

	Object findOption();

	ExclImportConf selectByTableName(String tableName); 

}
