package com.dm.app.datatopic.cunqing.plantproduction.service;

import java.util.List;
import java.util.Map;

/**
 * 
 *                  
 * @date: 2017年2月18日
 * @Author:lyh
 * @FileName: PlantProductService.java
 * @Version: 1.0
 * @About: 农村种植生产基本情况接口
 *
 */
public interface PlantProductService  {
	/**
	 * 
	 * @date: 2017年2月18日
	 * @Author: lyh
	 * @param clazz
	 * @return 根据类统计个数
	 * 
	 */
	public long findItemCountByClass(String clazz);
	/**
	 * 
	 * @date: 2017年2月20日
	 * @Author: lyh
	 * @param list
	 * @return 根据参数名获种植信息个数统计接口
	 */
	public List findAllCount(List<String> list);
	/**
	 * 
	 * @date: 2017年2月23日
	 * @Author: lyh
	 * @param year
	 * @return 返回果园经营情况 排名前十的企业(村名)
	 */
	public List  getProductCounty(String year);
	/**
	 * 
	 * @date: 2017年2月27日
	 * @Author: lyh
	 * @param year
	 * @return 统计苗圃的种植面积
	 */
	public  List getSumMj(String year);
	

}
