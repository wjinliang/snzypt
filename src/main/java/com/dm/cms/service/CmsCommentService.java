package com.dm.cms.service;

import com.dm.cms.model.CmsComment;
import com.github.pagehelper.PageInfo;

/**
 * Created by cgj on 2015/12/5.
 */
public interface CmsCommentService {
    void insertCmsComment(CmsComment cmsAttachment);

    void updateCmsComment(CmsComment cmsAttachment);

    void deleteCmsComment(int cmsAttachmentId);

    CmsComment findOneById(int cmsAttachmentId);

    PageInfo<CmsComment> findCmsCommentByCmsContentIdByPage(Integer pageNum, Integer pageSize,
        int cmsContentId);
    
	Integer selectCountByCmsContentId(Integer cmsContentId, String channelType);
}
