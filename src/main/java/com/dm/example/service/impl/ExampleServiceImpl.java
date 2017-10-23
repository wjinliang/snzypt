package com.dm.example.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Service;

import com.dm.example.model.ExampleEntity;
import com.dm.example.service.ExampleService;
import com.dm.platform.dao.CommonDAO;

@Service
public class ExampleServiceImpl implements ExampleService{
	@Resource
	private CommonDAO commonDAO;
	@Override
	public List<ExampleEntity> listByPage(ExampleEntity entity, int thispage,
			int pagesize,List<Order> orders) {
		// TODO Auto-generated method stub
		ExampleEntity e = new ExampleEntity();
		String whereSql="";
		if(entity!=null){
			if(entity.getName()!=null&&!entity.getName().equals("")){
				whereSql+=" and t.name like :name ";
				e.setName("%"+entity.getName()+"%");
			}
			if(entity.getSelector()!=null&&!entity.getSelector().equals("")){
				whereSql+=" and t.selector = :selector ";
				e.setSelector(entity.getSelector());
			}
		}
		return commonDAO.findByPage(whereSql,ExampleEntity.class,e,thispage, pagesize,orders);
	}

	@Override
	public List<ExampleEntity> listAll(ExampleEntity entity,List<Order> orders) {
		// TODO Auto-generated method stub
		String whereSql="";
		ExampleEntity e = new ExampleEntity();
		if(entity!=null){
			if(entity.getName()!=null&&!entity.getName().equals("")){
				whereSql+=" and t.name like :name ";
				e.setName("%"+entity.getName()+"%");
			}
			if(entity.getSelector()!=null&&!entity.getSelector().equals("")){
				whereSql+=" and t.selector = :selector ";
				e.setSelector(entity.getSelector());
			}
		}
		return commonDAO.findAll(ExampleEntity.class, whereSql, e, orders);
	}

	@Override
	public Long count(ExampleEntity entity) {
		// TODO Auto-generated method stub
		String whereSql="";
		ExampleEntity e = new ExampleEntity();
		if(entity!=null){
			if(entity.getName()!=null&&!entity.getName().equals("")){
				whereSql+=" and t.name like :name ";
				e.setName("%"+entity.getName()+"%");
			}
			if(entity.getSelector()!=null&&!entity.getSelector().equals("")){
				whereSql+=" and t.selector = :selector ";
				e.setSelector(entity.getSelector());
			}
		}
		return commonDAO.count(ExampleEntity.class, whereSql, e);
	}

	@Override
	public ExampleEntity findById(Object id) {
		// TODO Auto-generated method stub
		return commonDAO.findOne(ExampleEntity.class,id);
	}

	@Override
	public void save(ExampleEntity entity) {
		// TODO Auto-generated method stub
		commonDAO.save(entity);
	}

	@Override
	public void update(ExampleEntity entity) {
		// TODO Auto-generated method stub
		commonDAO.update(entity);
	}

	@Override
	public void deleteById(Object id) {
		// TODO Auto-generated method stub
		commonDAO.deleteById(ExampleEntity.class, id);
	}

	@Override
	public Long checkUnique(String name,String id) {
		// TODO Auto-generated method stub
		ExampleEntity e = new ExampleEntity();
		String whereSql=" and t.name = :name ";
		e.setName(name);
		if(!StringUtils.isEmpty(id)){
			whereSql+=" and t.id != :id ";
			e.setId(Long.valueOf(id));
		}
		return commonDAO.count(ExampleEntity.class,whereSql,e);
	}

}
