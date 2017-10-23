package com.dm.app.datatopic.statistis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;
@Service
public class TjLyjgxgpscServiceImpl implements com.dm.app.datatopic.statistis.service.TjLyjgxgpscService {
	@Autowired
	protected MongoTemplate mongoTemplate;
	@Override
	public List findAll(Class entityClass) {
		Query query=new Query();
		return mongoTemplate.find(query, entityClass);
	}

}
