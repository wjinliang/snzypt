package com.dm.cms.sqldao;

import java.util.List;

import com.dm.cms.model.CmsReply;

public interface CmsReplyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CmsReply record);

    int insertSelective(CmsReply record);

    CmsReply selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CmsReply record);

    int updateByPrimaryKey(CmsReply record);
    
    List<CmsReply> selectByMsgId(String msgId);
}