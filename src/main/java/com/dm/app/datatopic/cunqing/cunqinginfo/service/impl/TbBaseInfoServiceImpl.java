package com.dm.app.datatopic.cunqing.cunqinginfo.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.dm.app.datatopic.cunqing.cunqinginfo.model.TbBaseInfo;
import com.dm.app.datatopic.cunqing.cunqinginfo.service.TbBaseInfoService;
import com.dm.app.util.judge.ObjectUtils;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
@Service
public class TbBaseInfoServiceImpl implements TbBaseInfoService {
	@Autowired
	private MongoTemplate mongoTemplate;
	@Autowired
	private RedisTemplate<String, Object> redisTemplate;
	private final static int DEFAULT_EXPIRE_SECOND = 12 * 60 * 60;

	@Override
	public Map<String,Object> findByCondition(String tableName, Map<String, Object> condition) {

		DBCollection countyColl=mongoTemplate.getCollection(tableName);
		BasicDBObject query = new BasicDBObject();
		for (Entry<String, Object> i : condition.entrySet()) {
			query.put(i.getKey(), i.getValue());
		}
		DBCursor cursor =countyColl.find(query);
		Map<String,Object> result=new HashMap<String,Object>();
		Iterator<DBObject> iterator = cursor.iterator();
		while (iterator.hasNext()) {
			DBObject dbObject = iterator.next();
			for(String key : dbObject.keySet()) {
				result.put(key,  dbObject.get(key));
			}
		}
		return result;
	}

	@Override
	public Map<String, Object> findByCondition(String tableName, String conditionKey, Object conditionValue) {

		DBCollection countyColl=mongoTemplate.getCollection(tableName);
		BasicDBObject query = new BasicDBObject();
		query.put(conditionKey, conditionValue);
		DBCursor cursor =countyColl.find(query);
		Map<String,Object> result=new HashMap<String,Object>();
		Iterator<DBObject> iterator = cursor.iterator();
		while (iterator.hasNext()) {
			DBObject dbObject = iterator.next();
			for(String key : dbObject.keySet()) {
				result.put(key,  dbObject.get(key));
			}
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TbBaseInfo> findTbBaseInfoByVillageCode(String villageCode) {
		Object result=redisTemplate.opsForValue().get("findTbBaseInfoByVillageCode"+villageCode);
		if(ObjectUtils.isNull(result)){
			Query query=new Query();
			Criteria criteria=Criteria.where("XZC_CODE").is(villageCode);
			query.addCriteria(criteria);
			List<TbBaseInfo> tbbaseinfos= mongoTemplate.find(query, TbBaseInfo.class);
			Map ta_classification,ta_education,ta_hukou,ta_nation,ta_politics,ta_techposition,ta_trainingtype,ta_worktype=new HashMap<>();
			for(int i=0;i<tbbaseinfos.size();i++){
				TbBaseInfo tbbaseinfo=tbbaseinfos.get(i);

				ta_classification=this.findByCondition("h_TA_ClassiFication", "ClassiFication_ID",Integer.parseInt(tbbaseinfo.getClassiFicationId()));
				tbbaseinfo.setClassiFicationName(ta_classification.get("ClassiFication_Name").toString());

				ta_education=this.findByCondition("h_TA_Education", "Education_ID", Integer.parseInt(tbbaseinfo.getEducationId()));
				tbbaseinfo.setEducationName(ta_education.get("Education_Name").toString());

				ta_hukou=this.findByCondition("h_TA_Hukou", "Hukou_ID", Integer.parseInt(tbbaseinfo.getHukouId()));
				tbbaseinfo.setHukouName(ta_hukou.get("Hukou_Name").toString());

				ta_nation=this.findByCondition("h_TA_Nation", "Nation_ID", Integer.parseInt(tbbaseinfo.getNationId()));
				tbbaseinfo.setNationName(ta_nation.get("Nation_Name").toString());

				ta_politics=this.findByCondition("h_TA_Politics", "Politics_ID", Integer.parseInt(tbbaseinfo.getPoliticsId()));
				tbbaseinfo.setPoliticsName(ta_politics.get("Politics_Name").toString());

				ta_techposition=this.findByCondition("h_TA_Techposition", "Techposition_ID", Integer.parseInt(tbbaseinfo.getTechpositionID()));
				tbbaseinfo.setTechpositionName(ta_techposition.get("Techposition_Name").toString());

				ta_trainingtype=this.findByCondition("h_TA_TrainingType", "TrainingType_ID", Integer.parseInt(tbbaseinfo.getTraingTypeId()));
				tbbaseinfo.setTraingTypeName(ta_trainingtype.get("TrainingType_Name").toString());
			}
			redisTemplate.opsForValue().set("findTbBaseInfoByVillageCode"+villageCode, tbbaseinfos, DEFAULT_EXPIRE_SECOND,
					TimeUnit.SECONDS);
			return tbbaseinfos;
		}else{
			return (List<TbBaseInfo>)result;
		}

	}

	@Override
	public long findTbBaseInfoCountByVillageCode(String villageCode) {
		Query query=new Query();
		Criteria criteria=Criteria.where("XZC_CODE").is(villageCode);
		query.addCriteria(criteria);
		return mongoTemplate.count(query, TbBaseInfo.class);
	}





}
