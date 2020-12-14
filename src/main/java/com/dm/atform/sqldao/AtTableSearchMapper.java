package com.dm.atform.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.atform.model.AtTableSearch;

public interface AtTableSearchMapper {
    int deleteByPrimaryKey(String id);

    int insert(AtTableSearch record);

    int insertSelective(AtTableSearch record);

    AtTableSearch selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(AtTableSearch record);

    int updateByPrimaryKey(AtTableSearch record);

	List<AtTableSearch> selectByArgMap(Map map);
	
}