package com.dm.app.datatopic.jichushujuguanli.service.impl;
import com.dm.app.common.dao.MongoBaseDAO;
import com.dm.app.common.service.impl.MongoBaseServiceImpl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.dm.app.datatopic.jichushujuguanli.dao.RegVillageDAO;
import com.dm.app.datatopic.jichushujuguanli.model.RegVillage;
import com.dm.app.datatopic.jichushujuguanli.service.RegVillageService;

@Service
public class RegVillageServiceImpl extends MongoBaseServiceImpl<RegVillage,String> implements RegVillageService{
	
	@Resource(type=RegVillageDAO.class)
	public void setBaseDao(MongoBaseDAO<RegVillage,String> baseRepository){
		this.baseRepository = baseRepository;
	}
}
