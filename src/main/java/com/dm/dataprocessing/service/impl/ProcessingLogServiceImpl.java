package com.dm.dataprocessing.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.dm.dataprocessing.model.ProcesLog;
import com.dm.dataprocessing.service.ProcessingLogService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

@Service
public class ProcessingLogServiceImpl implements ProcessingLogService {

	@Autowired
	private MongoTemplate mongoTemplate;

	@Override
	public PageInfo<ProcesLog> list(Integer pageNum, Integer pageSize,
			Map map) {
		Query query =new Query();
		//获取总条数  
        long totalCount = this.mongoTemplate.count(query, this.getEntityClass());  
        //总页数  
        int totalPage = (int) (totalCount/pageSize);  
          
        int skip = (pageNum-1)*pageSize;  
          
        query.skip(skip);// skip相当于从那条记录开始  
        query.limit(pageSize);// 从skip开始,取多少条记录 
        //query.with(new Sort());
        List datas = this.mongoTemplate.find(query, this.getEntityClass());
        Page p = new Page();
		p.addAll(datas);
		p.setPageNum(pageNum);
		p.setPageSize(pageSize);
		p.setTotal(totalCount);
		PageInfo page = new PageInfo(p);
        return page;  
	}

	private Class<?> getEntityClass() {
		return ProcesLog.class;
	}

	@Override
	public ProcesLog load(String id) {
		ProcesLog v =(ProcesLog) mongoTemplate.findById(id, getEntityClass());
		return v;
	}

	@Override
	public void insert(ProcesLog v) {
		mongoTemplate.save(v);
		
	}

	@Override
	public void update(ProcesLog v) {
		mongoTemplate.save(v);
		
	}

	@Override
	public void delete(String id) {
		ProcesLog v =(ProcesLog) mongoTemplate.findById(id, getEntityClass());
		mongoTemplate.remove(v);
		
	}
	
	
}
