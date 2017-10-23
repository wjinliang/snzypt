package com.dm.app.datatopic.jichushujuguanli.service;

import java.util.List;
import java.util.Map;

import com.dm.app.common.service.MongoBaseService;
import com.dm.app.datatopic.jichushujuguanli.model.RegCounty;

public interface RegCountyService extends MongoBaseService<RegCounty, String>{
	/**
	 * 统计该区县下有多少个村
	 * @return
	 */
	public List<Map> getCunTongji();

}
