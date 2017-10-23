package com.dm.cms.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.dm.cms.model.CmsAudio;
import com.github.pagehelper.PageInfo;

public interface CmsAudioService {

	PageInfo<CmsAudio> findBychannelIdArgMap(Map map, Integer pageNum,
			Integer pageSize);

	void insertOrUpdate(CmsAudio cmsAudio);

	CmsAudio findOne(Integer audioId);

	String selectAttachmentByAudioId(Integer audioId);

	int commit(String audioIds);

	void sort(Integer audioId, Integer seq);

	int updateStatus(Integer status, String videoIds, HttpServletRequest request);

	boolean generatorHtml(HttpServletRequest request, Integer id);

	List<CmsAudio> selectPageListByMap(Map argMap);

	void deleteByIds(String audioIds, HttpServletRequest request);

}
