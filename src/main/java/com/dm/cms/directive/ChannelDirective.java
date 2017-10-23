package com.dm.cms.directive;

import java.io.IOException;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsContent;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsContentService;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
 * @description 频道置标
 * @author dyt
 * @createTime 2015-12-13
 * @version 2.0
 */
public class ChannelDirective implements TemplateDirectiveModel {

	private Logger log  = LoggerFactory.getLogger(ChannelDirective.class);
	
	@Autowired
	CmsChannelService channelService;
	@Autowired
	CmsContentService cmsContentService;
	
	@Override
	public void execute(Environment env,Map params, TemplateModel[] model,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		Integer channelId = Integer.valueOf(getRequiredParam(params, "channelId"));
		CmsChannel cmsChannel = channelService.findOneById(channelId);
		if(cmsChannel==null){
			
		}else{
			if(cmsChannel.getChannelType().equals("3")){//单页
				CmsContent content = cmsContentService.findOneById(cmsChannel.getPageSize());
				if(content!=null)
					cmsChannel.setContentText(content.getContentText());
			}
		}
		env.setVariable("channel",ObjectWrapper.DEFAULT_WRAPPER.wrap(cmsChannel));
		body.render(env.getOut());  
	}
	
	String getRequiredParam(Map params,String key){  
        Object value = params.get(key);  
        if(StringUtils.isEmpty(value)) {  
           log.error("channelId 参数必须指定！");   
        }  
        
        return value.toString();  
    }

}
