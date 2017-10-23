package com.dm.cms.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.cms.model.CmsInterviewRole;

public interface CmsInterviewRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CmsInterviewRole record);

    int insertSelective(CmsInterviewRole record);

    CmsInterviewRole selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CmsInterviewRole record);

    int updateByPrimaryKey(CmsInterviewRole record);

	List<CmsInterviewRole> findList(Map map);
}