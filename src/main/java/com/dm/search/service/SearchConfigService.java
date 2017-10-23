package com.dm.search.service;

import java.util.Map;

import org.springframework.mobile.device.Device;

import com.dm.search.model.SearchConfig;

public interface SearchConfigService {


	SearchConfig findConfig(String id);

	boolean insertOrUpdate(SearchConfig searchConfig);

//	Map searchResults(String textValue, Integer pageNum, Integer pageSize,
//			String sortField, String titleValue, String contentValue,
//			String entity);

	Map searchResults(String textValue, String colum, Integer pageNum, Integer pageSize,
			String sortField, String entity, Integer days,String highlight, Device device);
	Map searchResults(String textValue, String colum, Integer pageNum, Integer pageSize,
			String sortField, String entity, Integer days, Device device);
}
