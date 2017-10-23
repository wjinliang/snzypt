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

public class LeaderListDirective implements TemplateDirectiveModel{

	@Autowired
	LeaderService leaderService;
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		Integer pageSize = params.get("pageSize") == null ? 12 : Integer.valueOf(params.get("pageSize")
				.toString());
		Integer pageNum = params.get("pageNum") == null ? 1 : Integer
				.valueOf(params.get("pageNum").toString());
		Map m = new HashMap();
		m.put("org",params.get("org")== null ? null:params.get("org").toString());
		Map map = new HashMap();
		map.put("sort", "seq asc");
		map.put("model", m);
		List<Leader> leaders = leaderService.findByPage(pageNum, pageSize, map).getList();
		env.setVariable("leaders",ObjectWrapper.DEFAULT_WRAPPER.wrap(leaders));
		body.render(env.getOut());  
	}
}
