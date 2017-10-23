package com.dm.module.directive;

import java.io.IOException;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dm.module.model.Microcobol;
import com.dm.module.service.MicrocobolService;
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
public class MicrocobolListDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(MicrocobolListDirective.class);
	@Autowired
	private MicrocobolService microcobolService;
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		if(params.get("siteId")==null)
		{
			log.error("站点Id不能为空");
			return ;
		}
		
		Integer pageNum =1;
		Integer pageSize =1000;
		if(params.get("pageNum")!=null)
		{
			pageNum = Integer.valueOf(params.get("pageNum").toString());
		}
		if(params.get("pageSize")!=null)
		{
			pageSize = Integer.valueOf(params.get("pageSize").toString());
		}
		Microcobol model = new Microcobol();
		model.setIsHidden(false);
		String type =null;
		Integer 
			siteId = Integer.valueOf(params.get("siteId").toString());
		if(params.get("type")!=null)
		{
			type = params.get("type").toString();
		}
		model.setSiteId(siteId);
		model.setType(type);
		params.put("model",model);
		PageInfo<Microcobol> page = microcobolService.findMicrocobolByPage(pageNum, pageSize, params);
		env.setVariable("microcobols",ObjectWrapper.DEFAULT_WRAPPER.wrap(page.getList()));
		body.render(env.getOut());  
	}

}
