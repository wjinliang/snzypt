package com.dm.app.datatopic.cunzhuangguhua.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.dm.app.datatopic.cunzhuangguhua.dao.CountryPicDAO;
import com.dm.app.datatopic.cunzhuangguhua.model.CountryPic;
import com.dm.app.datatopic.cunzhuangguhua.service.CountryPicService;

@Service
public class CountryPicServiceImpl implements CountryPicService {

	@Autowired
	private CountryPicDAO countryPicDao;
	@Override
	public List<CountryPic> findListByCunCode(String code) {
		Map searchMap = new HashMap<String,String>();
		searchMap.put("CODE", code);
		searchMap.put("exsit", "1");
		return countryPicDao.findAll(searchMap);
	}

	@Override
	public List<CountryPic> findListByCunName(String name) {
		Map searchMap = new HashMap<String,String>();
		searchMap.put("COUNTRYNAME", name);
		//searchMap.put("exsit", "1");
		return countryPicDao.findAll(searchMap);
	}

	@Override
	public CountryPic findById(Integer id) {
		Map searchMap = new HashMap<String,String>();
		searchMap.put("OBJECTID", id);
		List<CountryPic> list = countryPicDao.findAll(searchMap);
		if(list.size()>0) return list.get(0);
		return null;
	}

	@Override
	public List<CountryPic> findList(Query q,Integer pagesize, Integer pagenum
			) {
		com.dm.app.util.Page<CountryPic> page = countryPicDao.getPage(q,pagenum,pagesize);
		return page.getContent();
	}

}
