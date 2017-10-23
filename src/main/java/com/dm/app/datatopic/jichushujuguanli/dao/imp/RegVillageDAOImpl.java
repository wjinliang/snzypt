package com.dm.app.datatopic.jichushujuguanli.dao.imp;

import org.springframework.stereotype.Component;

import com.dm.app.common.dao.impl.MongoBaseDAOImpl;
import com.dm.app.datatopic.jichushujuguanli.dao.RegVillageDAO;
import com.dm.app.datatopic.jichushujuguanli.model.RegVillage;

@Component("regVillageDAO")
public class RegVillageDAOImpl extends MongoBaseDAOImpl<RegVillage, String> implements
		RegVillageDAO {

}
