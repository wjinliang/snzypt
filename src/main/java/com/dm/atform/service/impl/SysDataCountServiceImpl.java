package com.dm.atform.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dm.atform.model.AtTable;
import com.dm.atform.service.AtTableService;
import com.dm.atform.service.MongoService;
import com.dm.atform.service.SysDataCountService;
import com.dm.atform.sqldao.SysDataCountMapper;
import com.dm.atform.util.RedisCache;
import com.dm.timer.RedisRecordDataCountTimer;

@Service
public class SysDataCountServiceImpl implements SysDataCountService {

	@Autowired
	private SysDataCountMapper mapper;
	@Autowired
	private RedisCache redis;
	
	@Autowired
	private AtTableService atTableService;
	@Autowired
	private MongoService mongo;
	/*@Override
	public Map getSysDataCount() {
		Map map = new HashMap();
		List<SysDataCount> list = this.mapper.selectListByArg(map);
		long full = 0l;
		long add = 0l;
		for(SysDataCount s:list){
			full+= s.getFullCount();
			add += s.getAddCount();
		}
		map.put("fullCount", full);
		map.put("addCount", add);
		return map;
	}*/
	@Override
	public Map getSysDataCount() {
		Map map = new HashMap();
		AtTable model = new AtTable();
		model.setType("1");
		map.put("model",model );
		List<AtTable> list = atTableService.findAllByArg(map);
		long full = 0l;
		long add = 0l;
		for(AtTable s:list){
			if(s.getpId()==null)
				full+= s.getDataCount();
		}
		Object lastFull = redis.get(RedisRecordDataCountTimer.DATA_COUNT_KEY);
		if(lastFull!=null){
			add = full-(long)lastFull;
		}
		//add += s.getAddCount();
		map.put("fullCount", full);
		map.put("addCount", add);
		return map;
	}
	@Override
	public long getCount(String tableName) {
		Long s = this.mapper.selectFullCountByTableName(tableName);
		if(s==null){
			s = this.mongo.getCount(tableName);
		}
		return s;
	}
	@Override
	public long getCount(AtTable table) {
		if(table.getWhereField()==null ||table.getWhereField().equals("")){
			return getCount(table.getTableName());
		}
		long s = mongo.getCount(table);
		return s;
	}

}
