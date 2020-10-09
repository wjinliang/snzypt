package com.dm.atform.service;

import java.util.List;
import java.util.Map;

import com.dm.atform.model.AtDatasourceApply;
import com.github.pagehelper.PageInfo;

public interface AtDatasourceApplyService {

	PageInfo<AtDatasourceApply> findByArg(Map map);
	
	List<AtDatasourceApply> findAll(Map map);

	AtDatasourceApply findOne(String id);

	void saveOrUpdate(AtDatasourceApply atField);

	void delete(String id);
}
