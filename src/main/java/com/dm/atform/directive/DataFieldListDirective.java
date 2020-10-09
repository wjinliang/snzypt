package com.dm.atform.directive;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dm.atform.model.AtField;
import com.dm.atform.model.AtTable;
import com.dm.atform.service.AtFieldService;
import com.dm.atform.service.AtTableService;
import com.dm.atform.service.MongoService;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
 * 配置设置
 * @author Mr.Jin
 *
 */
public class DataFieldListDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(DataFieldListDirective.class);
	@Autowired
	private AtTableService tableService;
	
	@Autowired
	private AtFieldService colService;

	@Autowired
	private MongoService mongo;
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		//String sort = params.get("sort")==null?"seq":params.get("sort").toString();
		String tableId = params.get("tableId")==null?null:params.get("tableId").toString();
		Map searchMap = new HashMap();
		AtField f = new AtField();
		f.setTableId(tableId);
		searchMap.put("model", f);
		AtTable atTable = this.tableService.findOne(tableId);
		List<AtField> list = this.colService.findAll(searchMap);
		env.setVariable("fields",ObjectWrapper.DEFAULT_WRAPPER.wrap(list));
		body.render(env.getOut());  
	}

}
