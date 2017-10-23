package com.dm.cms.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.cms.model.CmsInterviewQuestions;

public interface CmsInterviewQuestionsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CmsInterviewQuestions record);

    int insertSelective(CmsInterviewQuestions record);

    CmsInterviewQuestions selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CmsInterviewQuestions record);

    int updateByPrimaryKey(CmsInterviewQuestions record);

	List<CmsInterviewQuestions> findList(Map map);

}