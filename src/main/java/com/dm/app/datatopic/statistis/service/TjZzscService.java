package com.dm.app.datatopic.statistis.service;

import java.util.List;
/**
 * @description  通过条件查询农村基本情况的某一列的所有值
 * @author huoge
 * @date 2017年2月27日
 * @param entityClass 要查询的类
 * @return
 */
public interface TjZzscService {
	 /**
	  * 
	  * @date: 2017年2月28日
	  * @Author: lyh
	  * @param entityClass
	  * @return
	  * 查询所有种植生产的信息
	  */
    public List findAll(Class entityClass);
}
