package com.dm.app.datatopic.cunqing.market.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapreduce.GroupBy;
import org.springframework.data.mongodb.core.mapreduce.GroupByResults;
import org.springframework.stereotype.Service;

import com.dm.app.datatopic.cunqing.market.service.MarketService;
import com.dm.app.datatopic.model.NfscJbxx;
import com.mongodb.AggregationOutput;
import com.mongodb.BasicDBObject;
import com.mongodb.CommandResult;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
@Service
public class MarketServiceImpl   implements MarketService{
	@Autowired
	private MongoTemplate mongoTemplate;
	@Override
	public List<Map> getMarketCount(String year) {
		List<Map> list=new ArrayList<Map>();
		//统计不同区 自然保护区的个数
		String initDocument = "{count:0}";//初始化数据
		String reduceFunction="function (doc,prev) {"
				+ " prev.count+=1;"
				+ "}";
		GroupBy groupBy =GroupBy.key("SZ_QX").initialDocument(initDocument).reduceFunction(reduceFunction);
		GroupByResults<Map> counts = mongoTemplate.group(NfscJbxx.class.getAnnotation(Document.class).collection(),groupBy, Map.class);
		for (Iterator<Map> i= counts.iterator() ; i.hasNext();) {
			
			
			list.add(i.next());
		}
		
		return list;
	}
	@Override
	public List getReCapital(String year) {
		/*Query query = new Query();
		Criteria criteria = Criteria.where("ZC_ZB").gt(20);
		query.limit(10);
		query.addCriteria(criteria);
		org.springframework.data.domain.Sort sort = new org.springframework.data.domain.Sort(new org.springframework.data.domain.Sort.Order(Direction.DESC, "ZC_ZB"));
		
		query.with(sort);
		
		List<NfscJbxx> aimList = mongoTemplate.find(query,NfscJbxx.class);
	
		return aimList;*/
		DBCollection myColl=mongoTemplate.getCollection("m_SCDP_CGXPT_NFSC_JBXX");
        DBObject groupFields = new BasicDBObject( "_id", "$JY_HY");//groupByPro为数据库中的字段，即要进行分组的依据
        groupFields.put("total", new BasicDBObject( "$sum", "$ZC_ZB"));
        DBObject group = new BasicDBObject("$group", groupFields );
        DBObject sortFields = new BasicDBObject("total", -1);
        DBObject sort = new BasicDBObject("$sort", sortFields );
        AggregationOutput output = myColl.aggregate(group, sort);
      CommandResult com=  output.getCommandResult();
		List list=(List)com.get("result");
		return list;
	}
	

}
