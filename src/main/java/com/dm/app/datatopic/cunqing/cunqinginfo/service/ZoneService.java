package com.dm.app.datatopic.cunqing.cunqinginfo.service;

import java.util.List;

import com.dm.app.datatopic.model.RegCounty;
import com.dm.app.datatopic.model.RegTown;
import com.dm.app.datatopic.model.RegVillage;
/**
 * @description 地区查询
 * @author huoge
 */
public interface ZoneService {
	/**
	 * @description 查询所有的区县
	 * @author huoge
	 * @date 2017年2月21日
	 * @return 所有区县的集合
	 */
	public List<RegCounty> findAllCounty();
	/**
	 * @description  根据区县唯一编码查询此区县下的所有乡镇 
	 * @author huoge
	 * @date 2017年2月21日
	 * @param qxCode 区县编码
	 * @return
	 */
	public List<RegTown> findTownByQxCode(String qxCode);
	/**
	 * @description 根据乡镇唯一编码查询此乡镇下的所有村子
	 * @author huoge
	 * @date 2017年2月21日
	 * @param xzCode 乡镇编码
	 * @return
	 */
	public List<RegVillage> findVillageByXzCode(String xzCode);
	
}
