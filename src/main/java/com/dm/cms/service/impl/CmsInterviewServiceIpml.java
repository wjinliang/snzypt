package com.dm.cms.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dm.cms.model.CmsInterview;
import com.dm.cms.model.CmsInterviewAbout;
import com.dm.cms.model.CmsInterviewImage;
import com.dm.cms.model.CmsInterviewQuestions;
import com.dm.cms.model.CmsInterviewRecord;
import com.dm.cms.model.CmsInterviewRole;
import com.dm.cms.service.CmsInterviewService;
import com.dm.cms.sqldao.CmsInterviewAboutMapper;
import com.dm.cms.sqldao.CmsInterviewImageMapper;
import com.dm.cms.sqldao.CmsInterviewMapper;
import com.dm.cms.sqldao.CmsInterviewQuestionsMapper;
import com.dm.cms.sqldao.CmsInterviewRecordMapper;
import com.dm.cms.sqldao.CmsInterviewRoleMapper;
import com.dm.platform.model.UserAccount;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.UserAccountUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class CmsInterviewServiceIpml implements CmsInterviewService {

	@Autowired
	private CmsInterviewMapper cmsInterviewMapper;
	@Autowired
	private CmsInterviewAboutMapper cmsInterviewAboutMapper;
	@Autowired
	private CmsInterviewImageMapper cmsInterviewImageMapper;
	@Autowired
	private CmsInterviewRecordMapper cmsInterviewRecordMapper;
	@Autowired
	private CmsInterviewRoleMapper cmsInterviewRoleMapper;
	@Autowired
	private CmsInterviewQuestionsMapper cmsInterviewQmapper;
	

	@Override
	public Map update(CmsInterview interview) {
		Date now = new Date();
		interview.setUpdateTime(now);
		interview.setStatus("0");
		this.cmsInterviewMapper.updateByPrimaryKeySelective(interview);
		return ResponseUtil.success();
	}

	@Override
	public Map insert(CmsInterview interview) {
		Date now = new Date();
		interview.setCreateTime(now);
		interview.setStatus("0");
		UserAccount user = UserAccountUtil.getInstance()
				.getCurrentUserAccount();
		if (user != null)
			interview.setCreateUser(user.getCode());
		this.cmsInterviewMapper.insert(interview);
		return ResponseUtil.success();
	}

	@Override
	public PageInfo<CmsInterview> findByPage(Integer pageNum, Integer pageSize,
			Map map) {
		PageHelper.startPage(pageNum, pageSize);
		List<CmsInterview> list = this.cmsInterviewMapper.findList(map);
		PageInfo<CmsInterview> page = new PageInfo<CmsInterview>(list);
		return page;
	}

	@Override
	public Map updateStatusToDelete(Integer id) {
		// this.cmsInterviewMapper.selectByPrimaryKey(id);
		CmsInterview inter = new CmsInterview();
		inter.setId(id);
		inter.setStatus("9");
		inter.setUpdateTime(new Date());
		this.cmsInterviewMapper.updateByPrimaryKeySelective(inter);
		return ResponseUtil.success();
	}

	@Override
	public CmsInterview loadOne(Integer id) {
		CmsInterview record = this.cmsInterviewMapper.selectByPrimaryKey(id);
		if (record == null)
			return null;
		loadInfo(record);
		return record;
	}

	private void loadInfo(CmsInterview record) {
		Integer pid = record.getId();
		Map map = new HashMap();
		Map model = new HashMap();
		model.put("interviewId", pid);
		map.put("model", model);
		List<CmsInterviewAbout> abouts = this.cmsInterviewAboutMapper
				.findList(map);
		List<CmsInterviewImage> images = this.cmsInterviewImageMapper
				.findList(map);
		List<CmsInterviewRecord> records = this.cmsInterviewRecordMapper
				.findList(map);
		List<CmsInterviewRole> roles = this.cmsInterviewRoleMapper
				.findList(map);
		List<CmsInterviewQuestions> questions = this.cmsInterviewQmapper.findList(map);
		record.put("abouts", abouts).put("images", images)
				.put("records", records).put("roles", roles)
				.put("questions", questions);
	}

	@Override
	public Map publish(Integer id) {
		CmsInterview record = this.cmsInterviewMapper.selectByPrimaryKey(id);
		record.setUpdateTime(new Date());
		record.setStatus("2");
		this.cmsInterviewMapper.updateByPrimaryKeySelective(record);
		return ResponseUtil.success();
	}

	@Override
	public List<CmsInterviewRecord> loadRecords(Map map) {
		List<CmsInterviewRecord> list = this.cmsInterviewRecordMapper
				.findList(map);
		return list;
	}

	@Override
	public List<CmsInterviewImage> loadImages(Map map) {
		// TODO Auto-generated method stub
		List<CmsInterviewImage> list = this.cmsInterviewImageMapper
				.findList(map);
		return list;
	}

	@Override
	public List<CmsInterviewAbout> loadAbouts(Map map) {
		List<CmsInterviewAbout> list = this.cmsInterviewAboutMapper
				.findList(map);
		return list;
	}

	@Override
	public List<CmsInterviewRole> loadRoles(Map map) {
		return this.cmsInterviewRoleMapper.findList(map);
	}

	@Override
	public void insertRole(CmsInterviewRole role) {
		this.cmsInterviewRoleMapper.insert(role);

	}

	@Override
	public void updateRole(CmsInterviewRole role) {
		this.cmsInterviewRoleMapper.updateByPrimaryKeySelective(role);

	}

	@Override
	public void deleteRole(Integer roleId) {
		this.cmsInterviewRoleMapper.deleteByPrimaryKey(roleId);

	}

	@Override
	public CmsInterviewRole findRoleById(Integer roleId) {
		return this.cmsInterviewRoleMapper.selectByPrimaryKey(roleId);
	}

	@Override
	public void updateRecord(CmsInterviewRecord interviewRecord) {
		// TODO Auto-generated method stub
		interviewRecord.setUpdateTime(new Date());
		this.cmsInterviewRecordMapper.updateByPrimaryKeySelective(interviewRecord);
	}

	@Override
	public void insertRecord(CmsInterviewRecord interviewRecord) {
		interviewRecord.setCreateTime(new Date());
		//interviewRecord.setPublishTime(new Date());
		interviewRecord.setCreateUser(this.getcurrentUserId());
		interviewRecord.setWorker(this.getcurrentUser().getName());
		interviewRecord.setStatus("0");
		CmsInterviewRole r = this.cmsInterviewRoleMapper.selectByPrimaryKey(interviewRecord.getRoleId());
		interviewRecord.setRoleName(r.getRoleName());
		interviewRecord.setFiled1(r.getPersonName());
		this.cmsInterviewRecordMapper.insert(interviewRecord);
		interviewRecord.setSeq(interviewRecord.getId());
		this.cmsInterviewRecordMapper.updateByPrimaryKeySelective(interviewRecord);
	}

	@Override
	public void updateRecordToDelete(Integer recordId) {
		// TODO Auto-generated method stub
		CmsInterviewRecord record = new CmsInterviewRecord();
		record.setId(recordId);
		record.setStatus("9");
		this.cmsInterviewRecordMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public CmsInterviewRecord loadRecord(Integer recordId) {
		// TODO Auto-generated method stub
		return this.cmsInterviewRecordMapper.selectByPrimaryKey(recordId);
	}

	@Override
	public void insertAbout(CmsInterviewAbout about) {
		// TODO Auto-generated method stub
		about.setCreateTime(new Date());
		about.setFiled2("0");

		this.cmsInterviewAboutMapper.insert(about);
	}

	@Override
	public void updateAbout(CmsInterviewAbout about) {
		about.setUpdateTime(new Date());
		about.setFiled2("0");
		this.cmsInterviewAboutMapper.updateByPrimaryKeySelective(about);

	}

	@Override
	public void updateAboutTodelete(Integer aboutId) {
		CmsInterviewAbout record = new CmsInterviewAbout();
		record.setId(aboutId);
		record.setFiled2("9");
		this.cmsInterviewAboutMapper.updateByPrimaryKeySelective(record);

	}

	@Override
	public CmsInterviewAbout loadAbout(Integer aboutId) {
		return this.cmsInterviewAboutMapper.selectByPrimaryKey(aboutId);
	}

	@Override
	public void insertImage(CmsInterviewImage image) {
		// TODO Auto-generated method stub
		image.setCreateTime(new Date());
		image.setCreateUser(this.getcurrentUserId());
		image.setFiled2("0");
		this.cmsInterviewImageMapper.insert(image);
	}

	private String getcurrentUserId() {
		UserAccount user = this.getcurrentUser();
		if (user == null)
			return null;
		return user.getCode();
	}

	private UserAccount getcurrentUser() {
		return UserAccountUtil.getInstance().getCurrentUserAccount();
	}

	@Override
	public void updateImage(CmsInterviewImage image) {
		image.setUpdateTime(new Date());
		image.setFiled2("0");
		this.cmsInterviewImageMapper.updateByPrimaryKeySelective(image);

	}

	@Override
	public void updateImageToDelete(Integer imageId) {
		CmsInterviewImage record = new CmsInterviewImage();
		record.setId(imageId);
		record.setUpdateTime(new Date());
		record.setFiled2("9");
		this.cmsInterviewImageMapper.updateByPrimaryKeySelective(record);

	}

	@Override
	public CmsInterviewImage loadImage(Integer imageId) {
		return this.cmsInterviewImageMapper.selectByPrimaryKey(imageId);
	}

	@Override
	public PageInfo<CmsInterviewRecord> listRecord(Integer pageNum,
			Integer pageSize, Map map) {
		PageHelper.startPage(pageNum, pageSize);
		List<CmsInterviewRecord> list = this.cmsInterviewRecordMapper.findList(map);
		return new PageInfo<CmsInterviewRecord>(list);
	}

	@Override
	public PageInfo<CmsInterviewImage> listImage(Integer pageNum,
			Integer pageSize, Map map) {
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<CmsInterviewImage>(this.cmsInterviewImageMapper.findList(map));
	}

	@Override
	public PageInfo<CmsInterviewAbout> listAbout(Integer pageNum,
			Integer pageSize, Map map) {
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<CmsInterviewAbout>(this.cmsInterviewAboutMapper.findList(map));
	
	}

	@Override
	public PageInfo<CmsInterviewRole> listRole(Integer pageNum,
			Integer pageSize, Map map) {
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<CmsInterviewRole>(this.cmsInterviewRoleMapper.findList(map));
	
	}

	@Override
	public void checke(String ids, String status) {
		if(ids!=null && !ids.equals("")){
			String [] d = ids.split(",");
			for(String i:d){
				Integer id = Integer.valueOf(i);
				CmsInterview record = new CmsInterview();
				record.setId(id);
				record.setStatus(status);
				this.cmsInterviewMapper.updateByPrimaryKeySelective(record);
			}
				
		}
		
	}

	@Override
	public PageInfo<CmsInterviewQuestions> listQuestions(Integer pageNum,
			Integer pageSize, Map map) {
		PageHelper.startPage(pageNum, pageSize);
		List<CmsInterviewQuestions> list = this.cmsInterviewQmapper.findList(map);
		PageInfo<CmsInterviewQuestions> page = new PageInfo<CmsInterviewQuestions>(list);
		return page;
	}

}