package com.dm.cms.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.cms.model.CmsVoteOption;

public interface CmsVoteOptionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CmsVoteOption record);

    int insertSelective(CmsVoteOption record);

    CmsVoteOption selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CmsVoteOption record);

    int updateByPrimaryKey(CmsVoteOption record);

	List<CmsVoteOption> findList(Map map);
}