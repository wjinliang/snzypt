package com.dm.atform.sqldao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dm.atform.model.AtField;

public interface AtFieldMapper {
    int deleteByPrimaryKey(String id);

    int insert(AtField record);

    int insertSelective(AtField record);

    AtField selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(AtField record);

    int updateByPrimaryKey(AtField record);

	List<AtField> selectByArgMap(Map map);

	Integer findmaxSeq(@Param("tableId")String tableId);
	
	List<Map<String,String>> findByTableId(String tableId);
}