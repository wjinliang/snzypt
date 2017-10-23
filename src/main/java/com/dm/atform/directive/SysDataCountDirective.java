package com.dm.atform.directive;

import java.io.IOException;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dm.atform.service.SysDataCountService;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
 * map.put("fullCount", full);
 * map.put("addCount", add);
 * @author Mr.Jin
 *
 */
public class SysDataCountDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(SysDataCountDirective.class);
	@Autowired
	private SysDataCountService service;
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		
		Map map = service.getSysDataCount();
		env.setVariable("record",ObjectWrapper.DEFAULT_WRAPPER.wrap(map));
		body.render(env.getOut());  
	}

}
