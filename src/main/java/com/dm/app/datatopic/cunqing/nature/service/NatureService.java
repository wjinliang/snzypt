package com.dm.app.datatopic.cunqing.nature.service;

import java.util.List;
import java.util.Map;

/**
 * 
 *                  
 * @date: 2017年2月24日
 * @Author: lyh
 * @FileName: NatureService.java
 * @Version: 1.0
 * @About: 自然保护去server层接口
 *
 */
public interface NatureService {
	/**
	 * 
	 * @date: 2017年2月24日
	 * @Author: lyh
	 * @param year
	 * @return 统计各个区县个数
	 */
	public List<Map>  getNatureCount(String year);
	/**
	 * 
	 * @date: 2017年2月23日
	 * @Author: lyh
	 * @param year
	 * @return 返回自然保护区面积(公顷) 排名前十的企业(村名)
	 */
	public List  getNatureSpace(String year);

}
