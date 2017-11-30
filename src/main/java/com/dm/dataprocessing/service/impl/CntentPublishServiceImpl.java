package com.dm.dataprocessing.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsContentService;
import com.dm.dataprocessing.model.ContentPublishProces;
import com.dm.dataprocessing.model.VillageNameProces;
import com.dm.dataprocessing.service.ContentPublishProcessingService;
import com.dm.timer.CmsSpiderToContentTimer;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

@Service
public class CntentPublishServiceImpl implements ContentPublishProcessingService {

	@Autowired
	private MongoTemplate mongoTemplate;
	@Autowired
	private CmsChannelService cmsChannelService;
	@Autowired
	private CmsContentService cmsContentService;

	@Override
	public PageInfo<ContentPublishProces> list(Integer pageNum, Integer pageSize,
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
		return ContentPublishProces.class;
	}

	@Override
	public void run(String id) {
		ContentPublishProces v =(ContentPublishProces) mongoTemplate.findById(id, getEntityClass());
		CmsSpiderToContentTimer time = new CmsSpiderToContentTimer();
		time.setMongo(mongoTemplate);
		time.setCmsChannelService(cmsChannelService);
		time.setCmsContentService(cmsContentService);
		time.publish(v.getCollection(), v.getChannelId(), v.getTemplateId(), v.getPublishTime(),
				v.getPublishTimeFormat(), v.getTitle(), v.getContent(), v.getAuthor(), v.getOrigion(), v.getTableid());
		
	}

	@Override
	public ContentPublishProces load(String id) {
		ContentPublishProces v =(ContentPublishProces) mongoTemplate.findById(id, getEntityClass());
		return v;
	}

	@Override
	public void insert(ContentPublishProces v) {
		mongoTemplate.save(v);
		
	}

	@Override
	public void update(ContentPublishProces v) {
		mongoTemplate.save(v);
		
	}

	@Override
	public void delete(String id) {
		VillageNameProces v =(VillageNameProces) mongoTemplate.findById(id, getEntityClass());
		mongoTemplate.remove(v);
		
	}
	
	
}
