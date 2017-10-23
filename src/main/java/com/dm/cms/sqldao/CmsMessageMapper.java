package com.dm.cms.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.cms.model.CmsMessage;

public interface CmsMessageMapper {
    int deleteByPrimaryKey(String id);

    int insert(CmsMessage record);

    int insertSelective(CmsMessage record);

    CmsMessage selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(CmsMessage record);

    int updateByPrimaryKey(CmsMessage record);

	List<CmsMessage> selectByArgMap(Map map);
}