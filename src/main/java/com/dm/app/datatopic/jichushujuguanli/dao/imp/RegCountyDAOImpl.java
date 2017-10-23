package com.dm.app.datatopic.jichushujuguanli.dao.imp;

import org.springframework.stereotype.Component;

import com.dm.app.common.dao.impl.MongoBaseDAOImpl;
import com.dm.app.datatopic.jichushujuguanli.dao.RegCountyDAO;
import com.dm.app.datatopic.jichushujuguanli.model.RegCounty;

@Component("regCountyDAO")
public class RegCountyDAOImpl extends MongoBaseDAOImpl<RegCounty, String> implements
		RegCountyDAO {
}
