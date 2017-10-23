package com.dm.cms.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.cms.model.CmsInterviewAbout;

public interface CmsInterviewAboutMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CmsInterviewAbout record);

    int insertSelective(CmsInterviewAbout record);

    CmsInterviewAbout selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CmsInterviewAbout record);

    int updateByPrimaryKey(CmsInterviewAbout record);

	List<CmsInterviewAbout> findList(Map map);
}