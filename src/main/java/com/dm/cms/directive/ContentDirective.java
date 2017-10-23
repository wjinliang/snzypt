package com.dm.cms.directive;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.dm.cms.model.CmsContent;
import com.dm.cms.service.CmsContentService;
import com.dm.platform.model.FileEntity;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
 * @decription 内容置标
 * @author dyt
 *
 */
public class ContentDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(ChannelDirective.class);
	
	@Autowired
	CmsContentService cmsContentService;
	
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		
		int contentId = Integer.valueOf(getRequiredParam(params, "conentId").toString());
		CmsContent cmsContent = cmsContentService.findOneById(contentId);
		String attachmentsID = null;
		if(cmsContent!=null)
		{
			attachmentsID = cmsContent.getAttachmentIds();
		}
		List<FileEntity> attachments = null;
		String[] attachmentsIds = null;
		if(attachmentsID!=null)
		{
			attachmentsIds = attachmentsID.split(","); 
			attachments = new ArrayList<FileEntity>();
			for(String id:attachmentsIds)
			{
				
//				FileEntity attach =  fileService.findOne(id);
//				attachments.add(attach);
//				System.out.println(attach.getUrl()+"wwwwwwwwwwwwwwwwwwwwwwwww");
			}
			env.setVariable("files", ObjectWrapper.DEFAULT_WRAPPER.wrap(attachments));
		}
		env.setVariable("contents",ObjectWrapper.DEFAULT_WRAPPER.wrap(cmsContent));
		body.render(env.getOut());  
	}
	
	
	String getRequiredParam(Map params,String key){  
        Object value = params.get(key);  
        if(StringUtils.isEmpty(value)) {  
           log.error("contentId 参数必须指定！");   
        }  
        return value.toString();  
    }

}
