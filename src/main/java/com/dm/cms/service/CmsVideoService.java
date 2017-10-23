package com.dm.cms.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsVideo;
import com.github.pagehelper.PageInfo;

public interface CmsVideoService {

	CmsVideo findOne(Integer videoId);

	PageInfo<CmsVideo> findBychannelIdArgMap(Map map, Integer pageNum, Integer pageSize);

	String selectAttachmentByVideoId(Integer videoId);

	int commit(String videoIds);

	void insertOrUpdate(CmsVideo cmsVideo);
	void sort(Integer videoId, Integer seq);

	int updateStatus(Integer status, String videoIds, HttpServletRequest request);
  
	boolean generatorHtml(HttpServletRequest request, Integer videoId);

	/**
	 * 遍历视频表，不通过channelId
	 * @param argMap (pageNum,pageSize,order)
	 * @return
	 */
	List<CmsVideo> selectPageListByMap(Map argMap);

	void updateByPrimaryKey(CmsVideo cmsVideo);

	String selectVideoIdsByAttachmentId(Integer id);

	void deleteByIds(String ids, HttpServletRequest request);

}
