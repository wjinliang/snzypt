package com.dm.cms.sqldao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dm.cms.model.CmsVisitCountVo;

/**
 * 访问记录
 * 
 * @project com.dm.cms.sqldao.CmsContentVisitRecordMapper.java
 * @author wjl
 * @createdate 2016年1月9日 下午9:26:58
 */
public interface CmsContentVisitRecordMapper {
	void insertVisitRecord(@Param("contentId") Integer contentId,
			@Param("channelId") Integer channelId,
			@Param("channelType") String channelType,
			@Param("userId") String userId,
			@Param("visitTime") String visitTime, @Param("ip") String ip);

	List<CmsVisitCountVo> selectVisitListForSite(CmsVisitCountVo cmsVisitCountVo);

	List<CmsVisitCountVo> selectVisitListForChannel(
			CmsVisitCountVo cmsVisitCountVo);

	List<CmsVisitCountVo> selectVisitListForContent(
			CmsVisitCountVo cmsVisitCountVo);

	List<CmsVisitCountVo> selectPublishList(
			@Param("vo") CmsVisitCountVo cmsVisitCountVo,
			@Param("channelIds") List<Integer> channelIds);

	List<CmsVisitCountVo> selectPublishListLimit(CmsVisitCountVo cmsVisitCountVo);

	Integer selectCountByContentId(@Param("cmsContentId") Integer cmsContentId,
			@Param("channelType") String channelType);

	List<Map> selectVisitListForUser(Map map);

}
