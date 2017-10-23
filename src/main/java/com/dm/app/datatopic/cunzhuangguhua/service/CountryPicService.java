package com.dm.app.datatopic.cunzhuangguhua.service;

import java.util.List;

import org.springframework.data.mongodb.core.query.Query;

import com.dm.app.datatopic.cunzhuangguhua.model.CountryPic;

public interface CountryPicService {

	List<CountryPic> findListByCunCode(String code);

	List<CountryPic> findListByCunName(String name);
	
	List<CountryPic> findList(Query q,Integer pagesize,Integer pagenum);

	CountryPic findById(Integer imageId);

}
