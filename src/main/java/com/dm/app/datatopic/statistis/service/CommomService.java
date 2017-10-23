package com.dm.app.datatopic.statistis.service;

import java.util.List;

/**
 * 
 *                  
 * @date: 2017年3月1日
 * @Author: lyh
 * @FileName: CommomService.java
 * @Version: 1.0
 * @About: 22个专题 统计接口 
 *
 */
public interface CommomService {
	 /**
     * @description  查询这个实体类中的所有值
     * @author lyh
     * @date 2017年2月27日
     * @param entityClass 要查询的类
     * @return
     */
	public List findAll(Class entityClass);
	/**
	 * 
	 * @date: 2017年3月16日
	 * @Author: lyh
	 * @param 个别条件
	 * @return
	 * 查询指定属性的产量
	 */
	public List findListByProperty(Class entityClass,String property,Object value);
	
	
}
