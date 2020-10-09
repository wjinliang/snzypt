package com.dm.atform.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.atform.model.AtDatasourceApply;

public interface AtDatasourceApplyMapper {
    int deleteByPrimaryKey(String id);

    int insert(AtDatasourceApply record);

    AtDatasourceApply selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(AtDatasourceApply record);

	List<AtDatasourceApply> selectByArgMap(Map map);

}