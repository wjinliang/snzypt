package com.dm.cms.directive;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dm.cms.model.CmsAttachmentOther;
import com.dm.cms.model.CmsVideo;
import com.dm.cms.service.CmsAttachmentOtherService;
import com.dm.cms.service.CmsVideoService;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

public class VideoDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(NovelDirective.class);
	
	@Autowired
	CmsVideoService cmsVideoService;
	
	@Autowired 
	CmsAttachmentOtherService cmsAttachmentOtherService;
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		if(params.get("vide0Id")==null)
		{
			return ;
		}
		CmsVideo cmsVideo = cmsVideoService.findOne(Integer.valueOf(params.get("videoId").toString()));
		if(cmsVideo.getAttachmentIds()!=null)
		{
			List<CmsAttachmentOther> attachments = new ArrayList<CmsAttachmentOther>();
			String attachmentIdArray[] = cmsVideo.getAttachmentIds().split(",");
		    for(String attach:attachmentIdArray)
		    {
		    	CmsAttachmentOther cmsAttachmentOther = cmsAttachmentOtherService.findOneById(Integer.valueOf(attach));
	            attachments.add(cmsAttachmentOther);
		    }
		    env.setVariable("files", ObjectWrapper.DEFAULT_WRAPPER.wrap(attachments));
		}
		env.setVariable("cmsVideo",ObjectWrapper.DEFAULT_WRAPPER.wrap(cmsVideo));
		body.render(env.getOut());  
	}

}
