package com.dm.app.datatopic.jichushujuguanli.service.impl;
import com.dm.app.common.dao.MongoBaseDAO;
import com.dm.app.common.service.impl.MongoBaseServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dm.app.datatopic.jichushujuguanli.dao.ZydpstZZTryfDAO;
import com.dm.app.datatopic.jichushujuguanli.model.ZydpstZZTryf;
import com.dm.app.datatopic.jichushujuguanli.service.ZydpstZZTryfService;

@Service
public class ZydpstZZTryfServiceImpl extends MongoBaseServiceImpl<ZydpstZZTryf,String> implements ZydpstZZTryfService{
	@Resource(type=ZydpstZZTryfDAO.class)
	public void setBaseDao(MongoBaseDAO<ZydpstZZTryf,String> baseRepository){
		this.baseRepository = baseRepository;
	}
}
