package com.dm.websurvey.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.websurvey.model.Leader;

public interface LeaderMapper {
    int deleteByPrimaryKey(String id);

    int insert(Leader record);

    int insertSelective(Leader record);

    Leader selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Leader record);

    int updateByPrimaryKey(Leader record);
    
    List<Leader> selectRecordByArgMap(Map map);
}