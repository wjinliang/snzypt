package com.dm.app.datatopic.jichushujuguanli.dao.imp;
import com.dm.app.common.dao.impl.MongoBaseDAOImpl;

import org.springframework.stereotype.Component;

import com.dm.app.datatopic.jichushujuguanli.dao.BaseInfoDAO;
import com.dm.app.datatopic.jichushujuguanli.model.BaseInfo;

@Component
public class BaseInfoDAOImpl extends MongoBaseDAOImpl<BaseInfo, String> implements
		BaseInfoDAO {

}
