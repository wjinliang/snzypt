package com.dm.cms.directive;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsVideo;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsCommentService;
import com.dm.cms.service.CmsStatisticService;
import com.dm.cms.service.CmsVideoService;
import com.dm.cms.util.PageUtil;
import com.github.pagehelper.PageInfo;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

public class VideoListDirective implements TemplateDirectiveModel{

	@Autowired
	CmsVideoService cmsVideoService;
	@Autowired
	CmsChannelService cmsChannelService;
	@Autowired
	CmsStatisticService cmsStaticService;
	
	@Autowired
	CmsCommentService cmsCommentService;
	
	private Logger log = LoggerFactory.getLogger(ChannelListDirective.class);
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
		params.put("order", "publish_date desc");
		if(order==2)
		{
			params.put("order", "seq asc,publish_date desc");
		}
		/*else
		{
			params.put("order", "create_time desc");
		}*/
		Integer pageSize = params.get("pageSize") == null ? 12 : Integer.valueOf(params.get("pageSize")
				.toString());
		Integer pageNum = params.get("pageNum") == null ? 1 : Integer
				.valueOf(params.get("pageNum").toString());
		
	    Integer channelId = Integer.valueOf(params.get("channelId").toString());
	    CmsVideo cmsVideo = new CmsVideo();
	    cmsVideo.setChannelId(channelId);
	    cmsVideo.setIsHtml(true);
	    params.put("model", cmsVideo);
	    CmsChannel cmsChannel = cmsChannelService.findOneById(cmsVideo.getChannelId());
	    PageInfo<CmsVideo> page = cmsVideoService.findBychannelIdArgMap(params, pageNum, pageSize);
	    List<CmsVideo> cmsVideos = page.getList();
	    if(params.get("titleLeft")!=null)
		{
			int titleLeft = Integer.valueOf(params.get("titleLeft").toString());
			for(CmsVideo ce:cmsVideos)
			{
				if(ce.getName().length()>titleLeft)
				{
				 ce.setShortName(ce.getName().substring(0,titleLeft)+"...");
				}
			}
		}
	    for(CmsVideo ce:cmsVideos)
		{
			int commentCount = cmsCommentService.selectCountByCmsContentId(ce.getId(),"5");
			int count = cmsStaticService.selectCountByContentId(ce.getId(), "5");
			{
			 ce.setCount(count);
			 ce.setCommentCount(commentCount);
			}
		}
	    env.setVariable("cmsVideos",ObjectWrapper.DEFAULT_WRAPPER.wrap(cmsVideos));
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
