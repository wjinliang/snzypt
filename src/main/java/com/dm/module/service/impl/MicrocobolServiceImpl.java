package com.dm.module.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dm.module.model.Microcobol;
import com.dm.module.service.MicrocobolService;
import com.dm.module.sqldao.MicrocobolMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class MicrocobolServiceImpl implements MicrocobolService{

	@Autowired
	private MicrocobolMapper microcobolMapper;

	@Override
	public PageInfo<Microcobol> findMicrocobolByPage(Integer pageNum,
			Integer pageSize, Map map) {
		PageHelper.startPage(pageNum, pageSize);
		List<Microcobol> list = this.microcobolMapper.listByArg(map);
		PageInfo<Microcobol> page = new PageInfo<Microcobol>(list);
		return page;
	}

	@Override
	public void update(Microcobol microcobol) {
		this.microcobolMapper.updateByPrimaryKey(microcobol);
		
	}

	@Override
	public Microcobol load(Integer id) {
		Microcobol mo = this.microcobolMapper.selectByPrimaryKey(id);
		return mo;
	}

	@Override
	public void click(Integer id) {
		Microcobol mo =this.microcobolMapper.selectByPrimaryKey(id);
		Integer s = mo.getClickCounts();
		if(s==null){
			mo.setClickCounts(1);
		}else{
			mo.setClickCounts(s++);
		}
		
	}

	@Override
	public void delete(Integer id) {
		this.microcobolMapper.deleteByPrimaryKey(id);
		
	}

	@Override
	public void insert(Microcobol microcobol) {
		this.init(microcobol);
		this.microcobolMapper.insert(microcobol);
		
	}

	private void init(Microcobol microcobol) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map selectAll() {
		Map map = new HashMap();
		Microcobol m= new Microcobol();
		m.setIsHidden(false);
		map.put("model", m);
		this.microcobolMapper.listByArg(map);
		return null;
	}
	
	
}
