package com.dm.app.datatopic.statistis.service;

import java.util.List;

/**
 * 
 *                  
 * @date: 2017年3月1日
 * @Author: lyh
 * @FileName: TjZynzwbzmjJclService.java
 * @Version: 1.0
 * @About: 主要农作物播种面积及产量  统计接口
 *
 */
public interface TjZynzwbzmjJclService {
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
