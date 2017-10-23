package com.dm.cms.directive;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsAudio;
import com.dm.cms.service.CmsAudioService;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsCommentService;
import com.dm.cms.service.CmsStatisticService;
import com.dm.cms.util.PageUtil;
import com.github.pagehelper.PageInfo;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

public class AudioListDirective implements TemplateDirectiveModel{

private Logger log  = LoggerFactory.getLogger(NovelDirective.class);
	
	@Autowired
	CmsAudioService cmsAudioService;
	@Autowired
	CmsChannelService cmsChannelService;
	
	@Autowired
	CmsStatisticService cmsStaticService;
	
	@Autowired
	CmsCommentService cmsCommentService;
	
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		if(params.get("channelId")==null)
		{
			log.error("channelId必须指定");
			return;
		}
		Integer order = Integer.valueOf(params.get("order")==null?"1":params.get("order").toString());
		params.put("order", "seq asc,publish_date desc");
		if(order==2)
		{
			params.put("order", "publish_date desc");
		}
		else
		{
			params.put("order", "create_time desc");
		}
		Integer pageSize = params.get("pageSize") == null ? 12 : Integer.valueOf(params.get("pageSize")
				.toString());
		Integer pageNum = params.get("pageNum") == null ? 1 : Integer
				.valueOf(params.get("pageNum").toString());
		
	    Integer channelId = Integer.valueOf(params.get("channelId").toString());
	    CmsAudio cmsAudio = new CmsAudio();
	    cmsAudio.setChannelId(channelId);
	    cmsAudio.setIsHtml(true);
	    params.put("model", cmsAudio);
	    CmsChannel cmsChannel = cmsChannelService.findOneById(cmsAudio.getChannelId());
	    PageInfo<CmsAudio> page = cmsAudioService.findBychannelIdArgMap(params, pageNum, pageSize);
	    List<CmsAudio> cmsAudios = page.getList();
	    boolean flag = false;
	    int titleLeft = 0;
	    if(params.get("titleLeft")!=null)
			{
		     titleLeft = Integer.valueOf(params.get("titleLeft").toString());
		    flag = true;
			}
			for(CmsAudio ce:cmsAudios)
			{
				if(flag)
				{
					if(ce.getName().length()>titleLeft)
					{
					 ce.setName(ce.getName().substring(0,titleLeft));
					}
				}
				int commentCount = cmsCommentService.selectCountByCmsContentId(ce.getId(),"6");
				int count = cmsStaticService.selectCountByContentId(ce.getId(), "6");
				ce.setCount(count);
				ce.setCommentCount(commentCount);
			}
	    env.setVariable("cmsAudios",ObjectWrapper.DEFAULT_WRAPPER.wrap(cmsAudios));
	    env.setVariable("pagination", ObjectWrapper.DEFAULT_WRAPPER
				.wrap(PageUtil.getInstance().channelPagination(cmsChannel,
						pageNum, page.getTotal(), pageSize)));
	    env.setVariable("paginationMobile", ObjectWrapper.DEFAULT_WRAPPER
				.wrap(PageUtil.getInstance().channelMobilePagination(cmsChannel,
						pageNum, page.getTotal(), pageSize)));
		env.setVariable("paginationlist",
		        ObjectWrapper.DEFAULT_WRAPPER.wrap(PageUtil.getInstance().channelPaginationList(cmsChannel,pageNum,page.getTotal(),pageSize)));
	    
		body.render(env.getOut());  
	}
}
