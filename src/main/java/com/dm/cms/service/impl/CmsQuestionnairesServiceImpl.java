package com.dm.cms.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dm.cms.model.CmsQuestionnaires;
import com.dm.cms.model.CmsVote;
import com.dm.cms.service.CmsQuestionnairesService;
import com.dm.cms.service.CmsVoteService;
import com.dm.cms.sqldao.CmsQuestionnairesMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class CmsQuestionnairesServiceImpl implements CmsQuestionnairesService{

	@Autowired
	private CmsQuestionnairesMapper mapper;
	@Autowired
	private CmsVoteService voteMapper;
	
	@Override
	public PageInfo<CmsQuestionnaires> findByPage(Integer pageNum,
			Integer pageSize, Map map) {
		PageHelper.startPage(pageNum, pageSize);
		List<CmsQuestionnaires> list = this.mapper.findByArgMap(map);
		PageInfo<CmsQuestionnaires> page =new PageInfo<CmsQuestionnaires>(list);
		return page;
	}

	@Override
	public void update(CmsQuestionnaires record) {
		this.mapper.updateByPrimaryKey(record);
	}

	@Override
	public void insert(CmsQuestionnaires record) {
		record.setCreateTime(new Date());
		record.setStatus("0");
		this.mapper.insert(record);
		
	}

	@Override
	public void delete(Integer id) {
		this.mapper.deleteByPrimaryKey(id);
		
	}

	@Override
	public CmsQuestionnaires load(Integer id) {
		return this.mapper.selectByPrimaryKey(id);
	}
	

	@Override
	public void updateStatus(Integer id, String status) {
		CmsQuestionnaires record = new CmsQuestionnaires();
		record.setId(id);
		record.setStatus(status);
		if(status!=null && status.equals("2")){
			if(record.getPublishTime()==null)
			record.setPublishTime(new Date());
		}
		this.mapper.updateByPrimaryKeySelective(record);
		
	}

	@Override
	public CmsQuestionnaires loadWithVote(Integer id) {
		 CmsQuestionnaires q = this.mapper.selectByPrimaryKey(id);
		 if(q==null) return null;
		 List<CmsVote> votes = this.voteMapper.listByQtionId(id);
		 q.setVotes(votes);
		 return q;
		 
		
	}

}
