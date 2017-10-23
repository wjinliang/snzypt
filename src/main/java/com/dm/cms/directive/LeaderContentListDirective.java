package com.dm.cms.directive;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsContent;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsContentService;
import com.dm.cms.util.PageUtil;
import com.github.pagehelper.PageInfo;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
 * @description 内容列表置标
 * @author dyt
 * @version 2.0
 * @createTime 2015-12-24
 */
public class LeaderContentListDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(LeaderContentListDirective.class);
	
	@Autowired
	CmsContentService cmsContentService;
	
	@Autowired
	CmsChannelService cmsChannelService;
	
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		Integer pageSize = params.get("pageSize") == null ? 12 : Integer.valueOf(params.get("pageSize")
				.toString());
		Integer pageNum = params.get("pageNum") == null ? 1 : Integer
				.valueOf(params.get("pageNum").toString());
		String leaderId = params.get("leaderId")==null?null:params.get("leaderId").toString();
		PageInfo<CmsContent> page= cmsContentService.findLeaderContentsByPage(pageNum, pageSize,leaderId);
		List<CmsContent> contents = page.getList();
		long total = page.getTotal();
		if(params.get("titleLeft")!=null)
		{
			int titleLeft = Integer.valueOf(params.get("titleLeft").toString());
			for(CmsContent ce:contents)		{
				if(ce.getTitle().length()>titleLeft)
				{
				 ce.setShortTitle(ce.getTitle().substring(0,titleLeft)+"...");
				}
			}
		}
		env.setVariable("contents",ObjectWrapper.DEFAULT_WRAPPER.wrap(contents));
		body.render(env.getOut());  
	}
	

}
