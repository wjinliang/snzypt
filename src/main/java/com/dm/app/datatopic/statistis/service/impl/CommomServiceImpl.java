package com.dm.app.datatopic.statistis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.dm.app.datatopic.statistis.service.CommomService;
@Service
public class CommomServiceImpl implements CommomService {
	@Autowired
	protected MongoTemplate mongoTemplate;
	
	public List findAll(Class entityClass) {
		
		Query query = new Query();
		return mongoTemplate.find(query, entityClass);
	}

	@Override
	public List findListByProperty(Class entityClass,String property,Object value) {
		Query query = new Query();
		Criteria criteria =Criteria.where(property).in(value);
		query.addCriteria(criteria);
		
		return mongoTemplate.find(query, entityClass);
	}


}
