package com.dm.cms.directive;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.dm.cms.model.CmsContent;
import com.dm.cms.service.CmsContentService;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

public class TopOneDirective implements TemplateDirectiveModel {

	@Autowired
	CmsContentService cmsContentService;

	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		int len = Integer.valueOf(params.get("titleLeft")==null?"100":params.get("titleLeft").toString());
		CmsContent cmsContent = new CmsContent();
		List<CmsContent> list = this.cmsContentService.selectTopOne(params);
		// CmsContent cmsContent = cmsContentService.selectTopOne();
		boolean f = true;
		for (CmsContent content : list) {
			if (params.get("titleLeft") != null) {
				if (content.getTopTitle() == null
						|| content.getTopTitle().equals("")) {
					content.setTopTitle(content.getTitle());
				}
				if (content != null
						&& StringUtils.isNotEmpty(content.getTopTitle())
						&& content.getTopTitle().length() > len) {
					content.setTopTitle(content.getTopTitle().substring(
							0, len)
							+ "...");
				}
			}
			if(f){
				f = false;
				cmsContent = content;
			}
		}
		env.setVariable("cmsContents",
				ObjectWrapper.DEFAULT_WRAPPER.wrap(list));
		env.setVariable("cmsContent",
				ObjectWrapper.DEFAULT_WRAPPER.wrap(cmsContent));
		body.render(env.getOut());
	}

}
