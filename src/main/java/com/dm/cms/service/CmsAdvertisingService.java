package com.dm.cms.service;

import java.util.Map;

import com.dm.cms.model.CmsAdvertising;
import com.github.pagehelper.PageInfo;

public interface CmsAdvertisingService {

	PageInfo<CmsAdvertising> findCmsAdvertisingByPage(Integer pageNum,
			Integer pageSize, Map map);

	void update(CmsAdvertising cmsAdvertising);

	void insert(CmsAdvertising cmsAdvertising);

	void delete(Integer id);

	CmsAdvertising load(Integer id);

	void click(Integer id);

	PageInfo<CmsAdvertising> findCmsAdvertisingByPageForPortal(int i,
			Integer pageSize, Map map);

}
