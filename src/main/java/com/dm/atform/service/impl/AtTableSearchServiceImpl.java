package com.dm.atform.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dm.atform.model.AtTableSearch;
import com.dm.atform.service.AtTableSearchService;
import com.dm.atform.sqldao.AtTableSearchMapper;
import com.dm.platform.util.UUIDUtils;
import com.dm.platform.util.UserAccountUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class AtTableSearchServiceImpl implements AtTableSearchService{
	@Autowired
	private AtTableSearchMapper tableSearchMapper;
	@Override
	public PageInfo<AtTableSearch> findByArg(Map map) {
		PageHelper.startPage(map);
		List<AtTableSearch> list = this.tableSearchMapper.selectByArgMap(map);
		PageInfo page = new PageInfo(list);
		return page;
	}
	@Override
	public List<AtTableSearch> findAllByArg(Map map) {
		List<AtTableSearch> list = this.tableSearchMapper.selectByArgMap(map);
		return list;
	}
	@Override
	public AtTableSearch findOne(String id) {
		return this.tableSearchMapper.selectByPrimaryKey(id);
	}
	@Override
	public void save(AtTableSearch record) {
			record.setId(UUIDUtils.getUUID8());
			record.setCreateDate(new Date());
			record.setCreateUser(UserAccountUtil.getInstance().getCurrentUser());
			this.tableSearchMapper.insert(record);
	}
	@Override
	public void update(AtTableSearch record) {
			this.tableSearchMapper.updateByPrimaryKeySelective(record);
		
	}
	@Override
	public void delete(String id) {
		AtTableSearch record = new AtTableSearch();
		record.setId(id);
		record.setStatus("9");
		this.tableSearchMapper.updateByPrimaryKeySelective(record);
	}
	
}
