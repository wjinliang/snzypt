package com.dm.cms.directive;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.dm.cms.model.CmsAudio;
import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsContent;
import com.dm.cms.model.CmsNovel;
import com.dm.cms.model.CmsVideo;
import com.dm.cms.model.CmsVisitCountVo;
import com.dm.cms.service.CmsAudioService;
import com.dm.cms.service.CmsCommentService;
import com.dm.cms.service.CmsContentService;
import com.dm.cms.service.CmsNovelService;
import com.dm.cms.service.CmsStatisticService;
import com.dm.cms.service.CmsVideoService;
import com.dm.cms.sqldao.CmsChannelMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * 内容排行置标
 * 
 * @project com.dm.cms.directive.ContentVisitListDirective.java
 * @author wjl
 * @createdate 2016年1月9日 下午8:35:21
 */
public class ContentVisitListDirective implements TemplateDirectiveModel {

	private Logger log = LoggerFactory
			.getLogger(ContentVisitListDirective.class);
	@Autowired
	private CmsContentService cmsContentService;
	
	@Autowired
	private CmsVideoService cmsVideoService;
	@Autowired
	private CmsAudioService cmsAudioService;
	@Autowired
	private CmsNovelService cmsNovelService;
	
	@Autowired
	private CmsStatisticService cmsStatisticService;
	@Autowired
	private CmsChannelMapper cmsChannelMapper;

	@Autowired
	CmsCommentService cmsCommentService;
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		Integer siteId = params.get("siteId") == null ? null : Integer
				.valueOf(params.get("siteId").toString());
		Integer channelId = params.get("channelId") == null ? null : Integer
				.valueOf(params.get("channelId").toString());
		Integer pageSize = params.get("pageSize") == null ? 10 : Integer
				.valueOf(params.get("pageSize").toString());
		Integer pageNum = params.get("pageNum") == null ? 1 : Integer
				.valueOf(params.get("pageNum").toString());
		Integer days = params.get("days") == null ? null : Integer.valueOf(params
				.get("days").toString());
		String contentType = params.get("contentType") ==null ?null:params.get("contentType").toString();
		CmsChannel channel = null;
		if(channelId!=null){
			channel = this.cmsChannelMapper.selectByPrimaryKey(channelId);
			contentType = channel.getChannelType();
		}
		CmsVisitCountVo cmsVisitCountVo = new CmsVisitCountVo();
		cmsVisitCountVo.setChannelId(channelId);
		cmsVisitCountVo.setSiteId(siteId);
		cmsVisitCountVo.setChannelType(contentType);
		PageInfo<CmsVisitCountVo> page = this.cmsStatisticService
				.contentVisitList(pageNum, pageSize, cmsVisitCountVo, days);
		List<CmsVisitCountVo> contents = page.getList();
		/*if(contentType.equals("0"))
		{
		if(contents.size()<pageSize){
			Integer pagesize = pageSize-contents.size();
			Map map = new HashMap();
			if(channelId!=null){
				CmsContent c = new CmsContent();
				c.setChannelId(channelId);
				map.put("model",c);
			}
			PageInfo<CmsContent> cmsContent = this.cmsContentService.findCmsContentByPage(1, pagesize, map);
			List<CmsContent> cs = cmsContent.getList();
			for(CmsContent c:cs){
				CmsVisitCountVo e = new CmsVisitCountVo();
				e.setTitle(c.getTitle());
				e.setUrl(c.getUrl());
				contents.add(e);
			}
		}
		}*/
			/*else if(contentType.equals("5"))
			{
				setCmsVideo(contents,pageSize);
			}
			else if(contentType.equals("6"))
			{
				setCmsAudio(contents,pageSize);
			}
			else if(contentType.equals("7"))
			{
				setCmsNovel(contents,pageSize);
			}*/
		if(params.get("titleLeft")!=null)
		{
			int titleLeft = Integer.valueOf(params.get("titleLeft").toString());
			for(CmsVisitCountVo ce:contents)
			{
				if(ce.getTitle().length()>titleLeft)
				{
					ce.setTitle(ce.getTitle().substring(0,titleLeft));
				}
			}
		}
		env.setVariable("contentVisitList",
				ObjectWrapper.DEFAULT_WRAPPER.wrap(contents));
		body.render(env.getOut());
	}

	
	
	
	private void setCmsNovel(List<CmsVisitCountVo> contents, Integer pageSize) {
		// TODO Auto-generated method stub
		if(contents.size()>0)
		{
			for(CmsVisitCountVo novel:contents)
			{
		       CmsNovel cmsNovel = cmsNovelService.findById(novel.getContentId());
		       novel.setImageUrl(cmsNovel.getImageUrl());
		       novel.setAuthor(cmsNovel.getAuthor());
		       novel.setTitle(cmsNovel.getName());
			}
		}
	}




	private void setCmsAudio(List<CmsVisitCountVo> contents, Integer pageSize) {
		// TODO Auto-generated method stub
		if(contents.size()>0)
		{
			for(CmsVisitCountVo audio:contents)
			{
				 CmsAudio cmsAudio = cmsAudioService.findOne(audio.getContentId());
				 audio.setImageUrl(cmsAudio.getImageUrl());
				 audio.setAuthor(cmsAudio.getSinger());
				 audio.setTitle(cmsAudio.getName());
			}
		}
	}




	private void setCmsVideo(List<CmsVisitCountVo> contents,Integer pageSize) {
		// TODO Auto-generated method stub
		if(contents.size()>0)
		{
			for(CmsVisitCountVo video :  contents)
			{
				 CmsVideo cmsVideo = cmsVideoService.findOne(video.getContentId());
				 video.setImageUrl(cmsVideo.getImageUrl());
				 video.setAuthor(cmsVideo.getDirector());
				 video.setTitle(cmsVideo.getName());
			}
		}
	}




	String getRequiredParam(Map params, String key) {
		Object value = params.get(key);
		if (StringUtils.isEmpty(value)) {
			log.error("channelId 参数必须指定！");
		}
		return value.toString();
	}

}
