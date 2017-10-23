package com.dm.module.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.module.model.OrgPerson;
import com.dm.platform.model.Org;

public interface OrgPersonMapper {
    int deleteByPrimaryKey(String id);

    int insert(OrgPerson record);

    int insertSelective(OrgPerson record);

    OrgPerson selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(OrgPerson record);

    int updateByPrimaryKey(OrgPerson record);

	List<OrgPerson> selectByArgMap(Map map);

	List<Map> loadAllOrgs();

	List<Map> loadOrgs();
}