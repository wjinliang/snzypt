package com.dm.importmanage.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.dm.importmanage.model.ExclImportConf;
import com.dm.importmanage.model.ExclImportLog;
import com.dm.importmanage.service.ImportLogService;
import com.dm.importmanage.service.InitXzcCode;
import com.dm.importmanage.sqldao.ExclImportConfMapper;
import com.dm.importmanage.sqldao.ExclImportLogMapper;
import com.dm.importmanage.utils.ImportUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

@Service
public class ImportLogServiceImpl implements ImportLogService {
	@Autowired
	private ExclImportLogMapper logMapper;
	@Autowired
	private ExclImportConfMapper confMapper;
	@Autowired
	private MongoTemplate mongoTemplate;
	@Autowired
	private InitXzcCode initXzcCode;

	@Override
	public PageInfo<ExclImportLog> findLogByPage(Integer pageNum,
			Integer pageSize, Map map) {
		PageHelper.startPage(pageNum, pageSize);
		List<ExclImportLog> list = this.logMapper.selectByArgMap(map);
		PageInfo<ExclImportLog> page = new PageInfo<ExclImportLog>(list);
		return page;
	}

	@Override
	public void importExcel(ExclImportLog log) {
		ExclImportConf conf = null;
		if (log.getConfId() != null) {
			conf = confMapper.selectByPrimaryKey(log.getConfId());
		}
		List<DBObject> list = getList(log, conf, null);
		if (conf != null) {
			log.setTableName(conf.getTableName());
			log.setEndRow(conf.getEndRow());
			log.setStartRow(conf.getStartRow());
			log.setImportTime(new Date());
			log.setStatus("1");
		}
		
		DBCollection coll = mongoTemplate.getCollection(log.getTableName());	
		BasicDBObject bdb=new BasicDBObject();
		List newList=new ArrayList();
		
		for(int i=0;i<list.size();i++){
			if(conf.getCollectionKey()!=null){
				String keys[]=conf.getCollectionKey().split(",");	
				for(int j=0;j<keys.length;j++){
					bdb.append(keys[j], list.get(i).get(keys[j]));
				}
			}
			DBCursor cursor= coll.find(bdb);
			if(cursor.hasNext()){
			     DBObject obj = cursor.next();
			     coll.remove(obj);
				newList.add(list.get(i));
			}else{
				newList.add(list.get(i));
			}
		}
		coll.insert(newList);
		
		this.logMapper.insert(log);
		//initxzcCode( conf);
	}

	@Async
	public void initxzcCode(ExclImportConf conf) {
		if(conf==null)return;
		if(StringUtils.hasText(conf.getEnName())){
			this.initXzcCode.updateTableCode(conf.getTableName(), conf.getEnName(), "id", 3);
		}
		
	}
	@Override
	public void doxzc(Integer id){
		ExclImportConf conf = this.confMapper.selectByPrimaryKey(id);
		initxzcCode(conf);
	}
	@Override
	public List test(ExclImportLog log) {
		ExclImportConf conf = null;
		if (log.getConfId() != null) {
			conf = confMapper.selectByPrimaryKey(log.getConfId());
		}
		return getList(log, conf, 5);
	}

	private List getList(ExclImportLog log, ExclImportConf conf, Integer flag) {
		List<DBObject> list = null;
		Integer startRow = null, endRow = null, titleRow = null;
		int[] index = null;
		String[] field = null;
		String instr = null, namestr = null;
		if (conf != null) {
			startRow = conf.getStartRow();
			endRow = conf.getEndRow();
			instr = conf.getCollectionIndexs();
			namestr = conf.getCollectionNames();
		} else {
			startRow = log.getStartRow();
			endRow = log.getEndRow();
			titleRow = log.getTitleRow();
		}
		if (StringUtils.hasText(instr)) {
			String[] ss = instr.split(",");
			index = new int[ss.length];
			int i = 0;
			for (String s : ss) {
				index[i++] = Integer.valueOf(s);
			}
		}
		if (StringUtils.hasText(namestr)) {
			field = namestr.split(",");
		}
		if (flag != null) {
			endRow = startRow + flag;
		}
		list = ImportUtils.daoru(log.getFilePath(), index, field, startRow,
				endRow, titleRow);
		return list;
	}

	@Override
	public void autoconf(ExclImportLog log) {
		ExclImportConf record = new ExclImportConf();
		record = ImportUtils.getConf(log);
		ExclImportConf conf = null;
		do{
			String s = record.getTableName();
			conf = confMapper.selectByTableName(s);
			if(conf!=null){
				int rm = (int)(100*Math.random());
				record.setTableName(s+rm);
				record.setName(record.getName()+rm);
			}
		}while(conf!=null);
		this.confMapper.insert(record);

	}
	
	@Override
	public void delData(Integer id){
		ExclImportConf conf = this.confMapper.selectByPrimaryKey(id);
		String tableName=conf.getTableName();
		mongoTemplate.dropCollection(tableName);
	}

}
