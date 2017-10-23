package com.dm.app.datatopic.jichushujuguanli.service.impl;
import com.dm.app.common.dao.MongoBaseDAO;
import com.dm.app.common.service.impl.MongoBaseServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dm.app.datatopic.jichushujuguanli.dao.BaseInfoDAO;
import com.dm.app.datatopic.jichushujuguanli.model.BaseInfo;
import com.dm.app.datatopic.jichushujuguanli.service.BaseInfoService;

@Service
public class BaseInfoServiceImpl extends MongoBaseServiceImpl<BaseInfo,String> implements BaseInfoService{
	@Resource(type=BaseInfoDAO.class)
	public void setBaseDao(MongoBaseDAO<BaseInfo,String> baseRepository){
		this.baseRepository = baseRepository;
	}
}
