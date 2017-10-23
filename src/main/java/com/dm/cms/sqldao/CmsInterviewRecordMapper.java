package com.dm.cms.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.cms.model.CmsInterviewRecord;

public interface CmsInterviewRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CmsInterviewRecord record);

    int insertSelective(CmsInterviewRecord record);

    CmsInterviewRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CmsInterviewRecord record);

    int updateByPrimaryKey(CmsInterviewRecord record);

	List<CmsInterviewRecord> findList(Map map);
}