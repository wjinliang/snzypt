package com.dm.app.datatopic.cunqing.cunqinginfo.service.impl;

import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.dm.app.datatopic.cunqing.cunqinginfo.service.ZoneService;
import com.dm.app.datatopic.model.RegCounty;
import com.dm.app.datatopic.model.RegTown;
import com.dm.app.datatopic.model.RegVillage;
@Service
public class ZoneServiceImpl implements ZoneService{
	
	@Autowired
	private MongoTemplate mongoTemplate;
	@Override
	public List<RegCounty> findAllCounty() {
		Query query=new Query();
		Criteria criteria=Criteria.where("SZ_QX").ne("市区");
		query.addCriteria(criteria);
		List<RegCounty>  countys=mongoTemplate.find(query, RegCounty.class);
		Map<Integer, RegCounty> allCountys = new TreeMap<Integer ,RegCounty>(
                new Comparator<Integer>() {
                    public int compare(Integer obj1, Integer obj2) {
                        // 降排序
                        return obj1.compareTo(obj2);
                    }
                });
		//朝阳区、海淀区、丰台区、石景山区、门头沟区、房山区、通州区、顺义区、大兴区、昌平区、平谷区、怀柔区、密云区、延庆区
		for(int i=0;i<countys.size();i++){
			RegCounty county=countys.get(i);
				if(county.getSzQx().equals("朝阳区")){
					allCountys.put(1, county);
				}
				if(county.getSzQx().equals("海淀区")){
					allCountys.put(2, county);
				}
				if(county.getSzQx().equals("丰台区")){
					allCountys.put(3, county);
				}
				if(county.getSzQx().equals("石景山区")){
					allCountys.put(4, county);
				}
				if(county.getSzQx().equals("门头沟区")){
					allCountys.put(5, county);
				}
				if(county.getSzQx().equals("房山区")){
					allCountys.put(6, county);
				}
				if(county.getSzQx().equals("通州区")){
					allCountys.put(7, county);
				}
				if(county.getSzQx().equals("顺义区")){
					allCountys.put(8, county);
				}
				if(county.getSzQx().equals("大兴区")){
					allCountys.put(9, county);
				}
				if(county.getSzQx().equals("昌平区")){
					allCountys.put(10, county);
				}
				if(county.getSzQx().equals("平谷区")){
					allCountys.put(11, county);
				}
				if(county.getSzQx().equals("怀柔区")){
					allCountys.put(12, county);
				}
				if(county.getSzQx().equals("密云区")||county.getSzQx().equals("密云县")){
					county.setMc("密云区");
					allCountys.put(13, county);
				}
				if(county.getSzQx().equals("延庆区")||county.getSzQx().equals("延庆县")){
					county.setMc("延庆区");
					allCountys.put(14, county);
				}
		}
		countys.clear();
        Set<Integer> keySet = allCountys.keySet();
        Iterator<Integer> iter = keySet.iterator();
        while (iter.hasNext()) {
        	Integer key = iter.next();
            countys.add(allCountys.get(key));
        }
		return countys;

	}

	@Override
	public List<RegTown> findTownByQxCode(String qxCode) {
		Query query=new Query();
		Criteria criteria=Criteria.where("SZ_QX_CODE").is(qxCode);
		query.addCriteria(criteria);
		return mongoTemplate.find(query, RegTown.class);
	}

	@Override
	public List<RegVillage> findVillageByXzCode(String xzCode) {
		Query query=new Query();
		Criteria criteria=Criteria.where("SZ_XZ_CODE").is(xzCode);
		query.addCriteria(criteria);
		return mongoTemplate.find(query, RegVillage.class);
	}

}
