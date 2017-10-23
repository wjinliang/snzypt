package com.dm.app.datatopic.cunqing.producelayout.service.impl;

import java.net.UnknownHostException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import com.dm.app.datatopic.cunqing.producelayout.service.ProduceLayout;
import com.dm.atform.util.RedisCache;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.CommandResult;
@Service
public class ProduceLayoutImpl implements ProduceLayout {
	
	@Autowired
	  MongoTemplate mongotemplate;

	@Autowired
	private RedisCache redis;
	private static final String key ="producelayout_service_impl";
	
	/**
	 * 获取畜牧水产的数据
	 */
	public   List<Map<String,String>> getData(){
		List<Map<String,String>> list= new ArrayList<Map<String,String>>();
		Map<String, String> map=null;
			map=new HashMap<String, String>();
			String number1;
			Object o = redis.get(key+"_getData");
			if(o!=null){
				return (List<Map<String,String>>)o;
			}
			try {
				number1 = getNumber("m_YZ_YZC_JYQK", "m_YZ_YZC_JBXX");
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
				String number8=getNumber("m_YZ_YANG_JYQK", "m_YZ_YANG_JBXX");
				map.put("name", "羊养殖场");
				map.put("value", number8);
				list.add(map);
				map=new HashMap<String, String>();
				String number9=getNumber("m_YZ_YA_JYQK", "m_YZ_YA_JBXX");
				map.put("name", "鸭养殖场");
				map.put("value", number9);
				list.add(map);
				map=new HashMap<String, String>();
				String number7=getNumber("m_YZ_TSYZ_JYQK", "m_YZ_TSYZ_JBXX");
				map.put("name", "特色养殖养殖场");
				map.put("value", number7);
				list.add(map);
			} catch (UnknownHostException e) {
				e.printStackTrace();
			}
			
			list.add(map);
		redis.set(key+"_getData", list);
		return list;
	}
	public   String getNumber(String tableName1,String tableName2) throws UnknownHostException {
		/*Mongo mongo = new Mongo("localhost", 27017);
		DB db = mongo.getDB("datamanage");
		*/
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
		BasicDBList groupLis1 = (BasicDBList) mongotemplate.getCollection(tableName1)
				.group(key, cond, initial, reduceFunction);
		Long a = mongotemplate.getCollection(tableName1).getCount();
		BasicDBList groupLis2 = (BasicDBList) mongotemplate.getCollection(tableName2)
				.group(key, cond, initial1, reduceFunction1);
		JSONObject node = JSONObject.fromObject(groupLis1.toString()
				.replaceAll("\\[", "").replaceAll("\\]", ""));
		JSONObject node1 = JSONObject.fromObject(groupLis2.toString()
				.replaceAll("\\[", "").replaceAll("\\]", ""));
		StringBuffer sb = new StringBuffer();
		DecimalFormat decimalFormat = new DecimalFormat("###0.00");
		sb.append(a + ",");
		sb.append(decimalFormat.format(node1.get("ZD_MJ")) + ",");
		sb.append(decimalFormat.format(node.get("YZ_NCL1")) + ",");
		sb.append(decimalFormat.format(node.get("YZ_NCL2") )+ ",");
		sb.append(decimalFormat.format(node.get("YZ_NCL3") )+ ",");
		sb.append(decimalFormat.format(node.get("N_YYE")));
		return sb.toString();

	}
/**
 * 获取大田农业的数据
 * @return
 */
	public   List<Map<String,String>> getPlantData(){
		List<Map<String,String>> list= new ArrayList<Map<String,String>>();
		Map<String, String> map=null;
		Object o = redis.get(key+"_getPlantData");
		if(o!=null){
			return (List<Map<String,String>>)o;
		}
		try {
			map=getPlantMap("m_LY_MP_ZZXX","SZ_MC");
			list.add(map);
			map=getPlantMap("m_LY_GY_ZZQK","ZZ_PZ");
			list.add(map);
			map=getPlantMap("m_LY_HHJD_ZZXX","HZ_MC");
			list.add(map);
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		redis.set(key+"_getPlantData",list);
		return list;
	}
	
   public   Map<String,String> getPlantMap(String tableName,String columnName) throws UnknownHostException {
		/*Mongo mongo = new Mongo("localhost", 27017);
		DB db = mongo.getDB("datamanage");*/
		Map<String ,String>map=new HashMap<String,String>();
		/*(new BasicDBObject("distinct",tableName).append("key",columnName));*/
		String jsonSql="{distinct:'"+tableName+"', key:'"+columnName+"'}";
		CommandResult result = mongotemplate.executeCommand(jsonSql);
		List list=(List)result.get("values");
		BasicDBObject  key = new BasicDBObject();
		BasicDBObject  cond = new BasicDBObject();
		BasicDBObject initial = new BasicDBObject(); 
		initial.append("ZZ_MJ", 0);
		initial.append("N_CL", 0);
		String reduceFunction="function (doc,out) {"
				+"var ncl=parseFloat(doc.N_CL);"
				+ "if(isNaN(ncl)){ncl=0;}"
				+ " out.ZZ_MJ+=doc.ZZ_MJ;"
				+ " out.N_CL+=ncl;"
				+ "}";
		BasicDBList groupLis1 = (BasicDBList) mongotemplate.getCollection(tableName)
				.group(key, cond, initial, reduceFunction);
		JSONObject node = JSONObject.fromObject(groupLis1.toString()
				.replaceAll("\\[", "").replaceAll("\\]", ""));
		DecimalFormat decimalFormat = new DecimalFormat("###0.00");
		map.put("zzmj",decimalFormat.format(node.get("ZZ_MJ")));
		map.put("zzcl", decimalFormat.format(node.get("N_CL")));
		map.put("zwzl",String.valueOf(list.size()));
		return map;
}
}
