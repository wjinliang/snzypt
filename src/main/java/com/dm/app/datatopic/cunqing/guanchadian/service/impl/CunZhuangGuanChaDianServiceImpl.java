package com.dm.app.datatopic.cunqing.guanchadian.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.mapreduce.GroupBy;
import org.springframework.data.mongodb.core.mapreduce.GroupByResults;
import org.springframework.stereotype.Service;

import com.dm.app.datatopic.cunqing.guanchadian.service.CunZhuangGuanChaDianService;
@Service
public class CunZhuangGuanChaDianServiceImpl implements CunZhuangGuanChaDianService {
	@Autowired
	private MongoTemplate mongoTemplate;
	@Override
	public List<Map> getGuanChaDianCountUnderQx() {
		List<Map> list = new ArrayList<Map>();
		String initDocument = "{count:0}";
		String reduceFunction = "function (doc, prev) {"
				 + " prev.count +=1; "
				 + " }";
		 GroupBy groupBy = GroupBy.key("quxian")//按哪个字段分组
				 .initialDocument(initDocument).reduceFunction(reduceFunction);//添加处理函数
		 GroupByResults<Map> groupByResult = mongoTemplate.group("t_CUNZHUANGCJ", groupBy, Map.class);
		 for(Iterator<Map> i = groupByResult.iterator();i.hasNext();){
			 list.add(i.next());
		 }
		return list;
	}

}
