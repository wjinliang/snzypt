package com.dm.atform.directive;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dm.atform.model.AtTable;
import com.dm.atform.model.DataResourceRecord;
import com.dm.atform.service.AtTableService;
import com.dm.atform.service.MongoService;
import com.dm.atform.util.RedisCache;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
 * 数据资源首页各个记录
 * @author Mr.Jin
 *
 */
public class DataResourceRecordDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(DataResourceRecordDirective.class);
	@Autowired
	private AtTableService tableService;
	@Autowired
	private MongoService mongoService;
	@Autowired
	private RedisCache redisCache;
	private static final int redisTime=60*60*1;
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		String id = params.get("id")==null?null:params.get("id").toString();
		DataResourceRecord r = (DataResourceRecord)redisCache.get(id);
		
		if(r==null){
			r = new DataResourceRecord();
			getRecord(id,r);
			int s = redisTime+(int)(Math.random()*60*60);
			//redisCache.set(id, r,s);
		}
		env.setVariable("record",ObjectWrapper.DEFAULT_WRAPPER.wrap(r));
		body.render(env.getOut());  
	}

	private void getRecord(String id,DataResourceRecord r) {
		AtTable t = this.tableService.findOne(id);
		List<AtTable> list = getByPid(id);
		Set<String> tablelist = new HashSet<String>();
		int typeCount = 1;
		//long dataCount = 0;
		for(AtTable table:list){
			if(table.getType().equals("0")){
				tablelist.add(table.getTableName());
			}else{
				typeCount++;
				
			}
		}
		/*for(String tableName:tablelist){
			AtTable atTable = new AtTable();
			atTable.setTableName(tableName);
			try{
				//dataCount += this.mongoService.getCount(atTable);
				//dataCount = this.tableService.
			}catch(Exception e){
				System.err.println("查询MongoCount出错了:"+tableName);
				e.printStackTrace();
			}
		}*/
		r.setTypeCount(typeCount);
		r.setTableCount(tablelist.size());
		r.setDataCount(t.getDataCount());
		r.setKey(id);
		r.setTitle(t.getGridName());
		r.setInfo(t.getInfo());
		//r.setIncrementCount(incrementCount);
	}

	private List<AtTable> getByPid(String id) {
		List<AtTable> list = tableService.findByPid(id);
		List<AtTable> alllist = new ArrayList<AtTable>();
		alllist.addAll(list);
		for(AtTable table:list){
			alllist.addAll(getByPid(table.getId()));
		}
		return alllist;
	}

}
