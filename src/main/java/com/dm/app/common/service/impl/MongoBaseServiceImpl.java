package com.dm.app.common.service.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.MongoTemplate;

import com.dm.app.common.dao.MongoBaseDAO;
import com.dm.app.common.service.MongoBaseService;
import com.dm.app.util.Page;


/**
 * MongoDB相关的service层基接口的实现类
 * @author LiaoGang
 * @param <T>
 * @param <PK>
 */
public abstract class MongoBaseServiceImpl<T extends Serializable, PK extends Serializable>
	implements MongoBaseService<T, PK> {
	
	protected MongoBaseDAO<T, PK> baseRepository;
	@Autowired
	protected MongoTemplate mongoTemplate;
	
	@Override
	public void save(T t) {
		baseRepository.save(t);
	}

	@Override
	public void delete(T t) {
		baseRepository.delete(t);
	}
	@Override
	public void deleteIds(String[] ids) {
		baseRepository.deleteIds(ids);
	}
	@Override
	public void deleteById(PK id) {
		baseRepository.deleteById(id);
	}

	@Override
	public T findById(PK id) {
		return baseRepository.findById(id);
	}

	@Override
	public List<T> findAll() {
		return baseRepository.findAll();
	}
	@Override
	public List<T> findAll(Map searchMap) {
		return baseRepository.findAll(searchMap);
	}

	@Override
	public Page<T> getPage(int page, int pageSize) {
		return baseRepository.getPage(page, pageSize);
	}

	@Override
	public void updatePropertyById(PK id, String key, Object value) {
		baseRepository.updatePropertyById(id, key, value);
	}

	@Override
	public T getByProperty(String key, Object value) {
		return baseRepository.getByProperty(key, value);
	}

	@Override
	public List<T> getsByProperty(String key, Object value) {
		return baseRepository.getsByProperty(key, value);
	}
	@Override
	public List<T> findByPropertys(String key, Object[] ids){
		return baseRepository.findByPropertys(key, ids);
	}
	
	@Override
	public void incrementById(PK id, String key, Number incr) {
		baseRepository.incrementById(id, key, incr);
	}
	
	@Override
	public void incrementByProperty(String queryKey,Object queryValue, String key, Number incr) {
		baseRepository.incrementByProperty(queryKey, queryValue, key, incr);
	}
	@Override
	public List<T> getByIds(Collection<PK> ids) {
		return baseRepository.getByIds(ids);
	}
	
	@Override
	public Page<T> getPage(int page, int pageSize, Map<String, Object> map, 
			LinkedHashMap<String, Direction> orders) {
		return baseRepository.getPage(page, pageSize, map, orders);
	}
	
	@Override
	public Page<T> getPageByParams(HashMap<String,Object> params,int page, int pageSize) {
		return baseRepository.getPage(params,page, pageSize);
	}
	
	@Override
	public void updateByProperty(String querykey, Object queryValue,
			String property, Object value) {
		baseRepository.updateByProperty(querykey, queryValue, property, value);
	}
	
	@Override
	public void updateByProperty(String querykey, Object queryValue,
			Map<String, Object> updateMap) {
		baseRepository.updateByProperty(querykey, queryValue, updateMap);
	}
}
