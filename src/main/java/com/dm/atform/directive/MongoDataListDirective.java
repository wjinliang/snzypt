package com.dm.atform.directive;

import java.io.IOException;
import java.util.ArrayList;
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
import com.github.pagehelper.PageInfo;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
 * 获取Mongo数据
 * @author Mr.Jin
 *
 */
public class MongoDataListDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(MongoDataListDirective.class);
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
		Integer pageNum = params.get("pageNum")==null?1:Integer.valueOf(params.get("pageNum").toString());
		Integer pageSize = params.get("pageSize")==null?10:Integer.valueOf(params.get("pageSize").toString());
		Map searchMap = new HashMap();
		AtField f = new AtField();
		f.setTableId(tableId);
		searchMap.put("model", f);
		AtTable atTable = this.tableService.findOne(tableId);
		List<AtField> list = this.colService.findAll(searchMap);
		List<Map> gridItem = new ArrayList();
		List<Map> formItem = new ArrayList();
		for (AtField a : list) {
			if (a.getGridShow()) {
				gridItem.add(a.toGridItem());
			}
			if(a.getDetailShow()){
				formItem.add(a.toFormItem());
			}
		}
		PageInfo page = this.mongo.queryMulti1(atTable, pageNum,
				pageSize, new HashMap(), "");
		searchMap.put("page", page);
		searchMap.put("fields", gridItem);
		searchMap.put("formItem", formItem);
		env.setVariable("grid",ObjectWrapper.DEFAULT_WRAPPER.wrap(searchMap));
		body.render(env.getOut());  
	}

}
