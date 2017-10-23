package com.dm.app.datatopic.jichushujuguanli.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dm.app.common.dao.MongoBaseDAO;
import com.dm.app.common.service.impl.MongoBaseServiceImpl;
import com.dm.app.datatopic.jichushujuguanli.dao.SnqyJbxxDAO;
import com.dm.app.datatopic.jichushujuguanli.model.SnqyJbxx;
import com.dm.app.datatopic.jichushujuguanli.service.SnqyJbxxService;

@Service
public class SnqyJbxxServiceImpl extends MongoBaseServiceImpl<SnqyJbxx,String> implements SnqyJbxxService{
	@Resource(type=SnqyJbxxDAO.class)
	public void setBaseDao(MongoBaseDAO<SnqyJbxx,String> baseRepository){
		this.baseRepository = baseRepository;
	}
}
