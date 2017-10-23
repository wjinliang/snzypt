package com.dm.app.datatopic.cunqing.cunqinginfo.service;

import java.util.List;
import java.util.Map;

import com.dm.app.datatopic.model.KjsfhJbxx;
import com.dm.app.datatopic.model.NfscJbxx;
import com.dm.app.datatopic.model.RegVillage;

public interface CunqingService {
	/**
	 * @description 查询在村子中的各个项目的数量
	 * @author huoge
	 * @date 2017年2月16日
	 * @param villageCode 村子唯一编码
	 * @param clazz 表对应的实体类
	 * @return
	 */
	public long findItemCountInVillage(String villageCode,Class clazz);
	/**
	 * @description 查询在村子中的指定项目的详情
	 * @author huoge
	 * @date 2017年2月16日
	 * @param villageCode 村子唯一编码
	 * @param clazz 表对应的实体类
	 * @return
	 */
	public List findItemInfoInVillage(String villageCode,Class clazz);
	/**
	 * @description 通过村名模糊查询该村基本信息
	 * @author huoge
	 * @date 2017年2月16日
	 * @param villagaName 村名
	 * @return 复合模糊查询条件的村庄
	 */
	public List findVillageByName(String villagaName);
	/**
	 * @description 查询村子基本信息
	 * @author huoge
	 * @date 2017年2月19日
	 * @param villageCode
	 * @return
	 */
	public RegVillage findVillageInfoByCode(String villageCode);
	/**
	 * @description 通过参数条件查询结果集
	 * @author huoge
	 * @date 2017年3月7日
	 * @param params 参数条件
	 * @return 符合条件的结果集
	 */
	public List findItemByParams(Map params,Class entityClass);
	/**
	 * @description 通过参数条件查询结果集
	 * @author huoge
	 * @date 2017年3月7日
	 * @param params 参数条件
	 * @return 符合条件的结果集
	 */
	public long findItemCountByParams(Map params,Class entityClass);
	/**
	 * @description 统计种植面积和
	 * @author huoge
	 * @date 2017年3月13日
	 * @param villageCode
	 * @return
	 */
	public double findPlantArea(String villageCode);
	/**
	 * @description 统计养殖面积和
	 * @author huoge
	 * @date 2017年3月13日
	 * @param villageCode
	 * @return
	 */
	public double findAnimalArea(String villageCode);
	/**
	 * @description 查询林业
	 * @author huoge
	 * @date 2017年3月15日
	 * @param villageCode
	 * @return
	 */
	public Map findForestArea(String villageCode);
	/**
	 * 
	 * @date: 2017年3月24日
	 * @param villageCode
	 * @return 根据村编码获得民俗旅游村简介
	 */
	public String getXclyJj(String villageCode);
//表关联设置姓名
	List<KjsfhJbxx> findKjsfhInfo(String villageCode);
	//农副市场
	List<NfscJbxx> findNfscInfo(String villageCode);
	
	
}
