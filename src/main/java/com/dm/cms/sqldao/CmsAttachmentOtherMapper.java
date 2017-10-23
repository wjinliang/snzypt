package com.dm.cms.sqldao;

import com.dm.cms.model.CmsAttachmentOther;

public interface CmsAttachmentOtherMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CmsAttachmentOther record);

    int insertSelective(CmsAttachmentOther record);

    CmsAttachmentOther selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CmsAttachmentOther record);

    int updateByPrimaryKey(CmsAttachmentOther record);

	CmsAttachmentOther selectByVideoId(Integer videoId);
}