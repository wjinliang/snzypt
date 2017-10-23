package com.dm.app.datatopic.cunqing.market.service;

import java.util.List;
import java.util.Map;

/**
 * 
 *                  
 * @date: 2017年2月24日
 * @Author: lyh
 * @FileName: NatureService.java
 * @Version: 1.0
 * @About: 市场资源(农夫市场)server层接口
 *
 */
public interface MarketService {
	/**
	 * 
	 * @date: 2017年2月24日
	 * @Author: lyh
	 * @param year
	 * @return 统计各个区县农夫市场个数
	 */
	public List<Map>  getMarketCount(String year);
	/**
	 * 
	 * @date: 2017年2月23日
	 * @Author: lyh
	 * @param year
	 * @return 返回农夫市场注册资本(万元) 排名前十的企业(村名)
	 */
	public List  getReCapital(String year);

}
