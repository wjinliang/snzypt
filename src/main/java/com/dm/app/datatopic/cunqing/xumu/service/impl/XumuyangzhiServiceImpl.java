package com.dm.app.datatopic.cunqing.xumu.service.impl;

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
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.dm.app.datatopic.cunqing.xumu.service.XumuyangzhiService;
import com.dm.app.datatopic.model.DanjiJbxx;
import com.dm.app.datatopic.model.NainiuJbxx;
@Service
public class XumuyangzhiServiceImpl implements XumuyangzhiService {
	@Autowired
	private MongoTemplate mongoTemplate;
	@Override
	public List<Map> findDanjiJbxxCountUnderCounty() {
		List<Map> list = new ArrayList<Map>();
		/*    Criteria criteria = Criteria.where("SZ_QX")
			.in(county);//过滤条件
		 */        String initDocument = "{count:0}";//初始化数据
		 String reduceFunction = "function (doc, prev) {"
				 + " prev.count +=1; "
				 + " }";
		 GroupBy groupBy = GroupBy.key("QX_MC")//按哪个字段分组
				 .initialDocument(initDocument).reduceFunction(reduceFunction);//添加处理函数
		 GroupByResults<Map> groupByResult = mongoTemplate.group(//criteria, //没有过滤条件
				 DanjiJbxx.class.getAnnotation(Document.class).collection(),//获取要查询的Collection->m_ST_REG_VILLAGE
				 groupBy,//分组条件
				 Map.class//返回的数据格式
				 );
		 for(Iterator<Map> i = groupByResult.iterator();i.hasNext();){
			 list.add(i.next());
		 }
		 
		 return list;
	}
	@Override
	public List findDanjiJbxxZDMJUnderCounty() {
		Query query = new Query();
		query.limit(10);
		org.springframework.data.domain.Sort sort = new org.springframework.data.domain.Sort(new org.springframework.data.domain.Sort.Order(Direction.DESC, "ZD_MJ"));
		//Sort sort=new Sort("ZD_MJ", Order.DESCENDING);
		query.with(sort);
		List<DanjiJbxx> aimList = mongoTemplate.find(query,DanjiJbxx.class);
		return aimList;
	}
	
	//获取养殖场数量
	@Override
	public List<Map> findNaiNiuJbxxCountUnderCounty() {
		List<Map> list = new ArrayList<Map>();
		/*    Criteria criteria = Criteria.where("SZ_QX")
			.in(county);//过滤条件
		 */        String initDocument = "{count:0}";//初始化数据
		 String reduceFunction = "function (doc, prev) {"
				 + " prev.count +=1; "
				 + " }";
		 GroupBy groupBy = GroupBy.key("QX_MC")//按哪个字段分组
				 .initialDocument(initDocument).reduceFunction(reduceFunction);//添加处理函数
		 GroupByResults<Map> groupByResult = mongoTemplate.group(//criteria, //没有过滤条件
				 NainiuJbxx.class.getAnnotation(Document.class).collection(),//获取要查询的Collection->m_ST_REG_VILLAGE
				 groupBy,//分组条件
				 Map.class//返回的数据格式
				 );
		 for(Iterator<Map> i = groupByResult.iterator();i.hasNext();){
			 list.add(i.next());
		 }
		 
		 return list;
	}
	
	//获取养殖场面积前十
	@Override
	public List  findNaiNiuJbxxZDMJUnderCounty() {
		Query query = new Query();
		query.limit(10);
		org.springframework.data.domain.Sort sort = new org.springframework.data.domain.Sort(new org.springframework.data.domain.Sort.Order(Direction.DESC, "ZD_MJ"));
		query.with(sort);
		List<NainiuJbxx> nainiulist = mongoTemplate.find(query,NainiuJbxx.class);
		return nainiulist;
	}

	
	
	
}
