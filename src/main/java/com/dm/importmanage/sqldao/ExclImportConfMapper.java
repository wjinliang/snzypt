package com.dm.importmanage.sqldao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dm.importmanage.model.ExclImportConf;

public interface ExclImportConfMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ExclImportConf record);

    int insertSelective(ExclImportConf record);

    ExclImportConf selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ExclImportConf record);

    int updateByPrimaryKey(ExclImportConf record);

	List<ExclImportConf> selectByArgMap(Map map);

	ExclImportConf selectByTableName(@Param("tableName") String tableName);
}