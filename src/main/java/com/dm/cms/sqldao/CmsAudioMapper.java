package com.dm.cms.sqldao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dm.cms.model.CmsAudio;

public interface CmsAudioMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CmsAudio record);

    int insertSelective(CmsAudio record);

    CmsAudio selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CmsAudio record);

    int updateByPrimaryKeyWithBLOBs(CmsAudio record);

    int updateByPrimaryKey(CmsAudio record);

	List<CmsAudio> findByChannelIdArgMap(Map map);

	void deleteAttachmentsByAudioId(Integer id);

	void insertAttachments(@Param("audioId") Integer audioId, @Param("attachmentId") Integer attachmentId);

	String selectAttachmentByAudioId(Integer audioId);
	
	String selectAudioIdsByAttachmentId(Integer attachmentId);

	List<CmsAudio> selectPageListByMap(Map argMap);
}