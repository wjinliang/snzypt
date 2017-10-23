package com.dm.cms.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.cms.model.CmsInterviewImage;

public interface CmsInterviewImageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CmsInterviewImage record);

    int insertSelective(CmsInterviewImage record);

    CmsInterviewImage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CmsInterviewImage record);

    int updateByPrimaryKey(CmsInterviewImage record);

	List<CmsInterviewImage> findList(Map map);
}