package com.dm.app.datatopic.cunqing.sheshinongye.service.impl;


import java.net.UnknownHostException;




import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;
import com.dm.app.datatopic.cunqing.sheshinongye.service.InstallationAgricultural;
import com.mongodb.BasicDBObject;

@Service
public class InstallationAgriculturalImpl implements InstallationAgricultural {
	
	@Autowired
	  MongoTemplate mongotemplate;
	
	 
   public List<Map<String,String>> getNumbers() {
		String leixing[]={"日光温室","大棚","中小棚","连栋温室","其它"};
		String zhongzhi[]={"蔬菜",  "其它",   "花卉",  "果树"};
		String caizhi[]={"土墙",  "砖墙", "砖混",   "其它",};
		List<Map<String,String>> list=new ArrayList<Map<String,String>>();
	
		for(int i=0;i<leixing.length;i++){
			Map<String,String> map=new HashMap<String, String>();
			for(int j=0;j<zhongzhi.length;j++){
				BasicDBObject  key = new BasicDBObject();
				key.append("C_PLANTCRO", zhongzhi[j]);
				key.append("C_ESTABLIS", leixing[i]);
				Long qita=mongotemplate.getCollection("m_ZZ_SSNY_JBXX").count(key);
				map.put("zhongzhi"+zhongzhi[j], qita.toString());
				
			}
			for(int k=0;k<caizhi.length;k++){
				BasicDBObject  key = new BasicDBObject();
				key.append("C_WALLSTRU", caizhi[k]);
				key.append("C_ESTABLIS", leixing[i]);
				Long qita=mongotemplate.getCollection("m_ZZ_SSNY_JBXX").count(key);
				map.put("caizhi"+caizhi[k], qita.toString());
				
			}
			BasicDBObject  key = new BasicDBObject();
			key.append("C_ESTABLIS", leixing[i]);
			Long qita=mongotemplate.getCollection("m_ZZ_SSNY_JBXX").count(key);
			map.put("数目", qita.toString());
			map.put("种类", leixing[i]);
			list.add(map);
		}
		List<Map<String,String>> list1=new ArrayList<Map<String,String>>();
		for(int i=0;i<list.size();i++){
			StringBuffer sb=new StringBuffer();
			sb.append( list.get(i).get("数目")+ ",");
			sb.append( list.get(i).get("caizhi土墙")+ ",");
			sb.append( list.get(i).get("caizhi砖墙")+ ",");
			sb.append( list.get(i).get("caizhi砖混")+ ",");
			sb.append( list.get(i).get("caizhi其它")+ ",");
			sb.append( list.get(i).get("zhongzhi蔬菜")+ ",");
			sb.append( list.get(i).get("zhongzhi花卉")+ ",");
			sb.append( list.get(i).get("zhongzhi果树")+ ",");
			sb.append( list.get(i).get("zhongzhi其它"));
			Map<String,String> map=new HashMap<String, String>();
			map.put("value", sb.toString());
			map.put("name", list.get(i).get("种类"));
			list1.add(map);
		}
		return list1;
   }
		 
}
