package com.dm.app.datatopic.xiangcunlvyou.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.mapreduce.GroupBy;
import org.springframework.data.mongodb.core.mapreduce.GroupByResults;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.dm.app.datatopic.xiangcunlvyou.service.XiangCunLvYouService;
import com.dm.atform.util.RedisCache;
import com.mongodb.AggregationOutput;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.CommandResult;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;

/**               
 * @date: 2017年4月5日
 * @Author: fyq
 */

@Service
public class XiangCunLvYouServiceImpl implements XiangCunLvYouService {

	
	
	@Autowired
	private RedisCache redis;
	//获取乡村旅游之旅游村，按照区县分组
	@Autowired
	private MongoTemplate mongoTemplate;
	@Override
	public List<Map> getXiangCunLvYouCountUnderQx() {
	
	
		/*	List<Map> list = new ArrayList<Map>();
		String initDocument = "{count:0}";
		String reduceFunction = "function (doc, prev) {"
				 + " prev.count +=1; "
				 + " }";
		 GroupBy groupBy = GroupBy.key("qxtown")//按哪个字段分组
				 .initialDocument(initDocument).reduceFunction(reduceFunction);//添加处理函数
		 GroupByResults<Map> groupByResult = mongoTemplate.group("im_qsmslycplbzsjcjb", groupBy, Map.class);
		 for(Iterator<Map> i = groupByResult.iterator();i.hasNext();){
			 list.add(i.next());
		 }
		 
		 
	*/	
		DBCollection myColl=mongoTemplate.getCollection("im_qsmslycplbzsjcjb");
        DBObject groupFields = new BasicDBObject( "_id", "$qxtown");//groupByPro为数据库中的字段，即要进行分组的依据
        groupFields.put("count", new BasicDBObject( "$sum", 1));
        DBObject group = new BasicDBObject("$group", groupFields );
        DBObject sortFields = new BasicDBObject("_id", -1);
        DBObject sort = new BasicDBObject("$sort", sortFields );
        AggregationOutput output = myColl.aggregate(group, sort);
      CommandResult com=  output.getCommandResult();
		List list=(List)com.get("result");
		return list;
	
	
	}
	
	//获取乡村旅游之旅游户个数，按照区县分组
	@Override
	public List<Map> getXiangCunLvYouHuCountUnderQx() {
	/*	List<Map> list = new ArrayList<Map>();
		String initDocument = "{count:0}";
		String reduceFunction = "function (doc, prev) {"
				 + " prev.count +=1; "
				 + " }";
		 GroupBy groupBy = GroupBy.key("qxtown")//按哪个字段分组
				 .initialDocument(initDocument).reduceFunction(reduceFunction);//添加处理函数
		 GroupByResults<Map> groupByResult = mongoTemplate.group("im_bjsmslyhplbzsjcjb", groupBy, Map.class);
		 for(Iterator<Map> i = groupByResult.iterator();i.hasNext();){
			 list.add(i.next());
		 }
	*/
		String key = "getXiangCunLvYouHuCountUnderQx_null";
		Object o = redis.get(key);
		if(o!=null){
			return (List<Map>)o;
		}
		DBCollection myColl=mongoTemplate.getCollection("im_bjsmslyhplbzsjcjb");
        DBObject groupFields = new BasicDBObject( "_id", "$qxtown");//groupByPro为数据库中的字段，即要进行分组的依据
        groupFields.put("count", new BasicDBObject( "$sum", 1));
        DBObject group = new BasicDBObject("$group", groupFields );
        DBObject sortFields = new BasicDBObject("_id", -1);
        DBObject sort = new BasicDBObject("$sort", sortFields );
        AggregationOutput output = myColl.aggregate(group, sort);
      CommandResult com=  output.getCommandResult();
		List list=(List)com.get("result");
		redis.set(key,list);
		return list;
	}
	//乡村旅游之旅游户，获取面积
	@Override
	public List getXiangCunLvYouHuSumMj(String year) {
		List list = new ArrayList();
		BasicDBObject  key = new BasicDBObject();
	 
		BasicDBObject  cond = new BasicDBObject();
		BasicDBObject initial = new BasicDBObject(); 
		initial.append("total", 0);
		Query query = new Query();
		String initDocument = "{total:0}";//初始化数据
		String reduceFunction="function (doc,out) {"
				+ " out.total+=doc.jymjpm;"
				+ "}";
		//
		BasicDBList groupLis=(BasicDBList) mongoTemplate.getCollection("im_bjsmslyhplbzsjcjb").group(key, cond, initial, reduceFunction);
		for (Iterator it =groupLis.iterator() ; it.hasNext();) {
			list.add(it.next());
		}
		
		return list;
	}
	//乡村旅游之农业园区个数
	@Override
	public List getXiangCunLvYouQuCountUnderQx() {
	/*	List<Map> list = new ArrayList<Map>();
		String initDocument = "{count:0}";
		String reduceFunction = "function (doc, prev) {"
				 + " prev.count +=1; "
				 + " }";
		 GroupBy groupBy = GroupBy.key("qxtown")//按哪个字段分组
				 .initialDocument(initDocument).reduceFunction(reduceFunction);//添加处理函数
		 GroupByResults<Map> groupByResult = mongoTemplate.group("im_qsxxnyyqplbzsjcjb", groupBy, Map.class);
		 for(Iterator<Map> i = groupByResult.iterator();i.hasNext();){
			 list.add(i.next());
		 }
		return list;*/
		String key = "getXiangCunLvYouQuCountUnderQx_null";
		Object o = redis.get(key);
		if(o!=null){
			return (List)o;
		}
		DBCollection myColl=mongoTemplate.getCollection("im_qsxxnyyqplbzsjcjb");
        DBObject groupFields = new BasicDBObject( "_id", "$qxtown");//groupByPro为数据库中的字段，即要进行分组的依据
        groupFields.put("count", new BasicDBObject( "$sum", 1));
        DBObject group = new BasicDBObject("$group", groupFields );
        DBObject sortFields = new BasicDBObject("_id", -1);
        DBObject sort = new BasicDBObject("$sort", sortFields );
        AggregationOutput output = myColl.aggregate(group, sort);
        CommandResult com=  output.getCommandResult();
		List list=(List)com.get("result");
		redis.set(key,list);
		return list;
	}
	
	
	//乡村旅游之农业园区项目类型
	@Override
	public List getXiangCunLvYouQuXiangmuLeiXingCountUnderQx() {
		String key = "getXiangCunLvYouQuXiangmuLeiXingCountUnderQx_null";
		Object o = redis.get(key);
		if(o!=null){
			return (List)o;
		}
		List<Map> list = new ArrayList<Map>();
		String initDocument = "{count:0}";
		String reduceFunction = "function (doc, prev) {"
				 + " prev.count +=1; "
				 + " }";
		 GroupBy groupBy = GroupBy.key("yjxy")//按哪个字段分组
				 .initialDocument(initDocument).reduceFunction(reduceFunction);//添加处理函数
		 GroupByResults<Map> groupByResult = mongoTemplate.group("im_qsxxnyyqplbzsjcjb", groupBy, Map.class);
		 for(Iterator<Map> i = groupByResult.iterator();i.hasNext();){
			 list.add(i.next());
		 }
			redis.set(key,list);
		return list;
	}
    //获取乡村旅游户一级行业个数
	@Override
	public List getXiangCunLvYouHuCountOneHyUnderQx() {
		String key = "getXiangCunLvYouHuCountOneHyUnderQx_null";
		Object o = redis.get(key);
		if(o!=null){
			return (List)o;
		}
		List<Map> list = new ArrayList<Map>();
		String initDocument = "{count:0}";
		String reduceFunction = "function (doc, prev) {"
				 + " prev.count +=1; "
				 + " }";
		 GroupBy groupBy = GroupBy.key("yjxy")//按哪个字段分组
				 .initialDocument(initDocument).reduceFunction(reduceFunction);//添加处理函数
		 GroupByResults<Map> groupByResult = mongoTemplate.group("im_bjsmslyhplbzsjcjb", groupBy, Map.class);
		 for(Iterator<Map> i = groupByResult.iterator();i.hasNext();){
			 list.add(i.next());
		 }
			redis.set(key,list);
		return list;
	}
	//获取乡村旅游户二级行业个数
	@Override
	public List getXiangCunLvYouHuCountTwoHyUnderQx() {
		List<Map> list = new ArrayList<Map>();
		String initDocument = "{count:0}";
		String reduceFunction = "function (doc, prev) {"
				 + " prev.count +=1; "
				 + " }";
		 GroupBy groupBy = GroupBy.key("ejxy")//按哪个字段分组
				 .initialDocument(initDocument).reduceFunction(reduceFunction);//添加处理函数
		 GroupByResults<Map> groupByResult = mongoTemplate.group("im_bjsmslyhplbzsjcjb", groupBy, Map.class);
		 for(Iterator<Map> i = groupByResult.iterator();i.hasNext();){
			 list.add(i.next());
		 }
		return list;
	}
}
