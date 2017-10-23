package com.dm.app.datatopic.cunqing.science.service;

import java.util.List;
import java.util.Map;

/**
 * 
 *                  
 * @date: 2017年2月24日
 * @Author: lyh
 * @FileName: NatureService.java
 * @Version: 1.0
 * @About:  科技示范户 server层接口
 *
 */
public interface KjsfhService {
	/**
	 * 
	 * @date: 2017年2月24日
	 * @Author: lyh
	 * @param year
	 * @return 统计各个区县科技示范户个数
	 */
	public List<Map>  getSciencetCount(String year);
	/**
	 * 
	 * @date: 2017年2月23日
	 * @Author: lyh
	 * @param year
	 * @return 返回科技示范户种植面积(亩)排名前十的企业(村名)
	 */
	public List  getZzMji(String year);
	/**
	 * 
	 * @date: 2017年2月25日
	 * @Author: lyh
	 * @param year
	 * @return 各作物的种植面积
	 */
	public List<Map> getZzZw(String year);
 
}
