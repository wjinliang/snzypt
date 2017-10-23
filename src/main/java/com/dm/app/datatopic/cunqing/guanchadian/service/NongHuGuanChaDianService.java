package com.dm.app.datatopic.cunqing.guanchadian.service;

import java.util.List;
import java.util.Map;
/**
 * 
 *                  
 * @date: 2017年3月28日
 * @Author: lyh
 * @FileName: CunZhuangGuanChaDianService.java
 * @Version: 1.0
 * @About: 
 *
 */
public interface NongHuGuanChaDianService {
	/**
	 * 统计该区县下有多少个观察点
	 * @param county 要查询的区县()
	 * @return 
	 */
	public List getGuanChaDianCountUnderNh();

}
