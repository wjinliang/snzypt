package com.dm.app.datatopic.jichushujuguanli.service.impl;
import com.dm.app.common.dao.MongoBaseDAO;
import com.dm.app.common.service.impl.MongoBaseServiceImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapreduce.GroupBy;
import org.springframework.data.mongodb.core.mapreduce.GroupByResults;
import org.springframework.stereotype.Service;

import com.dm.app.datatopic.jichushujuguanli.dao.RegCountyDAO;
import com.dm.app.datatopic.jichushujuguanli.model.RegCounty;
import com.dm.app.datatopic.jichushujuguanli.model.RegVillage;
import com.dm.app.datatopic.jichushujuguanli.service.RegCountyService;

@Service
public class RegCountyServiceImpl extends MongoBaseServiceImpl<RegCounty,String> implements RegCountyService{

	@Resource(type=RegCountyDAO.class)
	public void setBaseDao(MongoBaseDAO<RegCounty,String> baseRepository){
		this.baseRepository = baseRepository;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> getCunTongji() {
		List<Map> list = new ArrayList<Map>();
	        //Criteria criteria = Criteria.where("todayDate")
			//	.is( new Date() ).andOperator(Criteria.where("areaId").in(areaIds));//过滤条件
	        String initDocument = "{count:0}";//初始化数据
	        String reduceFunction = "function (doc, prev) {"
	        		+ " prev.count +=1; "
	        		+ " }";
	        GroupBy groupBy = GroupBy.key("SZ_QX")//按哪个字段分组
	        		.initialDocument(initDocument).reduceFunction(reduceFunction);//添加处理函数

	        GroupByResults<Map> groupByResult = mongoTemplate.group(//criteria, //没有过滤条件
	        		RegVillage.class.getAnnotation(Document.class).collection(),//获取要查询的Collection->m_ST_REG_VILLAGE
	        		groupBy,//分组条件
	        		Map.class//返回的数据格式
	        		);
	        for(Iterator<Map> i = groupByResult.iterator();i.hasNext();){
	        	list.add(i.next());
	        }
	        return list;
	}
	
	
	
}
