package com.dm.cms.directive;

import java.io.IOException;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dm.cms.model.CmsAdvertising;
import com.dm.cms.service.CmsAdvertisingService;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

public class AdvertisingDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(NovelDirective.class);
	@Autowired
	private CmsAdvertisingService cmsAdvertisingService;
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		if(params.get("adId")==null)
		{
			return ;
		}
		CmsAdvertising cmsAdvertising = cmsAdvertisingService.load(Integer.valueOf(params.get("adId").toString()));
		env.setVariable("advertising",ObjectWrapper.DEFAULT_WRAPPER.wrap(cmsAdvertising));
		body.render(env.getOut());  
	}

}
