package com.dm.app.datatopic.cunqing.baseinfo.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapreduce.GroupBy;
import org.springframework.data.mongodb.core.mapreduce.GroupByResults;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.dm.app.common.service.impl.MongoBaseServiceImpl;
import com.dm.app.datatopic.cunqing.baseinfo.service.RegVillageInfoService;
import com.dm.app.datatopic.model.RegVillage;
import com.dm.app.datatopic.model.SnqyJbxx;
import com.dm.app.datatopic.model.XclyLyh;
import com.dm.app.datatopic.model.XclyNyYq;
@Service
public class RegVillageInfoServiceImpl extends MongoBaseServiceImpl<RegVillage, String> implements RegVillageInfoService{
	@Autowired
	private MongoTemplate mongoTemplate;

	@Override
	public List<Map> getVillageCountUnderCounty() {
		List<Map> list = new ArrayList<Map>();
		/*    Criteria criteria = Criteria.where("SZ_QX")
			.in(county);//过滤条件
		 */        String initDocument = "{count:0}";//初始化数据
		 String reduceFunction = "function (doc, prev) {"
				 + " prev.count +=1; "
				 + " }";
		 GroupBy groupBy = GroupBy.key("SZ_QX")//按哪个字段分组
				 .initialDocument(initDocument).reduceFunction(reduceFunction);//添加处理函数
//		 long s1 = System.currentTimeMillis();
		 GroupByResults<Map> groupByResult = mongoTemplate.group(//criteria, //没有过滤条件
				 RegVillage.class.getAnnotation(Document.class).collection(),//获取要查询的Collection->m_ST_REG_VILLAGE
				 groupBy,//分组条件
				 Map.class//返回的数据格式
				 );
//		 long s2 = System.currentTimeMillis();
		 for(Iterator<Map> i = groupByResult.iterator();i.hasNext();){
			 list.add(i.next());
		 }
		 long s3 = System.currentTimeMillis();
//		 System.out.println("查询时间:"+(s2-s1));
//		 System.out.println("处理查询结果:"+(s3-s2));
		 return list;
	}

	@Override
	public Integer findAllVillageCount() {
		
		Query query = new Query();
		
		long count = mongoTemplate.count(query, RegVillage.class);
		return (int) count;
	}

	@Override
	public Integer findAllShenongQiyeCount() {
		
         Query query = new Query();
		
		long count = mongoTemplate.count(query, SnqyJbxx.class);
		return (int) count;
	}

	@Override
	public List<RegVillage> getAllVillage() {
		    Query query = new Query();
			List<RegVillage> regVillageList = mongoTemplate.find(query, RegVillage.class);
		return regVillageList;
	}

	@Override
	public Integer findAlllvyouhu() {
		Query query = new Query();
		
		long count = mongoTemplate.count(query, XclyLyh.class);
		return (int) count;
	}

	@Override
	public Integer findAlllvyouyuanqu() {
		Query query = new Query();
		
		long count = mongoTemplate.count(query, XclyNyYq.class);
		return (int) count;
	}

	

}
