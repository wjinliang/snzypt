package com.dm.questionsurvey.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.questionsurvey.model.FeedBack;

public interface FeedBackMapper {

    int insert(FeedBack record);

    int insertSelective(FeedBack record);
    
    List<FeedBack> selectByArgMap(Map args);
    
    int deleteByPrimaryKey(String id);
    
    FeedBack selectByPrimaryKey(String id);

}