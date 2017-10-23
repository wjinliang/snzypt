package com.dm.app.datatopic.cunqing.cunqinginfo.service;

import java.util.List;
import java.util.Map;

import com.dm.app.datatopic.cunqing.cunqinginfo.model.TbBaseInfo;


public interface TbBaseInfoService {

	/**
	 * @description 通过条件查询集合结果，结果被Map封装成伪实体类.[多条件查询]
	 * @author huoge
	 * @date 2017年3月18日
	 * @param tableName 集合表名
	 * @param condition  条件
	 * @return 返回结果集
	 */
	public Map<String,Object> findByCondition(String tableName,Map<String,Object> condition);
	/**
	 * @description 通过条件查询集合结果，结果被Map封装成伪实体类.[单条件查询]
	 * @author huoge
	 * @date 2017年3月18日
	 * @param tableName 集合表名
	 * @param condition  条件
	 * @return 返回结果集
	 */
	public Map<String,Object> findByCondition(String tableName,String conditionKey,Object conditionValue);
	/**
	 * @description 查询该村实用人才数量
	 * @author huoge
	 * @date 2017年3月18日
	 * @param villageCode
	 * @return
	 */
	public long findTbBaseInfoCountByVillageCode(String villageCode);
	/**
	 * @description 查询该村实用人才具体信息
	 * @author huoge
	 * @date 2017年3月18日
	 * @param villageCode
	 * @return
	 */
	public List<TbBaseInfo> findTbBaseInfoByVillageCode(String villageCode);
}
