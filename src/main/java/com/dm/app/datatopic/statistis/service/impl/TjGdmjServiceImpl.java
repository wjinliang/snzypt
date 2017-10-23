package com.dm.app.datatopic.statistis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.dm.app.datatopic.statistis.service.TjGdmjService;
/**
 * 统计耕地面积的实现层
 * @author Lenovo
 *
 */
@Service
public class TjGdmjServiceImpl implements TjGdmjService{
	
	@Autowired
	protected MongoTemplate mongoTemplate;

	@Override
	public List findAll(Class entityClass) {
		Query query=new Query();
		return mongoTemplate.find(query, entityClass);
	}

}
