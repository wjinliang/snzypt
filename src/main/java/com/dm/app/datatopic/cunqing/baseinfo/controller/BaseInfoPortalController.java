package com.dm.app.datatopic.cunqing.baseinfo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.cunqing.baseinfo.service.RegVillageInfoService;
import com.dm.app.datatopic.cunqing.plantproduction.service.PlantProductService;
import com.dm.app.util.judge.ObjectUtils;
import com.dm.atform.util.RedisCache;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;

/**
 * @description 基本信息菜单功能
 * @author huoge
 */
@Controller
@RequestMapping("portal")
public class BaseInfoPortalController {
	@Autowired
	private RegVillageInfoService regVillageInfoService;
	@Autowired
	PlantProductService pps;// 种植生产业务层接口
	@Autowired
	private RedisCache redisCache;
	@Autowired
	private CmsSiteService siteService;
	private final String DATATOPICINDEX_PAGE = "template/sn_topicindex";
	private final String redisKey = "cunqing_";

	/**
	 * @description 查询区各县下乡村的数量
	 * @author huoge
	 * @date 2017年2月16日
	 * @return
	 */
	@RequestMapping("ajax/findvillagecountundercounty")
	@ResponseBody
	public Map findVillageCountUnderCounty(HttpServletRequest request) {
//		long s1 = System.currentTimeMillis();
		String key = redisKey + "findvillagecountundercounty";
		Map map = (Map) redisCache.get(key);
//		long s2 = System.currentTimeMillis();
//		long s3=0l;
//		long s4=0l;
//		long s5=0l;
//		long s6=0l;
//		long s7=0l;
		if (map == null) {
			map = new HashMap();
//			 s3 = System.currentTimeMillis();
			List<Map> result = regVillageInfoService.getVillageCountUnderCounty();
//			 s4 = System.currentTimeMillis();
			StringBuilder legendData = new StringBuilder("[");
			StringBuilder seriesData = new StringBuilder("[");
			if (ObjectUtils.isNotNull(result)) {
				for (Map m : result) {
					legendData.append("{");
					legendData.append("name:'" + m.get("SZ_QX")
							+ "',icon:'circle'");
					legendData.append("},");

					seriesData.append("{");
					seriesData.append("name:'" + m.get("SZ_QX") + "',value:"
							+ m.get("count"));
					seriesData.append("},");
				}
				legendData = new StringBuilder(legendData.toString().substring(
						0, legendData.length() - 1)).append("]");
				seriesData = new StringBuilder(seriesData.toString().substring(
						0, seriesData.length() - 1)).append("]");
			}
//			 s5 = System.currentTimeMillis();
			map.put("legendData", legendData);
			map.put("seriesData", seriesData);
			redisCache.set(key, map);
//			 s6 = System.currentTimeMillis();
		}
//		System.out.println("redis获取数据"+(s2-s1));
//		System.out.println("service返回数据"+(s4-s3));
//		System.out.println("controller处理数据"+(s5-s4));
//		System.out.println("redisSet"+(s6-s5));
		return map;
	}

	/**
	 * @description 初始化并跳转到统计页面
	 * @author huoge
	 * @date 2017年2月19日
	 * @param request
	 * @return
	 */
	@RequestMapping("initVillageCountPage")
	public String initVillageCountPage(HttpServletRequest request) {
		CmsSite site = this.siteService.findOneById(1);
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_base";
	}

	/**
	 * @description 初始化并跳转到统计页面
	 * @author huoge
	 * @date 2017年2月19日
	 * @param request
	 * @return
	 */
	@RequestMapping("initDatatopicPage")
	public String initDatatopicPage(HttpServletRequest request) {
		CmsSite site = this.siteService.findOneById(1);
//		String key = redisKey + "getSumMj_null";
//		Map m = (Map) redisCache.get(key);
//		if (m == null) {
//			Integer villageCount = 0;
//			Integer snqiyeCount = 0;
//			Integer lvyouyuquCount = 0;
//			Integer lvyouhuCount = 0;
//			String mianji = "0.00";
//			m = new HashMap();
//			List sumMj = pps.getSumMj(null);
//			DecimalFormat df = new DecimalFormat("######0.00");
//			Double total = 0.0;
//			if (sumMj.size() > 0) {
//				Map aim = (Map) sumMj.get(0);
//				total = (Double) aim.get("total");
//			}
//			mianji = df.format(total);
//			villageCount = this.regVillageInfoService.findAllVillageCount();
//			snqiyeCount = this.regVillageInfoService.findAllShenongQiyeCount();
//			lvyouhuCount = this.regVillageInfoService.findAlllvyouhu();
//			lvyouyuquCount = this.regVillageInfoService.findAlllvyouyuanqu();
//			m.put("mianji", mianji);
//			m.put("villageCount", villageCount);
//			m.put("snqiyeCount", snqiyeCount);
//			m.put("lvyouhuCount", lvyouhuCount);
//			m.put("lvyouyuquCount", lvyouyuquCount);
//			redisCache.set(key, m);
//		}
//		request.setAttribute("mianji", m.get("mianji"));
//		request.setAttribute("villageCount", m.get("villageCount"));
//		request.setAttribute("snqiyeCount", m.get("snqiyeCount"));
//		request.setAttribute("lvyouhuCount", m.get("lvyouhuCount"));
//		request.setAttribute("lvyouyuquCount", m.get("lvyouyuquCount"));
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return DATATOPICINDEX_PAGE;
	}

}
