package com.dm.atform.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.dm.atform.model.AtField;
import com.dm.atform.service.AtFieldService;
import com.dm.atform.sqldao.AtFieldMapper;
import com.dm.platform.util.UUIDUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class AtFieldServiceImpl implements AtFieldService{
	@Autowired
	private AtFieldMapper fieldMapper;
	@Override
	public PageInfo<AtField> findByArg(Map map) {
		PageHelper.startPage(map);
		List<AtField> list = this.fieldMapper.selectByArgMap(map);
		PageInfo page = new PageInfo(list);
		return page;
	}

	@Override
	public List<AtField> findAll(Map map) {
		map.put("sort", "a_seq ");
		List<AtField> list = this.fieldMapper.selectByArgMap(map);
		return list;
	}
	@Override
	public AtField findOne(String id) {
		return this.fieldMapper.selectByPrimaryKey(id);
	}
	@Override
	public void saveOrUpdate(AtField record) {
		if(StringUtils.hasText(record.getId())){
			this.fieldMapper.updateByPrimaryKey(record);
		}else{
			record.setId(UUIDUtils.getUUID8());
			Integer seq = this.fieldMapper.findmaxSeq(record.getTableId());
			seq = seq==null?1:seq+1;
			record.setaSeq(seq);
			this.fieldMapper.insert(record);
		}
		
	}
	@Override
	public void delete(String id) {
		this.fieldMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void seq(String id, String tid) {

		AtField a = this.fieldMapper.selectByPrimaryKey(tid);
		AtField a1 = this.fieldMapper.selectByPrimaryKey(id);
		int seq = a.getaSeq();
		a.setaSeq(a1.getaSeq());
		a1.setaSeq(seq);
		this.fieldMapper.updateByPrimaryKey(a);
		this.fieldMapper.updateByPrimaryKey(a1);
		
	}

	@Override
	public List<Map<String,String>> findByTableId(String tableId){
		List<Map<String,String>> list=fieldMapper.findByTableId( tableId);
		return list;
	}

	
}
