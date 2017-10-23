package com.dm.importmanage.service;

import java.util.List;
import java.util.Map;

import com.dm.importmanage.model.ExclImportLog;
import com.github.pagehelper.PageInfo;

public interface ImportLogService {

	void importExcel(ExclImportLog log);

	List test(ExclImportLog log);

	PageInfo<ExclImportLog> findLogByPage(Integer pageNum, Integer pageSize,
			Map map);

	void autoconf(ExclImportLog log);

	void doxzc(Integer id);
	
	void delData(Integer id);

}
