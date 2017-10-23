package com.dm.cms.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.dm.cms.model.CmsNovel;
import com.github.pagehelper.PageInfo;

/**
 * 小说
 * @project com.dm.cms.service.CmsNovelService.java
 * @author wjl
 * @createdate 2016年1月14日 上午11:41:36
 */
public interface CmsNovelService {

	PageInfo<CmsNovel> findCmsNovelByPage(Integer pageNum, Integer pageSize,
			Map map);

	void updateCmsNovel(CmsNovel cmsNovel);

	void insertCmsNovel(CmsNovel cmsNovel);

	void updateAttachment(Integer id, String attachmentIds);

	void insertAttachment(Integer id, String attachmentIds);

	CmsNovel findById(Integer id);

	void sort(Integer novelId, Integer seq);

	List<CmsNovel> selectPageListByMap(Map argMap);

	int updateStatus(String novelIds, String status, HttpServletRequest request);

	boolean generatorHtml(Integer novelId, HttpServletRequest request);

	void delete(String novelIds, HttpServletRequest request);

}
