package com.dm.importmanage.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.importmanage.model.ExclImportLog;

public interface ExclImportLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ExclImportLog record);

    int insertSelective(ExclImportLog record);

    ExclImportLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ExclImportLog record);

    int updateByPrimaryKey(ExclImportLog record);

	List<ExclImportLog> selectByArgMap(Map map);
}