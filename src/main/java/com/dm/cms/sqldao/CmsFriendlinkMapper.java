package com.dm.cms.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.cms.model.CmsFriendlink;

public interface CmsFriendlinkMapper {
    int deleteByPrimaryKey(Long id);

    int insert(CmsFriendlink record);

    int insertSelective(CmsFriendlink record);

    CmsFriendlink selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(CmsFriendlink record);

    int updateByPrimaryKey(CmsFriendlink record);

	List<CmsFriendlink> selectByArgMap(Map map);
}