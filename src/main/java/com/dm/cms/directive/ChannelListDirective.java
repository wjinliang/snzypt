package com.dm.cms.directive;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

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
 * @description 频道列表
 * @author dyt
 * @version 2.0
 * @createTime 2015-12-14
 */
public class ChannelListDirective implements TemplateDirectiveModel{

	private Logger log = LoggerFactory.getLogger(ChannelListDirective.class);
	
	@Autowired
	CmsChannelService cmsChannelService;
	@Autowired
	CmsContentService cmsContentService;
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		
		if(params.get("siteId")==null && params.get("channelId")==null)
		{
			log.error("siteId和channelId必须指定一个");
			return;
		}
		Integer order = Integer.valueOf(params.get("order")==null?"1":params.get("order").toString());
		params.put("order", "seq asc");
		if(order==2)
		{
			params.put("order", "seq desc");
		}
		Integer siteId = params.get("siteId")==null?null:Integer.valueOf(params.get("siteId").toString());
		Integer channelId = params.get("channelId")==null?null:Integer.valueOf(params.get("channelId").toString());
		params.put("siteId", siteId );
		params.put("channelId", channelId);
		if(params.get("excludeIds")!=null)
		{
		String[] excludeIds = params.get("excludeIds").toString().split(",");
		params.put("excludeIds", excludeIds);
		}
		params.put("forbidden", 0);//默认隐藏的就不展示
		if(params.get("all")!=null)
		{
			String all = params.get("all").toString();
			if(all.equals("ture")||all.equals("1"))
			params.put("forbidden", null);
		}
		
		if(params.get("includeIds")!=null)
		{
		String[] cludeIds = params.get("includeIds").toString().split(",");
		params.put("includeIds", cludeIds);
		}
		if(params.get("channelType")!=null)
		{ 
		params.put("channelType", String.valueOf(params.get("channelType")));
		}
		List<CmsChannel> cmsChannels = cmsChannelService.findByRoot(params);
		log.debug("-------params------{}",params);
		log.debug("-------channelIds------{}",cmsChannels.size());
		for(CmsChannel c:cmsChannels){
			if(c!=null && c.getChannelType().equals("3")){//单页
				CmsContent content = cmsContentService.findOneById(c.getPageSize());
				if(content!=null)
					c.setContentText(content.getContentText());
			}
		}
		env.setVariable("channels",ObjectWrapper.DEFAULT_WRAPPER.wrap(cmsChannels));
		body.render(env.getOut());  
	}
}
