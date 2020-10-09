package com.dm.atform.directive;

import java.io.IOException;
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
 * 数据资源信息
 * @author Mr.Jin
 *
 */
public class AtTableInfoDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(AtTableInfoDirective.class);
	@Autowired
	private AtTableService tableService;
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		String id = params.get("id")==null?null:params.get("id").toString();
		if(id==null){
			env.setVariable("tableInfo",ObjectWrapper.DEFAULT_WRAPPER.wrap(new AtTable()));
			body.render(env.getOut());  
			return;
		}
		AtTable at = tableService.findOne(id);
		env.setVariable("tableInfo",ObjectWrapper.DEFAULT_WRAPPER.wrap(at));
		body.render(env.getOut());  
	}

}
