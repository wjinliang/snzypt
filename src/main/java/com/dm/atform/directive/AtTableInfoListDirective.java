package com.dm.atform.directive;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dm.atform.model.AtTable;
import com.dm.atform.service.AtTableService;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
 * 获取分类 表信息列表
 * @author Mr.Jin
 *
 */
public class AtTableInfoListDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(AtTableInfoListDirective.class);
	@Autowired
	private AtTableService tableService;
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		String tableId = params.get("id")==null?null:params.get("id").toString();
		if(tableId==null){
			env.setVariable("tables",
			        ObjectWrapper.DEFAULT_WRAPPER.wrap(new ArrayList<Object>()));
			return;
		}
		Map map = new HashMap();
		AtTable record = new AtTable();
		record.setpId(tableId);
		record.setType("0");
		record.setStatus("1");
		map.put("model", record);
		map.put("sort","seq asc" );
		List<AtTable> list = tableService.findAllByArg(map);
		AtTable t = this.tableService.findOne(tableId);
		if(t==null){
			env.setVariable("tables",
			        ObjectWrapper.DEFAULT_WRAPPER.wrap(new ArrayList<Object>()));
			return;
		}
		Integer count = (t.getVisitCount()==null?0:t.getVisitCount())+1;
		t.setVisitCount(count);
		this.tableService.upCount(t);
		int s = -1;
		if(list.size()==0){
			list.add(t);
		}else if(list.size()>1){
			for(int i=0;i<list.size();i++){
				AtTable tabl = list.get(i);
				tabl.setVisitCount(count);
				this.tableService.upCount(tabl);
				if(tabl.getId().equals(tableId)){
					s= i;
				}
			}
		}
		if(s!=-1){
			list.remove(s);
		}
		env.setVariable("tables",
		        ObjectWrapper.DEFAULT_WRAPPER.wrap(list));
	
		body.render(env.getOut());  
	}

}
