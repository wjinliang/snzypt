package com.dm.atform.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.atform.model.SysDataCount;

public interface SysDataCountMapper {
	
	long selectSumFullCount();
	
	long selectSumAddCount();
	
	Long selectFullCountByTableName(String tableName);
	
    List<SysDataCount> selectListByArg(Map map);
	
    int deleteByPrimaryKey(Long id);

    int insert(SysDataCount record);

    int insertSelective(SysDataCount record);

    SysDataCount selectByPrimaryKey(Long id);
    
    int updateByPrimaryKeySelective(SysDataCount record);

    int updateByPrimaryKey(SysDataCount record);
}