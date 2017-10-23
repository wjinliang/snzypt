package com.dm.cms.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.cms.model.CmsVote;

public interface CmsVoteMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CmsVote record);

    int insertSelective(CmsVote record);

    CmsVote selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CmsVote record);

    int updateByPrimaryKey(CmsVote record);

	List<CmsVote> findList(Map map);
}