package com.dm.app.datatopic.jichushujuguanli.dao.imp;

import org.springframework.stereotype.Component;

import com.dm.app.common.dao.impl.MongoBaseDAOImpl;
import com.dm.app.datatopic.jichushujuguanli.dao.RegTownDAO;
import com.dm.app.datatopic.jichushujuguanli.model.RegTown;

@Component("regTownDAO")
public class RegTownDAOImpl extends MongoBaseDAOImpl<RegTown, String> implements
		RegTownDAO {

}
