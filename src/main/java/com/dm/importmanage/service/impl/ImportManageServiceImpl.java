package com.dm.importmanage.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import com.dm.importmanage.model.ExclImportConf;
import com.dm.importmanage.service.ImportManageService;
import com.dm.importmanage.sqldao.ExclImportConfMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ImportManageServiceImpl implements ImportManageService {
	@Autowired
	private ExclImportConfMapper confMapper;
	@Autowired
	private MongoTemplate mongoTemplate;

	@Override
	public PageInfo<ExclImportConf> findByPage(Integer pageNum,
			Integer pageSize, Map map) {
		PageHelper.startPage(pageNum, pageSize);
		List<ExclImportConf> list = this.confMapper.selectByArgMap(map);
		PageInfo<ExclImportConf > page = new PageInfo<ExclImportConf>(list);
		return page;
	}

	@Override
	public void save(ExclImportConf conf) {
		conf.setCreatime(new Date());
		this.confMapper.insert(conf);
		
	}

	@Override
	public void update(ExclImportConf conf) {
		this.confMapper.updateByPrimaryKey(conf);
		
	}

	@Override
	public void delete(ExclImportConf conf) {
		this.confMapper.deleteByPrimaryKey(conf.getId());
		
	}

	@Override
	public ExclImportConf findById(Integer id) {
		return this.confMapper.selectByPrimaryKey(id);
	}

	@Override
	public Object findOption() {
		List<ExclImportConf> list = this.confMapper.selectByArgMap(null);
		List options = new ArrayList();
		for(ExclImportConf c:list){
			Map m = new HashMap();
			m.put("text", c.getName());
			m.put("value", c.getId());
			options.add(m);
		}
		
		return options;
	}

	@Override
	public ExclImportConf selectByTableName(String tableName) {
		return this.confMapper.selectByTableName(tableName);
	}

}
