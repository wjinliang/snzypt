package com.dm.app.datatopic.jichushujuguanli.service.impl;
import com.dm.app.common.dao.MongoBaseDAO;
import com.dm.app.common.service.impl.MongoBaseServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dm.app.datatopic.jichushujuguanli.dao.RegOuterCountyDAO;
import com.dm.app.datatopic.jichushujuguanli.model.RegOuterCounty;
import com.dm.app.datatopic.jichushujuguanli.service.RegOuterCountyService;

@Service
public class RegOuterCountyServiceImpl extends MongoBaseServiceImpl<RegOuterCounty,String> implements RegOuterCountyService{
	
	@Resource(type=RegOuterCountyDAO.class)
	public void setBaseDao(MongoBaseDAO<RegOuterCounty,String> baseRepository){
		this.baseRepository = baseRepository;
	}
}
