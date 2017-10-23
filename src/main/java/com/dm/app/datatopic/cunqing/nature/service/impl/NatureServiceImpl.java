package com.dm.app.datatopic.cunqing.nature.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapreduce.GroupBy;
import org.springframework.data.mongodb.core.mapreduce.GroupByResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.dm.app.common.service.impl.MongoBaseServiceImpl;
import com.dm.app.datatopic.cunqing.nature.service.NatureService;
import com.dm.app.datatopic.model.RegVillage;
import com.dm.app.datatopic.model.ZrbhqJbxx;
@Service
public class NatureServiceImpl  extends MongoBaseServiceImpl<RegVillage, String> implements NatureService{
	@Autowired
	private MongoTemplate mongoTemplate;
	@Override
	public List<Map> getNatureCount(String year) {
		List<Map> list=new ArrayList<Map>();
		//统计不同区 自然保护区的个数
		String initDocument = "{count:0}";//初始化数据
		String reduceFunction="function (doc,prev) {"
				+ " prev.count+=1;"
				+ "}";
		GroupBy groupBy =GroupBy.key("SZ_QX").initialDocument(initDocument).reduceFunction(reduceFunction);
		GroupByResults<Map> counts = mongoTemplate.group(ZrbhqJbxx.class.getAnnotation(Document.class).collection(),groupBy, Map.class);
		for (Iterator<Map> i= counts.iterator() ; i.hasNext();) {
			
			
			list.add(i.next());
		}
		
		return list;
	}
	@Override
	public List getNatureSpace(String year) {
		Query query = new Query();
		Criteria criteria = Criteria.where("BHQ_MJ").gt(20);
		query.limit(10);
		query.addCriteria(criteria);
		org.springframework.data.domain.Sort sort = new org.springframework.data.domain.Sort(new org.springframework.data.domain.Sort.Order(Direction.DESC, "BHQ_MJ"));
		
		query.with(sort);
		
		List<ZrbhqJbxx> aimList = mongoTemplate.find(query,ZrbhqJbxx.class);
	
		return aimList;
	}
	

}
