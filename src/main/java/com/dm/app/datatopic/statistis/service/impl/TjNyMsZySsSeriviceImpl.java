package com.dm.app.datatopic.statistis.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.dm.app.datatopic.model.portaltopic.TjNyMsZySs;
import com.dm.app.datatopic.model.portaltopic.TjNysctj;
import com.dm.app.datatopic.statistis.service.TjNyMsZySsSerivice;
@Service
public class TjNyMsZySsSeriviceImpl implements TjNyMsZySsSerivice {
	@Autowired
	protected MongoTemplate mongoTemplate;

	@Override
	public List findAll(Class entityClass) {
		Query query = new Query();
		return mongoTemplate.find(query, entityClass);
	}

	@Override
	public TjNyMsZySs findByProperty(String property, String value) {
		Query query = new Query();
		Criteria criteria =Criteria.where(property).is(value);
		query.addCriteria(criteria);
		TjNyMsZySs tjnymszyss = mongoTemplate.findOne(query, TjNyMsZySs.class);
		return tjnymszyss;
	}

}
