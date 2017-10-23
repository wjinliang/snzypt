package com.dm.cms.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;

import javax.servlet.http.HttpServletRequest;

import com.dm.cms.model.CmsAttachment;
import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsCheck;
import com.dm.cms.model.CmsContent;
import com.github.pagehelper.PageInfo;

/**
 * Created by cgj on 2015/11/29.
 */
public interface CmsContentService {
    void insertCmsContent(CmsContent cmsContent);

    void updateCmsContent(CmsContent cmsContent);

    CmsContent findOneById(int cmsContentId);

    void deleteCmsContentById(int cmsContentId);

    CmsContent findOneByPortal(String siteDomain, String channelEnName, int cmsContentId);

    void insertAttachment(int cmsContentId, String cmsAttachmentIds);

    void updateAttachment(int cmsContentId, String cmsAttachmentIds);

    List<CmsAttachment> findCmsAttachmentByCmsContentId(int cmsContentId);

    String findCmsAttachementIdsByCmsContentId(int cmsContentId);

	CmsContent generateHtml(HttpServletRequest request, int contentId);
	/**
	 * 更新状态
	 * @param contentId
	 * @return 
	 */
	boolean updateContentState(HttpServletRequest request,Integer contentId,Short status);
  
	/**
	 * 更具channelId 获取总个数
	 * @param ChannelId
	 * @return
	 */
	int selectCountBychannelId(Integer channelId);

	void sort(Integer contentId, Integer seq);

	PageInfo<CmsContent> findCmsContentByPage(Integer pageNum,
			Integer pageSize, Map argMap);

	void selectTopOneAndUpdate();

	CmsContent selectTopOne();
	PageInfo<CmsContent> selectIsPictures(Integer pageNum,
			Integer pageSize);
	
	PageInfo<CmsCheck> findCmsContentByViewPage(Integer pageNum,
			Integer pageSize, Map argMap);
	/**
	 * 设置为删除状态 放入回收站
	 * @param valueOf
	 */
	void setContentIsDelete(Integer valueOf);
	/**
	 * 还原
	 * @param contentId
	 */
	void restore(String contentId);

	int selectCountBychannelIdOnly(Integer channelId);

	void generateChannelMutipleThread(HttpServletRequest request,
			CmsChannel channel, ExecutorService executor);
	
	PageInfo<CmsContent> findLeaderContentsByPage(Integer pageNum,
			Integer pageSize, String leaderId);

	List<CmsContent> selectTopOne(Map params);
	
	
}
