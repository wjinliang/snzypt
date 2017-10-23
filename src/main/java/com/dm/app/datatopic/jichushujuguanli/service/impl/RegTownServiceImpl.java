package com.dm.app.datatopic.jichushujuguanli.service.impl;
import com.dm.app.common.dao.MongoBaseDAO;
import com.dm.app.common.service.impl.MongoBaseServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dm.app.datatopic.jichushujuguanli.dao.RegTownDAO;
import com.dm.app.datatopic.jichushujuguanli.model.RegTown;
import com.dm.app.datatopic.jichushujuguanli.service.RegTownService;

@Service
public class RegTownServiceImpl extends MongoBaseServiceImpl<RegTown,String> implements RegTownService{
	@Resource(type=RegTownDAO.class)
	public void setBaseDao(MongoBaseDAO<RegTown,String> baseRepository){
		this.baseRepository = baseRepository;
	}
}
