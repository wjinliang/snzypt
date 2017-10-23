package com.dm.app.datatopic.cunqing.nongyongjx.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.dm.app.datatopic.cunqing.nongyongjx.service.NongYongJxService;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;

@Service
public class NongYongJxServiceImpl implements NongYongJxService {
	@Autowired
	private MongoTemplate mongoTemplate;

	public List getJiXieNums() {
		String[] collNames=new String[]{"DXTLJ_SL","XXTLJ_SL","DXTLJ_PTJJ","XXTLJ_PTJJ","PGCYJ_SL"};
		List list = new ArrayList<>(5);
		/*Double dxtljSlsums=0.0;//大型拖拉机数量(台)
		list.add(dxtljSlsums);
		Double xxtljSlsums=0.0;//小型拖拉机数量(台)
		list.add(xxtljSlsums);
		Double dxtljPtjjsums=0.0;//大中型拖拉配套机具(部)
		list.add(dxtljPtjjsums);
		Double xxtljPtjjsums=0.0;//小型拖拉机拉配套机(部)
		list.add(xxtljPtjjsums);
		Double pgcyjSlsums=0.0;//排灌柴油机数量(台)
		list.add(pgcyjSlsums);*/
		for (int i = 0; i < collNames.length; i++) {
			double findSums = this.findSums(collNames[i]);
			long round = Math.round(findSums);
			list.add(round);
			
		}
		


		return list;
	}
	
	
	private double findSums(String collName) {
		double sums = 0.0;  
		String reduce = "function(doc, prev){" +  
				"            prev.sums += Number(doc."+collName+");" +  
				"        }";  
		Query query = Query.query(Criteria.where(collName).ne(null));  
		DBObject s=query.getQueryObject();  
		DBObject cond=new BasicDBObject("sums", sums);
		DBCollection dbcollection= mongoTemplate.getCollection("m_ZZ_NYJX_JBXX");
		DBObject result =dbcollection.group(null, null,cond,reduce);  
		Map<String,BasicDBObject> map = result.toMap();  
		if(map.size() > 0){  
			BasicDBObject bdbo = map.get("0");  
			if(bdbo != null && bdbo.get("sums") != null)  
				sums = bdbo.getDouble("sums");  
		}  
		return sums; 
	}
}
