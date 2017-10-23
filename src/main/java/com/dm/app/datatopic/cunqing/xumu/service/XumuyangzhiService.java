package com.dm.app.datatopic.cunqing.xumu.service;

import java.util.List;
import java.util.Map;

public interface XumuyangzhiService {
	/**
	 * 统计该各区县的该养殖类数量
	 * @param county 要查询的养殖类项目
	 * @return 
	 */
	public List<Map> findDanjiJbxxCountUnderCounty();
	
	public List<Map> findDanjiJbxxZDMJUnderCounty();
	
	//奶牛养殖场数量
	public List<Map> findNaiNiuJbxxCountUnderCounty();
	
	
	//奶牛养殖场面积前十
	public List<Map> findNaiNiuJbxxZDMJUnderCounty();
	
}
