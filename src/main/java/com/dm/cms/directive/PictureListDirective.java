package com.dm.cms.directive;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.dm.cms.model.CmsContent;
import com.dm.cms.service.CmsContentService;
import com.github.pagehelper.PageInfo;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

public class PictureListDirective implements TemplateDirectiveModel{

	@Autowired
	CmsContentService cmsContentService;
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		Integer pageSize = params.get("pageSize") == null ? 12 : Integer.valueOf(params.get("pageSize")
				.toString());
		Integer pageNum = params.get("pageNum") == null ? 1 : Integer
				.valueOf(params.get("pageNum").toString());
		PageInfo<CmsContent> page= cmsContentService.selectIsPictures(pageNum, pageSize);
		List<CmsContent> contents = page.getList();
		if(params.get("titleLeft")!=null)
		{
			int titleLeft = Integer.valueOf(params.get("titleLeft").toString());
			for(CmsContent ce:contents)		{
				if(ce.getTitle().length()>titleLeft)
				{
				 ce.setShortTitle(ce.getTitle().substring(0,titleLeft));
				}
			}
		}
		env.setVariable("contents",ObjectWrapper.DEFAULT_WRAPPER.wrap(contents));
		body.render(env.getOut()); 
	}

}
