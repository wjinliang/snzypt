package com.dm.app.datatopic.cunqing.baseinfo.service;

import java.util.List;
import java.util.Map;

import com.dm.app.common.service.MongoBaseService;
import com.dm.app.datatopic.model.RegVillage;
public interface RegVillageInfoService extends MongoBaseService<RegVillage, String> {
	/**
	 * 统计该区县下有多少个村
	 * @param county 要查询的区县
	 * @return 
	 */
	public List<Map>  getVillageCountUnderCounty();
	/**
	 * @description  查询北京市的所有农村数量
	 * @author huoge
	 * @date 2017年2月25日
	 * @return
	 */
	public Integer findAllVillageCount();
	
	public List<RegVillage> getAllVillage();
	/**
	 * @description 查询全部涉农企业数量
	 * @author huoge
	 * @date 2017年2月25日
	 * @return
	 */
	public Integer findAllShenongQiyeCount();
	/**
	 * @description 查询农业旅游户数量
	 * @return
	 */
	public Integer findAlllvyouhu();
	/**
	 * @description 查询农业旅游园区数量
	 * @return
	 */
	public Integer findAlllvyouyuanqu();
	
}
