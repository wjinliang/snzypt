package com.dm.cms.service.impl;

import com.dm.cms.model.CmsComment;
import com.dm.cms.service.CmsCommentService;
import com.dm.cms.sqldao.CmsCommentMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by cgj on 2015/12/5.
 */
@Service public class CmsCommentServiceImpl implements CmsCommentService {
    @Autowired CmsCommentMapper cmsCommentMapper;

    @Override public void insertCmsComment(CmsComment cmsAttachment) {
        cmsCommentMapper.insertSelective(cmsAttachment);
    }

    @Override public void updateCmsComment(CmsComment cmsAttachment) {
        cmsCommentMapper.updateByPrimaryKeySelective(cmsAttachment);
    }

    @Override public void deleteCmsComment(int cmsAttachmentId) {
        cmsCommentMapper.deleteByPrimaryKey(cmsAttachmentId);
    }

    @Override public CmsComment findOneById(int cmsAttachmentId) {
        return cmsCommentMapper.selectByPrimaryKey(cmsAttachmentId);
    }

    @Override public PageInfo<CmsComment> findCmsCommentByCmsContentIdByPage(Integer pageNum,
        Integer pageSize, int cmsContentId) {
        PageHelper.startPage(pageNum, pageSize);
        List<CmsComment> list = cmsCommentMapper.selectRecordsByCmsContentId(cmsContentId);
        PageInfo<CmsComment> pageInfo = new PageInfo<CmsComment>(list);
        return pageInfo;
    }

	@Override
	public Integer selectCountByCmsContentId(Integer cmsContentId,String channelType) {
		// TODO Auto-generated method stub
		return cmsCommentMapper.selectCountByCmsContentId(cmsContentId,channelType);
	}
}
