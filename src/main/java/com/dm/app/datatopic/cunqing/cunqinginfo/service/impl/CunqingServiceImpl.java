package com.dm.app.datatopic.cunqing.cunqinginfo.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.mapreduce.GroupBy;
import org.springframework.data.mongodb.core.mapreduce.GroupByResults;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.dm.app.datatopic.cunqing.cunqinginfo.model.LandPushTypeCount;
import com.dm.app.datatopic.cunqing.cunqinginfo.service.CunqingService;
import com.dm.app.datatopic.jichushujuguanli.model.RegTown;
import com.dm.app.datatopic.model.KjsfhJbxx;
import com.dm.app.datatopic.model.KjsfhKj;
import com.dm.app.datatopic.model.NfscJbxx;
import com.dm.app.datatopic.model.NfscKj;
import com.dm.app.datatopic.model.RegVillage;
import com.dm.app.datatopic.model.XclyLyc;
import com.dm.app.util.judge.ObjectUtils;
import com.dm.atform.util.RedisCache;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;

@Service
public class CunqingServiceImpl implements CunqingService{

	@Autowired
	private MongoTemplate mongoTemplate;
	private RedisCache redisTemplate;
	
	public RedisCache getRedisTemplate() {
		return redisTemplate;
	}
	@Autowired
	public void setRedisTemplate(RedisCache redisTemplate) {
		this.redisTemplate = redisTemplate;
	}

	private final static int DEFAULT_EXPIRE_SECOND = 12 * 60 * 60;


	public List<Map> getViliageCount(){
		List<Map> list = new ArrayList<Map>();

		GroupBy groupBy = GroupBy.key("SZ_QX").initialDocument("{count:0}")  
				.reduceFunction("function(doc, prev){prev.count+=1}");  

		GroupByResults<RegTown> r = mongoTemplate.group("m_ST_REG_TOWN", groupBy, RegTown.class); 
		for(Iterator<RegTown> i=r.iterator();i.hasNext();){
			//	list.add(i.next());
		}
		System.out.println(r); 
		return list;
	}
	public Map<String, LandPushTypeCount> findTodayCountByAreaIds(Collection<String> areaIds) throws Exception {
		Map<String, LandPushTypeCount> result = new HashMap<String, LandPushTypeCount>();

		Criteria criteria = Criteria.where("todayDate").is( new Date() ).andOperator(Criteria.where("areaId").in(areaIds));
		String initDocument = "{codeCount:0, newCount:0, oldCount:0, errorCount:0}";
		String reduceFunction = "function (doc, prev) { prev.codeCount += doc.codeCount; prev.newCount += doc.newCount; prev.oldCount += doc.oldCount; prev.errorCount += doc.errorCount; }";
		GroupBy groupBy = GroupBy.key("areaId").initialDocument(initDocument).reduceFunction(reduceFunction);

		GroupByResults<LandPushTypeCount> groupByResult = mongoTemplate.group(criteria, "LandPushTypeCount", groupBy, LandPushTypeCount.class);

		BasicDBList list = (BasicDBList) groupByResult.getRawResults().get("retval");
		for (int i = 0; i < list.size(); i ++) {
			LandPushTypeCount landPushTypeCountBean = new LandPushTypeCount();
			BasicDBObject obj = (BasicDBObject)list.get(i);
			System.out.println("片区：" + obj.get("areaId")
			+ "总数量：" + obj.get("codeCount")
			+ "新用户数量：" + obj.get("newCount")
			+ "旧用户数量：" + obj.get("oldCount")
			+ "异常数量：" + obj.get("errorCount")
					);
			landPushTypeCountBean.setCodeCount(((Double) obj.get("codeCount")).intValue());
			landPushTypeCountBean.setNewCount(((Double) obj.get("newCount")).intValue());
			landPushTypeCountBean.setOldCount(((Double) obj.get("oldCount")).intValue());
			landPushTypeCountBean.setErrorCount(((Double) obj.get("errorCount")).intValue());
			result.put((String) obj.get("areaId"), landPushTypeCountBean);
		}
		return result;
	}

	// 相当于mongo语句如下
	/*db.runCommand(
{
　　"group":
　　{
　　　　"ns":"LandPushTypeCount",
　　　　"key":{"areaId":true},
　　　　"initial":{codeCount:0, newCount:0, oldCount:0, errorCount:0},
　　　　"$reduce":function(doc,prev)
　　　　{
　　　　　 prev.codeCount += doc.codeCount;
          prev.newCount += doc.newCount;
          prev.oldCount += doc.oldCount;
          prev.errorCount += doc.errorCount;
　　　　},
　　　　"condition":{"todayDate":"2015-10-29", "areaId":{$in:["", "330100", "110000"]}}
　　}
}
);*/

	@Override
	public long findItemCountInVillage(String villageCode,Class clazz) {
		Query query=new Query();
		Criteria criteria=Criteria.where("XZC_CODE").is(villageCode);
		query.addCriteria(criteria);
		return mongoTemplate.count(query,clazz);  
	}



	@SuppressWarnings("unchecked")
	@Override
	public List findItemInfoInVillage(String villageCode, Class clazz) {
		Object result=redisTemplate.get("itemInfoInVillage_"+clazz+villageCode);
		if(ObjectUtils.isNull(result)){
			Query query=new Query();
			Criteria criteria=Criteria.where("XZC_CODE").is(villageCode);
			query.addCriteria(criteria);
			List list=mongoTemplate.find(query, clazz);
			redisTemplate.set("itemInfoInVillage_"+clazz+villageCode, list);
			return  list;
		}
		else{
			return (List)result;
		}
	
		
	}
	@Override
	public List findVillageByName(String villagaName) {
		Pattern pattern = Pattern.compile("^.*"+villagaName+".*$", Pattern.CASE_INSENSITIVE);
		Query query = Query.query(Criteria.where("SZ_XZC").regex(pattern));  
		List<RegVillage> regVillageList = mongoTemplate.find(query, RegVillage.class);
		return regVillageList;
	}
	@Override
	public RegVillage findVillageInfoByCode(String villageCode) {
		Query query=new Query();
		Criteria criteria=Criteria.where("CODE").is(villageCode);
		query.addCriteria(criteria);
		return mongoTemplate.findOne(query, RegVillage.class);
	}
	@Override
	public List findItemByParams(Map params, Class entityClass) {
		Query query = new Query();
		Iterator<Entry<String, Object>> it = params.entrySet().iterator();
		while(it.hasNext()){
			Entry<String, Object> obj = it.next();
			query.addCriteria(Criteria.where(obj.getKey()).is(obj.getValue()));	
		}
		List content = (List) mongoTemplate.find(query, entityClass);
		return content;
	}
	@Override
	public long findItemCountByParams(Map params, Class entityClass) {
		Query query = new Query();
		Iterator<Entry<String, Object>> it = params.entrySet().iterator();
		while(it.hasNext()){
			Entry<String, Object> obj = it.next();
			query.addCriteria(Criteria.where(obj.getKey()).is(obj.getValue()));	
		}
		long length = mongoTemplate.count(query, entityClass);
		return length;

	}
	@Override
	public double findPlantArea(String villageCode) {
		Object result=redisTemplate.get("plantArea_"+villageCode);
		if(ObjectUtils.isNull(result)){
			double mpjbxxMj=this.findItemArea("m_LY_MP_JBXX", "ZD_MJ", villageCode);//苗圃
			double gyjbxxMj=this.findItemArea("m_LY_GY_JBXX", "ZD_MJ", villageCode);//果园基地
			double hhjdjbxxMj=this.findItemArea("m_LY_HHJD_JBXX", "ZD_MJ", villageCode); //花卉基地
			double gggyjbxxMj=this.findItemArea("m_ZYDP_LY_GGGY_JBXX", "GY_MJ", villageCode); //观光果园
			double sanpinjbxxMj=this.findItemArea("m_ZZ_SPBASE", "ZD_MJ", villageCode);//三品基地
			double ssnyjbxxMj=this.findItemArea("m_ZZ_SSNY_JBXX", "GY_MJ", villageCode);//设施农业
			double zmj=mpjbxxMj+gyjbxxMj+hhjdjbxxMj+gggyjbxxMj+ssnyjbxxMj+sanpinjbxxMj;
			redisTemplate.set("plantArea_"+villageCode, zmj);
			return zmj;
		}
		else{
			return Double.parseDouble(result.toString());
		}
	}
	@Override
	public List<NfscJbxx> findNfscInfo(String villageCode) {
		Query query=new Query();
		Criteria criteria=Criteria.where("XZC_CODE").is(villageCode);
		query.addCriteria(criteria);
		List<NfscJbxx> list=mongoTemplate.find(query, NfscJbxx.class); //查询科技示范户基本信息
		for(int i=0;i<list.size();i++){
			NfscJbxx nfscJbxxinfo=list.get(i);
			Query querych=new Query();
			Criteria criteriach=Criteria.where("ID").is(Double.parseDouble((nfscJbxxinfo.getGlId().toString())));
			querych.addCriteria(criteriach);
			NfscKj nfscKj=mongoTemplate.findOne(querych, NfscKj.class);  //查询出的将负责人姓名存入基本信息中
			if(ObjectUtils.isNotNull(nfscKj))
				nfscJbxxinfo.setGsmc(nfscKj.getMc());
			
		}
		return  list;
	}

	@Override
	public double findAnimalArea(String villageCode) {
		Object result=redisTemplate.get("animalArea_"+villageCode);
		if(ObjectUtils.isNull(result)){
			double m_yz_danji_jbxxMj=this.findItemArea("m_YZ_DANJI_JBXX", "ZD_MJ", villageCode);//蛋鸡养殖场
			double m_yz_nainiu_jbxxMj=this.findItemArea("m_YZ_NAINIU_JBXX", "ZD_MJ", villageCode);//奶牛养殖场
			double m_yz_rouji_jbxxMj=this.findItemArea("m_YZ_ROUJI_JBXX", "ZD_MJ", villageCode);//肉鸡养殖场
			double m_yz_rouniu_jbxxMj=this.findItemArea("m_YZ_ROUNIU_JBXX", "ZD_MJ", villageCode);//肉牛养殖场
			double m_yz_shengzhu_jbxxMj=this.findItemArea("m_YZ_SHENGZHU_JBXX", "ZD_MJ", villageCode);//生猪养殖场
			double m_yz_tsyz_jbxxMj=this.findItemArea("m_YZ_TSYZ_JBXX", "ZD_MJ", villageCode);//特色养殖养殖场
			double m_yz_yang_jbxxMj=this.findItemArea("m_YZ_YANG_JBXX", "ZD_MJ", villageCode);//羊养殖场
			double m_yz_ya_jbxxMj=this.findItemArea("m_YZ_YA_JBXX", "ZD_MJ", villageCode);//鸭养殖场
			double zmj=m_yz_danji_jbxxMj+m_yz_nainiu_jbxxMj+m_yz_rouji_jbxxMj+m_yz_rouniu_jbxxMj+m_yz_shengzhu_jbxxMj
					+m_yz_tsyz_jbxxMj+m_yz_yang_jbxxMj+m_yz_ya_jbxxMj;
			redisTemplate.set("animalArea_"+villageCode, zmj);
			return zmj;
		}
		else{
			return Double.parseDouble(result.toString());
		}
	}

	/**
	 * @description 计算该指标的面积和
	 * @author huoge
	 * @date 2017年3月15日
	 * @param tableName 表名
	 * @param collName  需要计算的列名
	 * @param villageCode 村庄编码
	 * @return 面积和
	 */
	private double findItemArea(String tableName,String collName,String villageCode) {
		double sumArea = 0.0;  
		String reduce = "function(doc, prev){" +  
				"            prev.sumArea +=  Number(doc."+collName+");" +  
				"        }";  
		Query query = Query.query(Criteria.where("XZC_CODE").is(villageCode));  
		DBObject s=query.getQueryObject();  
		DBObject cond=new BasicDBObject("sumArea", sumArea);
		DBCollection dbcollection= mongoTemplate.getCollection(tableName);
		DBObject result =dbcollection.group(null, s,cond,reduce);  
		Map<String,BasicDBObject> map = result.toMap();  
		if(map.size() > 0){  
			BasicDBObject bdbo = map.get("0");  
			if(bdbo != null && bdbo.get("sumArea") != null)  
				sumArea = bdbo.getDouble("sumArea");  
		}  
		return sumArea; 
	}
	@Override
	public Map findForestArea(String villageCode) {
		double jy_zmj=this.findItemArea("m_ZYDP_LY_GYLC_JBXX", "JY_ZMJ", villageCode);//肉鸡养殖场
		double spl_mj=this.findItemArea("m_ZYDP_LY_GYLC_JBXX", "SPL_MJ", villageCode);//肉鸡养殖场
		double gyl_mj=this.findItemArea("m_ZYDP_LY_GYLC_JBXX", "GYL_MJ", villageCode);//肉鸡养殖场
		double zdgyl_mj=this.findItemArea("m_ZYDP_LY_GYLC_JBXX", "ZDGYL_MJ", villageCode);//肉鸡养殖场
		double lyyd_zmj=this.findItemArea("m_ZYDP_LY_GYLC_JBXX", "LYYD_ZMJ", villageCode);//肉鸡养殖场
		double yld_mj=this.findItemArea("m_ZYDP_LY_GYLC_JBXX", "YLD_MJ", villageCode);//肉鸡养殖场
		Map result=new HashMap<>();
		result.put("jy_zmj", jy_zmj);
		result.put("spl_mj", spl_mj);
		result.put("gyl_mj", gyl_mj);
		result.put("zdgyl_mj", zdgyl_mj);
		result.put("lyyd_zmj", lyyd_zmj);
		result.put("yld_mj", yld_mj);
		return result;
	}

	public String getXclyJj(String villageCode) {
		Query query = Query.query(Criteria.where("XZC_CODE").is(villageCode));
		List<XclyLyc> find = mongoTemplate.find(query, XclyLyc.class);
		String jianJie = null;
		if(find.size()>0){
		XclyLyc xclyLyc = find.get(0);
		 jianJie = xclyLyc.getJianJie();		 
		 
		}
		
		return  jianJie;
	}

	@Override
	public List<KjsfhJbxx> findKjsfhInfo(String villageCode) {
		Query query=new Query();
		Criteria criteria=Criteria.where("XZC_CODE").is(villageCode);
		query.addCriteria(criteria);
		List<KjsfhJbxx> list=mongoTemplate.find(query, KjsfhJbxx.class); //查询科技示范户基本信息
		for(int i=0;i<list.size();i++){
			KjsfhJbxx kjsfhinfo=list.get(i);
			Query querych=new Query();
			Criteria criteriach=Criteria.where("ID").is(Double.parseDouble((kjsfhinfo.getGlId().toString())));
			querych.addCriteria(criteriach);
			KjsfhKj kjsfhKj=mongoTemplate.findOne(querych, KjsfhKj.class);  //查询出的将负责人姓名存入基本信息中
			if(ObjectUtils.isNotNull(kjsfhKj))
			kjsfhinfo.setFzrName(kjsfhKj.getMc());
			
		}
		return  list;
	}



}
