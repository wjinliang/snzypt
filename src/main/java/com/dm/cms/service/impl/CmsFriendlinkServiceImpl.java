package com.dm.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dm.cms.model.CmsFriendlink;
import com.dm.cms.service.CmsFriendlinkService;
import com.dm.cms.sqldao.CmsFriendlinkMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@Service
public class CmsFriendlinkServiceImpl implements CmsFriendlinkService{
	
	@Autowired
	private CmsFriendlinkMapper cmsFriendlinkMapper;
	@Override
	public PageInfo<CmsFriendlink> findCmsFriendlinkByPage(Integer pageNum,
			Integer pageSize, CmsFriendlink cmsFriendlink) {
		Map map = new HashMap();
		map.put("model", cmsFriendlink);
		PageHelper.startPage(pageNum, pageSize);
		List<CmsFriendlink> list = this.cmsFriendlinkMapper.selectByArgMap(map);
		PageInfo<CmsFriendlink> page = new PageInfo<CmsFriendlink>(list);
 		return page;
	}

	@Override
	public CmsFriendlink loadById(Integer id) {
		return this.cmsFriendlinkMapper.selectByPrimaryKey(Long.valueOf(id));
	}

	@Override
	public void insert(CmsFriendlink cmsFriendlink) {
		init(cmsFriendlink);
		this.cmsFriendlinkMapper.insert(cmsFriendlink);
		
	}

	private void init(CmsFriendlink cmsFriendlink) {
		if(cmsFriendlink.getIsShow()==null ||cmsFriendlink.getIsShow().equals("")){
			cmsFriendlink.setIsShow("1");
		}
	}

	@Override
	public void update(CmsFriendlink cmsFriendlink) {
		this.cmsFriendlinkMapper.updateByPrimaryKey(cmsFriendlink);
		
	}

	@Override
	public void delete(Integer id) {
		this.cmsFriendlinkMapper.deleteByPrimaryKey(Long.valueOf(id));
		
	}

	@Override
	public void setIsShow(Long id) {
		CmsFriendlink link = this.cmsFriendlinkMapper.selectByPrimaryKey(id);
		link.setIsShow(link.getIsShow().equals("0")?"1":"0");
		this.cmsFriendlinkMapper.updateByPrimaryKey(link);
	}

	
}
