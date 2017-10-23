package com.dm.cms.service;

import com.dm.cms.model.CmsAttachment;

import org.springframework.stereotype.Service;

/**
 * Created by cgj on 2015/12/3.
 */
@Service public interface CmsAttachmentService {
    int insertCmsAttachment(CmsAttachment cmsAttachment);

    void updateCmsAttachment(CmsAttachment cmsAttachment);

    void deleteCmsAttachment(int cmsAttachmentId);

    CmsAttachment findOneById(int cmsAttachmentId);

	void deleteByIdWithLocalFile(Integer id);

}
