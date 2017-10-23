package com.dm.cms.sqldao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsVideo;

public interface CmsVideoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CmsVideo record);

    int insertSelective(CmsVideo record);

    CmsVideo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CmsVideo record);

    int updateByPrimaryKey(CmsVideo record);
    
    List<CmsVideo> selectByTypeId(Integer typeId);

	void insertAttachments(@Param("videoId") Integer videoId, @Param("attachmentId") Integer attachmentId);

	void deleteAttachmentsByVideoId(Integer videoId);

	List<Integer> selectAttachmentsByVideoId(Integer videoId);

	List<CmsVideo> findBychannelIdArgMap(Map map);
	
	String selectVideoIdsByAttachmentId(Integer attachmentId);

	List<CmsVideo> selectPageListByMap(Map argMap);

	List<CmsChannel> findAllByRoot();
	
}