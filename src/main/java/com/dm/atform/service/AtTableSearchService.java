package com.dm.atform.service;

import java.util.List;
import java.util.Map;

import com.dm.atform.model.AtTableSearch;
import com.github.pagehelper.PageInfo;

public interface AtTableSearchService {

	PageInfo<AtTableSearch> findByArg(Map map);

	List<AtTableSearch> findAllByArg(Map map);
	
	AtTableSearch findOne(String id);

	void save(AtTableSearch AtTableSearch);
	
	void update(AtTableSearch AtTableSearch);

	void delete(String id);
	
}
