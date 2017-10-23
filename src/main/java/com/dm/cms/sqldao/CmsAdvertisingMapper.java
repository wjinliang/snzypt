package com.dm.cms.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.cms.model.CmsAdvertising;

public interface CmsAdvertisingMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CmsAdvertising record);

    int insertSelective(CmsAdvertising record);

    CmsAdvertising selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CmsAdvertising record);

    int updateByPrimaryKey(CmsAdvertising record);

	List<CmsAdvertising> findByArgMap(Map map);

	List<CmsAdvertising> findByArgMapForProtal(Map map);
}