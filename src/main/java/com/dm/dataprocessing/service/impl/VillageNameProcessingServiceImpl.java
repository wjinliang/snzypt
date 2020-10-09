package com.dm.dataprocessing.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.dm.dataprocessing.model.VillageNameProces;
import com.dm.dataprocessing.service.VillageNameProcessingService;
import com.dm.timer.XzcCodeTimer;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

@Service
public class VillageNameProcessingServiceImpl implements VillageNameProcessingService {

	@Autowired
	private MongoTemplate mongoTemplate;

	@Override
	public PageInfo<VillageNameProces> list(Integer pageNum, Integer pageSize,
			Map map) {
		Query query =new Query();
		//获取总条数  
        long totalCount = this.mongoTemplate.count(query, this.getEntityClass());  
        //总页数  
        int totalPage = (int) (totalCount/pageSize);  
          
        int skip = (pageNum-1)*pageSize;  
          
        query.skip(skip);// skip相当于从那条记录开始  
        query.limit(pageSize);// 从skip开始,取多少条记录  
          
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
		return VillageNameProces.class;
	}

	@Override
	public void run(String id) {
		VillageNameProces v =(VillageNameProces) mongoTemplate.findById(id, getEntityClass());
		String collectionName = v.getColl();
		String qx =v.getQx();
		String xz =v.getXz();
		String xzc = v.getXz();
		String cid =v.getCollid();
		String name = v.getName();
		String jg = v.getJg();
		String title = v.getTitle();
		String content = v.getContent();
		XzcCodeTimer xzctimer = new XzcCodeTimer();
		xzctimer.setMongo(mongoTemplate);
		String type = v.getType();
		if(type.equals("2")){
			xzctimer.updateTableCode2(name,collectionName, qx, xz, xzc, cid);
		}
		if(type.equals("3")){
			xzctimer.updateTableCode3(name,collectionName, qx, xz, xzc, cid);
		}
		if(type.equals("4")){
			xzctimer.updateTableCode4(name,collectionName, qx, xz, xzc, cid);
		}
		if(type.equals("6")){
			xzctimer.updateTableCode6(name,collectionName, title, content, cid);
		}
		if(type.equals("0")){
			xzctimer.updateTableCode(name,collectionName, jg, cid);
		}
		
		if(type.equals("1")){
			xzctimer.updateTableCode1(name,collectionName);
		}
		
	}

	@Override
	public VillageNameProces load(String id) {
		VillageNameProces v =(VillageNameProces) mongoTemplate.findById(id, getEntityClass());
		return v;
	}

	@Override
	public void insert(VillageNameProces v) {
		mongoTemplate.save(v);
		
	}

	@Override
	public void update(VillageNameProces v) {
		mongoTemplate.save(v);
		
	}

	@Override
	public void delete(String id) {
		VillageNameProces v =(VillageNameProces) mongoTemplate.findById(id, getEntityClass());
		mongoTemplate.remove(v);
		
	}
	
	
}
