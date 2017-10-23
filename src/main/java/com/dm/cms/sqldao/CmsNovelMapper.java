package com.dm.cms.sqldao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dm.cms.model.CmsNovel;

public interface CmsNovelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CmsNovel record);

    int insertSelective(CmsNovel record);

    CmsNovel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CmsNovel record);

    int updateByPrimaryKey(CmsNovel record);
    
    List<CmsNovel> selectRecordByArgMap(Map map);

	void deleteAttaByNovelId(Integer novleId);

	void insertAttachment(@Param("novelId")Integer id,@Param("attachmentId") Integer attaId);

	String selectAttaIdsStringByNovelId(Integer novleId);
	
	String selectNovelIdsByAttachmentId(Integer attachmentId);

	List<CmsNovel> selectPageListByMap(Map argMap);
}