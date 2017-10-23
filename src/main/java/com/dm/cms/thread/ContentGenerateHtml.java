package com.dm.cms.thread;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.dm.cms.model.CmsAudio;
import com.dm.cms.model.CmsContent;
import com.dm.cms.model.CmsNovel;
import com.dm.cms.model.CmsVideo;
import com.dm.cms.service.CmsAudioService;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsContentService;
import com.dm.cms.service.CmsNovelService;
import com.dm.cms.service.CmsVideoService;
import com.dm.cms.sqldao.CmsContentMapper;

/**
 * 
 * @project com.dm.cms.thread.ContentGenerateHtml.java
 * @author wjl
 * @createdate 2015年12月30日 上午9:25:56
 */
@Component
@Scope("prototype")
public class ContentGenerateHtml implements Runnable {
	String siteChannelContent ;
	private int channelId;
	private HttpServletRequest request;
	private String channelType;
	@Autowired
	private CmsContentService contentService;
	@Autowired
	private CmsContentMapper cmsContentMapper;
	@Autowired
	private CmsChannelService cmsChannelService;
	@Autowired
	private CmsVideoService cmsVideoService;
	@Autowired
	private CmsAudioService cmsAudioService;
	@Autowired
	private CmsNovelService cmsNovelService;
    
	@SuppressWarnings("unchecked")
	@Override
	public void run() {
		if(siteChannelContent.indexOf("content")!=-1)
		{
			Map argMap = new HashMap();
			argMap.put("order", "seq desc,publish_date desc");
			argMap.put("channelId", channelId);
			List<String> status = new ArrayList<String>();
			if(siteChannelContent.indexOf("content0")!=-1)
			{
				status.add("0");
			}
			if(siteChannelContent.indexOf("content1")!=-1)
			{
				status.add("1");
			}
			if(siteChannelContent.indexOf("content2")!=-1)
			{
				status.add("2");
			}
			argMap.put("status",status);
			//只静态化已发布的
			int pageNum = 1;
			int pageSize = 50;
			argMap.put("pageSize", pageSize);
		if(channelType.equals("0")||channelType.equals("10")||channelType.equals("11"))
			{
				while (true) {
					argMap.put("pageStart", (pageNum-1)*pageSize);
		//			PageHelper.startPage(pageNum, pageSize);
					List<CmsContent> contents = cmsContentMapper.selectRecordByPage(argMap);
		//			PageInfo<CmsContent> pageInfo = new PageInfo<CmsContent>(cmsContents);
		//			List<CmsContent> contents = pageInfo.getList();
					if (contents.size() <= 0) {
						break;
					}
					for (CmsContent c : contents) {
						this.contentService.generateHtml(request, c.getId());
					}
					pageNum++;
			  }
			}
			else if(channelType.equals("5"))
				{
					while (true) {
						argMap.put("pageStart", (pageNum-1)*pageSize);
						List<CmsVideo> cmsVideos = cmsVideoService.selectPageListByMap(argMap);
						if (cmsVideos==null || cmsVideos.size() <= 0) {
							break;
						}
						for (CmsVideo c : cmsVideos) {
							cmsVideoService.generatorHtml(request, c.getId());
						}
						pageNum++;
				  }
	            } 
			else if(channelType.equals("6"))
			{
				while (true) {
					argMap.put("pageStart", (pageNum-1)*pageSize);
					List<CmsAudio> cmsAudios = cmsAudioService.selectPageListByMap(argMap);
		//			List<CmsContent> contents = pageInfo.getList();
					if (cmsAudios==null || cmsAudios.size() <= 0) {
						break;
					}
					for (CmsAudio c : cmsAudios) {
						cmsAudioService.generatorHtml(request, c.getId());
					}
					pageNum++;
			  }
            } 
			else if(channelType.equals("7"))
			{
				while (true) 
				{
					argMap.put("pageStart", (pageNum-1)*pageSize);
					List<CmsNovel> cmsNovels = cmsNovelService.selectPageListByMap(argMap);
		//			List<CmsContent> contents = pageInfo.getList();
					if (cmsNovels==null || cmsNovels.size() <= 0) {
						break;
					}
					for (CmsNovel c : cmsNovels) {
						cmsNovelService.generatorHtml(c.getId(), request);
					}
					pageNum++;
			    }
            } 
		}
		if(siteChannelContent.indexOf("channel")!=-1)
		{
		 cmsChannelService.generateHtml(request, channelId);
		}
	}

	public void setChannelId(int channelId) {
		this.channelId = channelId;

	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;

	}

	public String getSiteChannelContent() {
		return siteChannelContent;
	}

	public void setSiteChannelContent(String siteChannelContent) {
		this.siteChannelContent = siteChannelContent;
	}

	public String getChannelType() {
		return channelType;
	}

	public void setChannelType(String channelType) {
		this.channelType = channelType;
	}

}
