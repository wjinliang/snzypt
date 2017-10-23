package com.dm.cms.directive;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dm.cms.model.CmsAttachmentOther;
import com.dm.cms.model.CmsAudio;
import com.dm.cms.service.CmsAttachmentOtherService;
import com.dm.cms.service.CmsAudioService;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

public class AudioDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(NovelDirective.class);
	
	@Autowired
	CmsAudioService cmsAudioService;
	
	@Autowired 
	CmsAttachmentOtherService cmsAttachmentOtherService;
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		if(params.get("audioId")==null)
		{
			return ;
		}
		CmsAudio cmsAudio = cmsAudioService.findOne(Integer.valueOf(params.get("audioId").toString()));
		if(cmsAudio.getAttachmentIds()!=null)
		{
			List<CmsAttachmentOther> attachments = new ArrayList<CmsAttachmentOther>();
			String attachmentIdArray[] = cmsAudio.getAttachmentIds().split(",");
		    for(String attach:attachmentIdArray)
		    {
		    	CmsAttachmentOther cmsAttachmentOther = cmsAttachmentOtherService.findOneById(Integer.valueOf(attach));
	            attachments.add(cmsAttachmentOther);
		    }
		    env.setVariable("files", ObjectWrapper.DEFAULT_WRAPPER.wrap(attachments));
		}
		env.setVariable("cmsAudio",ObjectWrapper.DEFAULT_WRAPPER.wrap(cmsAudio));
		body.render(env.getOut());  
	}

}
