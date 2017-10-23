package com.dm.cms.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.cms.model.CmsQuestionnaires;

public interface CmsQuestionnairesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CmsQuestionnaires record);

    int insertSelective(CmsQuestionnaires record);

    CmsQuestionnaires selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CmsQuestionnaires record);

    int updateByPrimaryKey(CmsQuestionnaires record);

	List<CmsQuestionnaires> findByArgMap(Map map);
}