package com.dm.cms.service;

import com.dm.cms.model.CmsAttachmentOther;

public interface CmsAttachmentOtherService {

	int insert(CmsAttachmentOther cmsAttachmentOther);

	CmsAttachmentOther findOneById(Integer attachmentId);
	/**
	 * 删除记录、文件
	 * @param attachmentId
	 */
	void delete(Integer attachmentId);

	int update(CmsAttachmentOther attachment);


}
