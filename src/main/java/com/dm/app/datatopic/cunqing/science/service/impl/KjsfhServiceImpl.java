package com.dm.app.datatopic.cunqing.science.service.impl;

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

import com.dm.app.datatopic.cunqing.science.service.KjsfhService;
import com.dm.app.datatopic.model.KjsfhJbxx;
import com.dm.app.datatopic.model.KjsfhJyqk;
import com.mongodb.AggregationOutput;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.CommandResult;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
@Service
public class KjsfhServiceImpl implements KjsfhService {
	@Autowired
	private MongoTemplate mongoTemplate;
	@Override
	public List<Map> getSciencetCount(String year) {
		List<Map> list=new ArrayList<Map>();
		//统计不同区 自然保护区的个数
		String initDocument = "{count:0}";//初始化数据
		String reduceFunction="function (doc,prev) {"
				+ " prev.count+=1;"
				+ "}";
		GroupBy groupBy =GroupBy.key("QX_MC").initialDocument(initDocument).reduceFunction(reduceFunction);
		GroupByResults<Map> counts = mongoTemplate.group(KjsfhJbxx.class.getAnnotation(Document.class).collection(),groupBy, Map.class);
		for (Iterator<Map> i= counts.iterator() ; i.hasNext();) {
			
			
			list.add(i.next());
		}
		
		return list;
	}

	@Override
	public List getZzMji(String year) {
		
	/*	Query query = new Query();
		Criteria criteria = Criteria.where("TJ_ND").is("2007");
		query.limit(10);
		query.addCriteria(criteria);
		org.springframework.data.domain.Sort sort = new org.springframework.data.domain.Sort(new org.springframework.data.domain.Sort.Order(Direction.DESC, "ZZ_MJ"));
		
		query.with(sort);
		
		List<KjsfhJyqk> aimList = mongoTemplate.find(query,KjsfhJyqk.class);
	
		return aimList;*/
		DBCollection myColl=mongoTemplate.getCollection("m_KJ_KJSFH_JYQK");
        DBObject groupFields = new BasicDBObject( "_id", "$ZZ_ZW");//groupByPro为数据库中的字段，即要进行分组的依据
        groupFields.put("total", new BasicDBObject( "$sum", "$ZZ_MJ"));
        DBObject group = new BasicDBObject("$group", groupFields );
        DBObject sortFields = new BasicDBObject("total", -1);
        DBObject sort = new BasicDBObject("$sort", sortFields );
        AggregationOutput output = myColl.aggregate(group, sort);
      CommandResult com=  output.getCommandResult();
		List list=(List)com.get("result");
		return list;
	}

	@Override
	public List<Map> getZzZw(String year) {
		List<Map> list=new ArrayList<Map>();
		//统计不同区 自然保护区的个数
		String initDocument = "{count:0}";//初始化数据
		String reduceFunction="function (doc,prev) {"
				+ " prev.count+=1;"
				+ "}";
		GroupBy groupBy =GroupBy.key("ZZ_ZW").initialDocument(initDocument).reduceFunction(reduceFunction);
		GroupByResults<Map> counts = mongoTemplate.group(KjsfhJyqk.class.getAnnotation(Document.class).collection(),groupBy, Map.class);
		for (Iterator<Map> i= counts.iterator() ; i.hasNext();) {
			
			
			list.add(i.next());
		}
		
		return list;
		
	}
	

}
