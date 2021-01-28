package com.dm.atform.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import com.dm.atform.enumpack.NongQingResEnum;
import com.dm.atform.model.AtField;
import com.dm.atform.model.AtTable;
import com.dm.atform.model.AtTableSearch;
import com.dm.atform.service.MongoService;
import com.dm.atform.service.NongqingService;
import com.github.pagehelper.PageInfo;
@Service
public class NongqingServiceImpl implements NongqingService {
	@Autowired
	private MongoService mongo;

	@Autowired
	private MongoTemplate mongoTemplate;

	@Override
	public Object getResultFormMongo(String areaCode, String searchParam, String year, String searchType) {

		// 结果体。用Map作为VO
		HashMap<String, Object> resMap = new HashMap<>(16);
		// 农场数量
		// 搜索框搜索类型约束了公司名或者公司地址且搜索框不为空
		if ((searchType.equals(NongQingResEnum.SEARCH_TYPE_ENTERPRISE_NAME.code())
				|| searchType.equals(NongQingResEnum.SEARCH_TYPE_ENTERPRISE_ADDR.code()))
				&& StringUtils.isNotBlank(searchParam)) {
			switch (NongQingResEnum.matchOpCode(searchType)) {
			case SEARCH_TYPE_ENTERPRISE_NAME:
				// 企业名称 查询
				System.out.println("企业名称查询");
				break;
			default:
				break;
			}
			// 区域涉农企业数量
			AtTable tableSearch = new AtTable();
			tableSearch.setTableName("im_nqqyfb");
			Map<String, Object> searchMap = new HashMap<>();
			searchMap.put("area", areaCode);
			PageInfo<AtField> page = this.mongo.queryMulti(tableSearch, 0,
					9000, searchMap, null);
			List<AtField> resList = page.getList();
			System.out.println(Arrays.asList(resList));
			resMap.put(NongQingResEnum.FARM_TOTAL.code(), resList);
		}

		
		return resMap;
	}

}
