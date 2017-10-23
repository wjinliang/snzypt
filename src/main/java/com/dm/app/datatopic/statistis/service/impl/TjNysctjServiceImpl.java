package com.dm.app.datatopic.statistis.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.dm.app.datatopic.model.portaltopic.TjNysctj;
import com.dm.app.datatopic.statistis.service.TjNysctjService;
/**
 * 
 *                  
 * @date: 2017年3月8日
 * @Email: 502230926@qq.com
 * @FileName: TjNysctjServiceImpl.java
 * @Version: 1.0
 * @About: 10-16  农业观光园  接口实现类
 *
 */
@Service
public class TjNysctjServiceImpl implements TjNysctjService {
	@Autowired
	protected MongoTemplate mongoTemplate;

	@Override
	public List findAll(Class entityClass) {
		Query query = new Query();
		return mongoTemplate.find(query, entityClass);
	}

	
	public List getNyjx() {
		Query query = new Query();
		List lists = new ArrayList<>();
		lists.add("(台)");
		lists.add("(辆)");
		lists.add("(混合台)");
		lists.add("(部)");
		Criteria criteria =Criteria.where("DW").in(lists);
		query.addCriteria(criteria);
		List<TjNysctj> list = mongoTemplate.find(query, TjNysctj.class);
		return list;
	}


	
	public List getNyHf() {
		Query query = new Query();
		Criteria criteria =Criteria.where("DW").is("(吨)");
		query.addCriteria(criteria);
		List<TjNysctj> list = mongoTemplate.find(query, TjNysctj.class);
		return list;
	}


	@Override
	public List getMj() {
		Query query = new Query();
		Criteria criteria =Criteria.where("DW").is("(公顷)");
		//占比条件
		query.addCriteria(criteria);
		//农用面积
		List<TjNysctj> mJlist = mongoTemplate.find(query, TjNysctj.class);
		
		return mJlist;
	}


	@Override
	public List getMjZb() {
		Query query = new Query();
		Criteria criteria =Criteria.where("DW").is("(%)");
		//占比条件
		query.addCriteria(criteria);
		List<TjNysctj> mJZblist = mongoTemplate.find(query, TjNysctj.class);
		return mJZblist;
	}

}
