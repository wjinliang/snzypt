package com.dm.app.common.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;

import com.dm.app.common.dao.MongoBaseDAO;
import com.dm.app.util.Page;
import com.dm.app.util.Reflections;


/**
 * MongDB相关的持久层基接口实现类,封装通用的MongoDB数据库操作方法
 * @param <T>
 * @param <PK>
 */
public abstract class MongoBaseDAOImpl<T extends Serializable, PK extends Serializable> 
	implements MongoBaseDAO<T, PK>{
	
	//获取子类泛型的第一个参数的类型
	protected Class<?> entityClass = null;
	{
		entityClass = Reflections.getClassGenricType(this.getClass());
	}
	@Autowired
	protected MongoTemplate mongoTemplate;
	
	
	@Override
	public void save(T t) {
		mongoTemplate.save(t,entityClass.getAnnotation(Document.class).collection());
	}
	
	
	@Override
	public void delete(T t) {
		mongoTemplate.remove(t);
	}
	
	
	@Override
	public void deleteById(PK id) {
		Query query = new Query();
		Criteria criteria = Criteria.where("id").is(id);
		query.addCriteria(criteria);
		mongoTemplate.remove(query , entityClass);
	}
	
	@Override
	public void deleteIds(String[] ids) {
		Query query = new Query();
		Criteria criteria = Criteria.where("id").in(ids);
		query.addCriteria(criteria);
		mongoTemplate.remove(query , entityClass);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public T findById(PK id) {
		return (T) mongoTemplate.findById(id, entityClass);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> findByPropertys(String key,Object[] ids) {
		Query query = new Query();
		query.addCriteria(Criteria.where(key).in(ids));	
		return (List<T>) mongoTemplate.find(query, entityClass);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> findAll() {
		return (List<T>) mongoTemplate.findAll(entityClass);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<T> findAll(Map params) {
		Query query = new Query();
		Iterator<Entry<String, Object>> it = params.entrySet().iterator();
		while(it.hasNext()){
			Entry<String, Object> obj = it.next();
			query.addCriteria(Criteria.where(obj.getKey()).is(obj.getValue()));	
		}
		//long total = mongoTemplate.count(query, entityClass);
		List<T> content = (List<T>) mongoTemplate.find(query, entityClass);
		return content;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Page<T> getPage(int page, int pageSize) {
		Query query = new Query();
		long total = mongoTemplate.count(query, entityClass);
		
		int skip = (page-1)*pageSize;
		query.skip(skip).limit(pageSize);
		List<T> content = (List<T>) mongoTemplate.find(query, entityClass);
		
		return new Page<>(content, page, total, pageSize);
	}
	
	
	@Override
	public void updatePropertyById(PK id, String key, Object value) {
		Query query = new Query();
		query.addCriteria(Criteria.where("id").is(id));

		Update update = new Update();
		update.set(key, value);
		mongoTemplate.updateMulti(query, update, entityClass);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public Page<T> getPage(HashMap<String,Object> params, int page, int pageSize){
		
		Query query = new Query();
		Iterator<Entry<String, Object>> it = params.entrySet().iterator();
		while(it.hasNext()){
			Entry<String, Object> obj = it.next();
			query.addCriteria(Criteria.where(obj.getKey()).is(obj.getValue()));	
		}
		
		
		long total = mongoTemplate.count(query, entityClass);
		int skip = (page-1)*pageSize;
		query.skip(skip).limit(pageSize);
		List<T> content = (List<T>) mongoTemplate.find(query, entityClass);
		
		return new Page<>(content, page, total, pageSize);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Page<T> getPage(Query query, int page, int pageSize){
		long total = mongoTemplate.count(query, entityClass);
		int skip = (page-1)*pageSize;
		query.skip(skip).limit(pageSize);
		List<T> content = (List<T>) mongoTemplate.find(query, entityClass);
		
		return new Page<T>(content, page, total, pageSize);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public T getByProperty(String key, Object value) {
		Query query = new Query();
		query.addCriteria(Criteria.where(key).is(value));
		
		return (T) mongoTemplate.findOne(query, entityClass);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> getsByProperty(String key, Object value) {
		Query query = new Query();
		query.addCriteria(Criteria.where(key).is(value));
		
		return (List<T>) mongoTemplate.find(query, entityClass);
	}
	
	
	@Override
	public void incrementById(PK id, String key, Number incr) {
		Query query = new Query();
		query.addCriteria(Criteria.where("id").is(id));
		
		Update update = new Update();
		update.inc(key, incr);
		mongoTemplate.updateMulti(query, update, entityClass);
	}
	@Override
	public void incrementByProperty(String queryKey,Object queryValue, String key, Number incr) {
		Query query = new Query();
		query.addCriteria(Criteria.where(queryKey).is(queryValue));
		
		Update update = new Update();
		update.inc(key, incr);
		mongoTemplate.updateMulti(query, update, entityClass);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public Page<T> getPage(int page, int pageSize, 
			Map<String, Object> map, LinkedHashMap<String, Direction> orders) {
		Query query = new Query();
		Criteria criteria = new Criteria();
		if(map!=null && map.size()>0) {
			boolean flag = true;
			for(String key : map.keySet()) {
				if(flag) {
					criteria = Criteria.where(key).is(map.get(key));
					flag = false;
				} else {
					criteria = criteria.and(key).is(map.get(key));
				}
			}
		}
		query.addCriteria(criteria);
		long total = mongoTemplate.count(query, entityClass);
		
		List<Order> orderList = new ArrayList<>(); 
		if(orders!=null && orders.size()>0) {
			for(String key : orders.keySet()) {
				orderList.add(new Order(orders.get(key), key));
			}
			Sort sort = new Sort(orderList);
			query.with(sort);
		}
		int skip = (page-1)*pageSize;
		query.skip(skip).limit(pageSize);
		List<T> content = (List<T>) mongoTemplate.find(query, entityClass);
		
		return new Page<>(content, page, total, pageSize);
	}
	
	
	@Override
	public long getCount(Map<String,Object> map) {
		
		Query query = new Query();
		Criteria criteria = new Criteria();
		if(map!=null && map.size()>0) {
			boolean flag = true;
			for(String key : map.keySet()) {
				if(flag) {
					criteria = Criteria.where(key).is(map.get(key));
					flag = false;
				} else {
					criteria = criteria.and(key).is(map.get(key));
				}
			}
		}
		query.addCriteria(criteria);
		long total = mongoTemplate.count(query, entityClass);
		return total;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<T> getByIds(Collection<PK> ids) {
		Query query = new Query();
		query.addCriteria(Criteria.where("id").in(ids));
		
		return (List<T>) mongoTemplate.find(query, entityClass);
	}
	
	
	@Override
	public void updateByProperty(String querykey, Object queryValue, String property, Object value) {
		Query query = new Query();
		query.addCriteria(Criteria.where(querykey).is(queryValue));

		Update update = new Update();
		update.set(property, value);
		mongoTemplate.updateMulti(query, update, entityClass);
	}
	
	
	@Override
	public void updateByProperty(String querykey, Object queryValue, Map<String, Object> updateMap) {
		Query query = new Query();
		query.addCriteria(Criteria.where(querykey).is(queryValue));
		
		Update update = new Update();
		if(updateMap!=null && updateMap.size()>0) {
			for(String key : updateMap.keySet()) {
				update.set(key, updateMap.get(key));
			}
		}
		mongoTemplate.updateMulti(query, update, entityClass);
	}
	

}
