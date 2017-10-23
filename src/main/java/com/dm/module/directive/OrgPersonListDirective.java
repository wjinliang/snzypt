package com.dm.module.directive;

import java.io.IOException;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dm.module.model.OrgPerson;
import com.dm.module.service.OrgPersonService;
import com.github.pagehelper.PageInfo;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
 * siteId,pageSize,pageNum,type
 * @author 
 *
 */
public class OrgPersonListDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(OrgPersonListDirective.class);
	@Autowired
	private OrgPersonService orgPersonService;
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		
		Integer pageNum =1;
		Integer pageSize =10;
		if(params.get("pageNum")!=null)
		{
			pageNum = Integer.valueOf(params.get("pageNum").toString());
		}
		if(params.get("pageSize")!=null)
		{
			pageSize = Integer.valueOf(params.get("pageSize").toString());
		}
		OrgPerson model = new OrgPerson();
		params.put("model",model);
		PageInfo<OrgPerson> page = orgPersonService.findOrgPersonByPage(pageNum, pageSize, params);
		env.setVariable("orgPersons",ObjectWrapper.DEFAULT_WRAPPER.wrap(page.getList()));
		body.render(env.getOut());  
	}

}
