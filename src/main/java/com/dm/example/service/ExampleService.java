package com.dm.example.service;

import java.util.List;

import org.springframework.data.domain.Sort.Order;

import com.dm.example.model.ExampleEntity;

public interface ExampleService {
	public List<ExampleEntity> listByPage(ExampleEntity entity,int thispage,int pagesize,List<Order> orders);
	public List<ExampleEntity> listAll(ExampleEntity entity,List<Order> orders);
	public Long count(ExampleEntity entity);
	public ExampleEntity findById(Object id);
	public void save(ExampleEntity entity);
	public void update(ExampleEntity entity);
	public void deleteById(Object id);
	public Long checkUnique(String name,String id);
}
