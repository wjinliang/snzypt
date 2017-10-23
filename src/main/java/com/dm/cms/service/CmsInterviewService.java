package com.dm.cms.service;

import java.util.List;
import java.util.Map;

import com.dm.cms.model.CmsInterview;
import com.dm.cms.model.CmsInterviewAbout;
import com.dm.cms.model.CmsInterviewImage;
import com.dm.cms.model.CmsInterviewQuestions;
import com.dm.cms.model.CmsInterviewRecord;
import com.dm.cms.model.CmsInterviewRole;
import com.github.pagehelper.PageInfo;

public interface CmsInterviewService {

	Map update(CmsInterview interview);

	Map insert(CmsInterview interview);

	PageInfo<CmsInterview> findByPage(Integer pageNum, Integer pageSize,
			Map map);

	Map updateStatusToDelete(Integer id);

	CmsInterview loadOne(Integer id);

	Map publish(Integer id);

	List<CmsInterviewRecord> loadRecords(Map map);

	List<CmsInterviewImage> loadImages(Map map);

	List<CmsInterviewAbout> loadAbouts(Map map);

	List<CmsInterviewRole> loadRoles(Map map);
	PageInfo<CmsInterviewRecord> listRecord(Integer pageNum,Integer pageSize,Map map);

	PageInfo<CmsInterviewImage> listImage(Integer pageNum,Integer pageSize,Map map);

	PageInfo<CmsInterviewAbout> listAbout(Integer pageNum,Integer pageSize,Map map);

	PageInfo<CmsInterviewRole> listRole(Integer pageNum,Integer pageSize,Map map);

	void insertRole(CmsInterviewRole role);

	void updateRole(CmsInterviewRole role);

	void deleteRole(Integer roleId);

	CmsInterviewRole findRoleById(Integer roleId);

	void updateRecord(CmsInterviewRecord interviewRecord);

	void insertRecord(CmsInterviewRecord interviewRecord);

	void updateRecordToDelete(Integer recordId);

	CmsInterviewRecord loadRecord(Integer recordId);

	void insertAbout(CmsInterviewAbout about);

	void updateAbout(CmsInterviewAbout about);

	void updateAboutTodelete(Integer aboutId);

	CmsInterviewAbout loadAbout(Integer aboutId);

	void insertImage(CmsInterviewImage image);

	void updateImage(CmsInterviewImage image);

	void updateImageToDelete(Integer imageId);

	CmsInterviewImage loadImage(Integer imageId);

	void checke(String ids, String status);

	PageInfo<CmsInterviewQuestions> listQuestions(Integer pageNum, Integer pageSize, Map map);

}