package com.dm.cms.directive;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.dm.cms.util.PageUtil;
import com.dm.platform.model.Org;
import com.dm.platform.service.OrgService;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

public class OrgListDirective implements TemplateDirectiveModel{

	
	@Autowired
	OrgService orgService;
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		Integer pageSize = params.get("pageSize") == null ? 12 : Integer.valueOf(params.get("pageSize")
				.toString());
		Integer pageNum = params.get("pageNum") == null ? 1 : Integer
				.valueOf(params.get("pageNum").toString());
		List<Org> orgs = orgService.listOrg(pageNum-1, pageSize);
		env.setVariable("orgs",ObjectWrapper.DEFAULT_WRAPPER.wrap(orgs));
		body.render(env.getOut());  
	}

}
