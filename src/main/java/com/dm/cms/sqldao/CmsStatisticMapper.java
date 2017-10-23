package com.dm.cms.sqldao;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * Create by wjl 2016年4月25日 下午4:18:28
 * com.dm.cms.sqldao.CmsStatisticMapper.java
 * Project dmbase
 */
public interface CmsStatisticMapper {

	public List<Map> selectSiteStatisticList(Map map);

	public List<Map> selectChannelStatisticList(Map map);

	public List<Map> selectUserStatisticList(Map map);
	
	public Integer selectTemplateCountForSite(Integer siteId);

}
