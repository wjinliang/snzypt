package com.dm.app.datatopic.jichushujuguanli.dao.imp;

import org.springframework.stereotype.Component;

import com.dm.app.common.dao.impl.MongoBaseDAOImpl;
import com.dm.app.datatopic.jichushujuguanli.dao.RegOuterCountyDAO;
import com.dm.app.datatopic.jichushujuguanli.model.RegOuterCounty;

@Component("regOuterCountyDAO")
public class RegOuterCountyDAOImpl extends MongoBaseDAOImpl<RegOuterCounty, String> implements
		RegOuterCountyDAO {

}
