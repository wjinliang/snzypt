package com.dm.app.datatopic.jichushujuguanli.service.impl;
import com.dm.app.common.dao.MongoBaseDAO;
import com.dm.app.common.service.impl.MongoBaseServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dm.app.datatopic.jichushujuguanli.dao.NjfuzzJbxxDAO;
import com.dm.app.datatopic.jichushujuguanli.model.NjfuzzJbxx;
import com.dm.app.datatopic.jichushujuguanli.service.NjfuzzJbxxService;

@Service
public class NjfuzzJbxxServiceImpl extends MongoBaseServiceImpl<NjfuzzJbxx,String> implements NjfuzzJbxxService{
	@Resource(type=NjfuzzJbxxDAO.class)
	public void setBaseDao(MongoBaseDAO<NjfuzzJbxx,String> baseRepository){
		this.baseRepository = baseRepository;
	}
}
