package com.dm.atform.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.dm.atform.model.AtDatasourceApply;
import com.dm.atform.service.AtDatasourceApplyService;
import com.dm.atform.sqldao.AtDatasourceApplyMapper;
import com.dm.platform.util.UUIDUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class AtDatasourceServiceImpl implements AtDatasourceApplyService{
	@Autowired
	private AtDatasourceApplyMapper fieldMapper;
	@Override
	public PageInfo<AtDatasourceApply> findByArg(Map map) {
		PageHelper.startPage(map);
		List<AtDatasourceApply> list = this.fieldMapper.selectByArgMap(map);
		PageInfo page = new PageInfo(list);
		return page;
	}

	@Override
	public List<AtDatasourceApply> findAll(Map map) {
		map.put("sort", "apply_time desc");
		List<AtDatasourceApply> list = this.fieldMapper.selectByArgMap(map);
		return list;
	}
	@Override
	public AtDatasourceApply findOne(String id) {
		return this.fieldMapper.selectByPrimaryKey(id);
	}
	@Override
	public void saveOrUpdate(AtDatasourceApply record) {
		if(StringUtils.hasText(record.getId())){
			this.fieldMapper.updateByPrimaryKeySelective(record);
		}else{
			record.setId(UUIDUtils.getUUID8());
			this.fieldMapper.insert(record);
		}
		
	}
	@Override
	public void delete(String id) {
		this.fieldMapper.deleteByPrimaryKey(id);
	}

	
}
