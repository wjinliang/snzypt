package com.dm.search.sqldao;

import com.dm.search.model.SearchConfig;

public interface SearchConfigMapper {
    int deleteByPrimaryKey(String id);

    int insert(SearchConfig record);

    int insertSelective(SearchConfig record);

    SearchConfig selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SearchConfig record);

    int updateByPrimaryKey(SearchConfig record);
}