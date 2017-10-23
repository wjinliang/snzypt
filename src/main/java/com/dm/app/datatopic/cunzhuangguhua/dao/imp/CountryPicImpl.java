package com.dm.app.datatopic.cunzhuangguhua.dao.imp;

import org.springframework.stereotype.Component;

import com.dm.app.common.dao.impl.MongoBaseDAOImpl;
import com.dm.app.datatopic.cunzhuangguhua.dao.CountryPicDAO;
import com.dm.app.datatopic.cunzhuangguhua.model.CountryPic;

@Component
public class CountryPicImpl extends MongoBaseDAOImpl<CountryPic, String> implements
CountryPicDAO {

}
