package com.dm.cms.directive;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.dm.websurvey.model.Leader;
import com.dm.websurvey.service.LeaderService;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

public class LeaderDirective implements TemplateDirectiveModel{

	@Autowired
	LeaderService leaderService;
	
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		if(params.get("id")==null)
			return;
		String id = params.get("id").toString();
		Leader leader = leaderService.findOne(id);
		env.setVariable("leader",ObjectWrapper.DEFAULT_WRAPPER.wrap(leader));
		body.render(env.getOut());  
	}

}
