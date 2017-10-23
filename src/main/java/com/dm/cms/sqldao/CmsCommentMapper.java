package com.dm.cms.sqldao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dm.cms.model.CmsComment;

public interface CmsCommentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CmsComment record);

    int insertSelective(CmsComment record);

    CmsComment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CmsComment record);

    int updateByPrimaryKey(CmsComment record);

	List<CmsComment> selectRecordsByCmsContentId(int cmsContentId);
	
	Integer selectCountByCmsContentId(@Param("cmsContentId") Integer cmsContentId,@Param("channelType") String channelType);
}