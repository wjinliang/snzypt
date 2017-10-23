package com.dm.cms.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.cms.model.CmsInterview;

public interface CmsInterviewMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CmsInterview record);

    int insertSelective(CmsInterview record);

    CmsInterview selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CmsInterview record);

    int updateByPrimaryKey(CmsInterview record);

	List<CmsInterview> findList(Map map);
}