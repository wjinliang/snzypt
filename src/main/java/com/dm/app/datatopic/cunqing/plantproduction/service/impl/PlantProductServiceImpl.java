package com.dm.app.datatopic.cunqing.plantproduction.service.impl;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;



import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.dm.app.datatopic.cunqing.constants.ModelPath;
import com.dm.app.datatopic.cunqing.plantproduction.service.PlantProductService;
import com.dm.app.datatopic.model.MpJbxx;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
@Service
public class PlantProductServiceImpl implements PlantProductService {

	@Autowired
	private MongoTemplate mongoTemplate;
	

	
	public long findItemCountByClass(String clazz) {
		//用反射 根据权限类名获取类的属性
		Query query = new Query();
		//Criteria criteria=Criteria.where();
		return (Long) null;
		
	}

	/**
	 * 
	 * @date: 2017年2月20日
	 * @Author: lyh
	 * @param list
	 * @return 根据参数名获种植信息个数统计实现类
	 * @throws Exception 
	 */
	public List findAllCount(List<String> list)  {
	    // 创建返回的list集合类型
		List countList = new ArrayList<>();
		Iterator iter = list.iterator();
		while(iter.hasNext()){
			String aim = (String) iter.next();
			Class aimClass=null;
			try {
				aimClass = Class.forName(ModelPath.PATH_PREFIX+aim);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			Query query = new Query();
			
			long count = mongoTemplate.count(query, aimClass);
			countList.add(count);
			
			
		}
		
				
		return countList;
	}

	@Override
	public List getProductCounty(String year) {
		
		Query query = new Query();
		Criteria criteria = Criteria.where("ZD_MJ").gt(20).and("JS_ND").is("2007");
		query.sort();
		query.limit(10);
		query.addCriteria(criteria);
		org.springframework.data.domain.Sort sort = new org.springframework.data.domain.Sort(new org.springframework.data.domain.Sort.Order(Direction.DESC, "ZD_MJ"));
		//Sort sort=new Sort("ZD_MJ", Order.DESCENDING);
		query.with(sort);
		
		List<MpJbxx> aimList = mongoTemplate.find(query,MpJbxx.class);
		return aimList;
	}

	@Override
	public List getSumMj(String year) {
		List list = new ArrayList();
		BasicDBObject  key = new BasicDBObject();
		//key.put("TJ_ND", 1);
		//key.put("ZD_MJ",1);
		BasicDBObject  cond = new BasicDBObject();
		BasicDBObject initial = new BasicDBObject(); 
		initial.append("total", 0);
		Query query = new Query();
		String initDocument = "{total:0}";//初始化数据
		String reduceFunction="function (doc,out) {"
				+ " out.total+=doc.ZD_MJ;"
				+ "}";
		//
		BasicDBList groupLis=(BasicDBList) mongoTemplate.getCollection("m_LY_MP_JBXX").group(key, cond, initial, reduceFunction);
		for (Iterator it =groupLis.iterator() ; it.hasNext();) {
			list.add(it.next());
		}
		/*GroupBy groupBy =GroupBy.key("ZD_MJ").initialDocument(initDocument).reduceFunction(reduceFunction);
		GroupByResults<Map> totals = mongoTemplate.group(MpJbxx.class.getAnnotation(org.springframework.data.mongodb.core.mapping.Document.class).collection(), groupBy,Map.class);
		//GroupByResults<Map> counts = mongoTemplate.group(ZrbhqJbxx.class.getAnnotation(Document.class).collection(),groupBy, Map.class);
		for (Iterator<Map>total= totals.iterator(); total.hasNext();) {
			list.add(total.next());
			
		}*/
		return list;
	}
	public static List<Map<String,String>> getData() throws UnknownHostException{
		List<Map<String,String>> list= new ArrayList<Map<String,String>>();
		Map<String, String> map=null;
			map=new HashMap<String, String>();
			String number1=getNumber("m_YZ_YZC_JYQK", "m_YZ_YZC_JBXX");
			map.put("name", "普通养殖场");
			map.put("value", number1);
			list.add(map);
			map=new HashMap<String, String>();
			String number2=getNumber("m_YZ_DANJI_JYQK", "m_YZ_DANJI_JBXX");
			map.put("name", "蛋鸡养殖场");
			map.put("value", number2);
			list.add(map);
			map=new HashMap<String, String>();
			String number3=getNumber("m_YZ_NAINIU_JYQK", "m_YZ_NAINIU_JBXX");
			map.put("name", "奶牛养殖场");
			map.put("value", number3);
			list.add(map);
			map=new HashMap<String, String>();
			String number4=getNumber("m_YZ_ROUJI_JYQK", "m_YZ_ROUJI_JBXX");
			map.put("name", "肉鸡养殖场");
			map.put("value", number4);
			list.add(map);
			map=new HashMap<String, String>();
			String number5=getNumber("m_YZ_ROUNIU_JYQK", "m_YZ_ROUNIU_JBXX");
			map.put("name", "肉牛养殖场");
			map.put("value", number5);
			list.add(map);
			map=new HashMap<String, String>();
			String number6=getNumber("m_YZ_SHENGZHU_JYQK", "m_YZ_SHENGZHU_JBXX");
			map.put("name", "生猪养殖场");
			map.put("value", number6);
			list.add(map);
			map=new HashMap<String, String>();
			String number7=getNumber("m_YZ_TSYZ_JYQK", "m_YZ_TSYZ_JBXX");
			map.put("name", "特色养殖养殖场");
			map.put("value", number7);
			list.add(map);
			map=new HashMap<String, String>();
			String number8=getNumber("m_YZ_YANG_JYQK", "m_YZ_YANG_JBXX");
			map.put("name", "羊养殖场");
			map.put("value", number8);
			list.add(map);
			map=new HashMap<String, String>();
			String number9=getNumber("m_YZ_YA_JYQK", "m_YZ_YA_JBXX");
			map.put("name", "鸭养殖场");
			map.put("value", number9);
			list.add(map);
		
		return list;
	}
	public static String getNumber(String tableName1,String tableName2) throws UnknownHostException {
		Mongo mongo = new Mongo("localhost", 27017);
		DB db = mongo.getDB("datamanage");
		BasicDBObject  key = new BasicDBObject();
		BasicDBObject  cond = new BasicDBObject();
		BasicDBObject initial = new BasicDBObject(); 
		BasicDBObject initial1= new BasicDBObject(); 
		initial1.append("ZD_MJ", 0);
		initial.append("YZ_NCL1", 0);
		initial.append("YZ_NCL2", 0);
		initial.append("YZ_NCL3", 0);
		initial.append("N_YYE", 0);
		String reduceFunction="function (doc,out) {"
				+"var yzncl3=parseFloat(doc.YZ_NCL3);"
				+ "if(isNaN(yzncl3)){yzncl3=0;}"
				+ " out.YZ_NCL1+=doc.YZ_NCL1;"
				+ " out.YZ_NCL2+=doc.YZ_NCL2;"
				+ " out.YZ_NCL3+=yzncl3;"
				+ " out.N_YYE+=doc.N_YYE;"
				+ "}";
		String reduceFunction1="function (doc,out) {"
				+ " out.ZD_MJ+=doc.ZD_MJ;"
				+ "}";
		//
		BasicDBList groupLis1 = (BasicDBList) db.getCollection(tableName1)
				.group(key, cond, initial, reduceFunction);
		Long a = db.getCollection(tableName1).getCount();
		BasicDBList groupLis2 = (BasicDBList) db.getCollection(tableName2)
				.group(key, cond, initial1, reduceFunction1);
		JSONObject node = JSONObject.fromObject(groupLis1.toString()
				.replaceAll("\\[", "").replaceAll("\\]", ""));
		JSONObject node1 = JSONObject.fromObject(groupLis2.toString()
				.replaceAll("\\[", "").replaceAll("\\]", ""));
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		sb.append(a + ",");
		sb.append(node1.get("ZD_MJ") + ",");
		sb.append(node.get("YZ_NCL1") + ",");
		sb.append(node.get("YZ_NCL2") + ",");
		sb.append(node.get("YZ_NCL3") + ",");
		sb.append(node.get("N_YYE"));
		sb.append("]");
		return sb.toString();

	}
	public static void main(String[] args) throws UnknownHostException {
		getData();
	}

}
