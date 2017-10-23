package com.dm.cms.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.dm.cms.model.CmsVisitCountVo;
import com.github.pagehelper.PageInfo;

public interface CmsStatisticService {

	PageInfo<CmsVisitCountVo> channelVisitList(Integer pageNum, Integer pageSize,CmsVisitCountVo cmsVisitCountVo, Integer days);

	PageInfo<CmsVisitCountVo> contentVisitList(Integer pageNum, Integer pageSize,CmsVisitCountVo cmsVisitCountVo, Integer days);

	void addVisited(CmsVisitCountVo cmsVisitCountVo, HttpServletRequest request);

	Map pubulishList(Integer pageNum, Integer pageSize,
			CmsVisitCountVo cmsVisitCountVo, int days);
    
	Integer selectCountByContentId(Integer contentId,String channelType);

	PageInfo<CmsVisitCountVo> siteVisitList(Integer pageNum, Integer pageSize,
			CmsVisitCountVo cmsVisitCountVo, Integer days);

	Map<String,Object> selectSiteStatisticList(Integer pageNum, Integer pageSize,
			String sort, Map map);

	Map<String,Object> selectChannelStatisticList(Integer pageNum, Integer pageSize,
			String sort, Map map);

	Map<String,Object> selectUserStatisticList(Integer pageNum, Integer pageSize,
			String sort, Map map);
}
