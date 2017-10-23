package com.dm.module.service;

import java.util.Map;

import com.dm.module.model.Microcobol;
import com.github.pagehelper.PageInfo;

public interface MicrocobolService {

	PageInfo<Microcobol> findMicrocobolByPage(Integer pageNum,
			Integer pageSize, Map map);

	void update(Microcobol microcobol);

	Microcobol load(Integer id);

	void click(Integer id);

	void delete(Integer id);

	void insert(Microcobol microcobol);

	Map selectAll();


}
