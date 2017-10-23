package com.dm.module.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.module.model.Microcobol;

public interface MicrocobolMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Microcobol record);

    int insertSelective(Microcobol record);

    Microcobol selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Microcobol record);

    int updateByPrimaryKey(Microcobol record);

	List<Microcobol> listByArg(Map map);
}