package com.dm.cms.directive;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsContent;
import com.dm.cms.model.CmsSite;
import com.dm.cms.model.CmsVideo;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsContentService;
import com.dm.cms.service.CmsSiteService;
import com.dm.cms.service.CmsVideoService;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * 当前位置
 * 
 * @project com.dm.cms.directive.CurrentLocationDirective.java
 * @author wjl
 * @createdate 2015年12月18日 上午9:48:03
 */
public class CurrentLocationDirective implements TemplateDirectiveModel {
	@Autowired
	CmsContentService cmsContentService;
	@Autowired
	CmsChannelService cmsChannelService;
	@Autowired
	CmsVideoService CmsVideoService;
	@Autowired
	CmsSiteService cmsSiteService;
	@Value("${projectName}")
	String projectName;

	@Override
	public void execute(Environment env, Map param, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		StringBuffer stb = new StringBuffer();
		StringBuffer mstb = new StringBuffer();
		int flag = 1;
		String homePage = param.get("homePage") == null ? "首页" : param.get(
				"homePage").toString();
		String divider = param.get("divider") == null ? ">" : param.get(
				"divider").toString();
		Integer stopChannelId = param.get("stopChannelId") == null ? null
				: Integer.valueOf(param.get("stopChannelId").toString());
		if (param.get("contentId") != null) {
			Integer contentId = Integer.valueOf(param.get("contentId")
					.toString());
			CmsContent contentEntity = cmsContentService.findOneById(contentId);
			stb.insert(0, "正文");
			mstb.insert(0, "正文");
			CmsChannel parent = getParent(contentEntity.getChannelId(), stb,
					mstb, divider, flag, stopChannelId);
			if (stopChannelId == null) {
				CmsSite siteEntity = cmsSiteService.findOneById(parent
						.getSiteId());
				if (siteEntity.getIsHtml() != null && siteEntity.getIsHtml()) {
					String str = "<a href='" + siteEntity.getUrl() + "'>"
							+ homePage + "</a>" + divider;
					String mstr = "<a href='" + siteEntity.getmUrl() + "'>"
							+ homePage + "</a>" + divider;
					stb.insert(0, str);
					mstb.insert(0, mstr);
				} else {
					String str = "<a  href='/" + projectName + "/portal/"
							+ siteEntity.getDomain() + "/index.htm'>"
							+ homePage + "</a>" + divider;
					stb.insert(0, str);
					mstb.insert(0, str);
				}
			}
		} else {
			if (param.get("channelId") != null) {
				Integer channelId = Integer.valueOf(param.get("channelId")
						.toString());
				if (channelId != null) {
					CmsChannel channelEntity = cmsChannelService
							.findOneById(channelId);
					stb.insert(0, channelEntity.getDisplayName());
					mstb.insert(0, channelEntity.getDisplayName());
					CmsChannel parent = getParent(channelEntity.getPid(), stb,
							mstb, divider, flag, stopChannelId);
					if (parent == null) {
						parent = channelEntity;
					}
					if (stopChannelId == null) {
						CmsSite siteEntity = cmsSiteService.findOneById(parent
								.getSiteId());
						if (siteEntity.getIsHtml() != null
								&& siteEntity.getIsHtml()) {
							String str = "<a href='" + siteEntity.getUrl()
									+ "'>" + homePage + "</a>" + divider;
							String mstr = "<a href='" + siteEntity.getmUrl()
									+ "'>" + homePage + "</a>" + divider;
							stb.insert(0, str);
							mstb.insert(0, mstr);
						} else {
							String str = "<a  href='/" + projectName
									+ "/portal/" + siteEntity.getDomain()
									+ "/index.htm'>" + homePage + "</a>"
									+ divider;
							stb.insert(0, str);
							mstb.insert(0, str);
						}
					}
				}
			}
		}
		if (param.get("videoId") != null) {
			Integer videoId = Integer.valueOf(param.get("videoId").toString());
			CmsVideo video = this.CmsVideoService.findOne(videoId);
			stb.insert(0, "视频");
			mstb.insert(0, "视频");
			CmsChannel parent = getParent(video.getChannelId(), stb, mstb,
					divider, flag, stopChannelId);
			if (stopChannelId == null) {
				CmsSite siteEntity = cmsSiteService.findOneById(parent
						.getSiteId());
				if (siteEntity.getIsHtml() != null && siteEntity.getIsHtml()) {
					String str = "<a href='" + siteEntity.getUrl() + "'>"
							+ homePage + "</a>" + divider;
					String mstr = "<a href='" + siteEntity.getmUrl() + "'>"
							+ homePage + "</a>" + divider;
					stb.insert(0, str);
					mstb.insert(0, mstr);
				} else {
					String str = "<a  href='/" + projectName + "/portal/"
							+ siteEntity.getDomain() + "/index.htm'>"
							+ homePage + "</a>" + divider;
					stb.insert(0, str);
					mstb.insert(0, str);
				}
			}
		}
		env.setVariable("current", ObjectWrapper.DEFAULT_WRAPPER.wrap(stb));
		env.setVariable("mcurrent", ObjectWrapper.DEFAULT_WRAPPER.wrap(mstb));
		if (body != null) {
			body.render(env.getOut());
		}

	}

	private CmsChannel getParent(Integer channelId, StringBuffer stb,
			StringBuffer mstb, String serperator, int flag,
			Integer stopChannelId) {
		CmsChannel channel = cmsChannelService.findOneById(channelId);
		if (channel != null) {
			String str = "";
			String mstr = "";
			if (channel.getIsHtml()) {
				str = "<a  href='" + channel.getUrl() + "'>"
						+ channel.getDisplayName() + "</a>" + serperator;
				mstr = "<a  href='" + channel.getmUrl() + "'>"
						+ channel.getDisplayName() + "</a>" + serperator;
			} else {
				if(channel.getChannelType().equals("2")){
					mstr = str ="<a  href='" + channel.getUrl() + "'>"
							+ channel.getDisplayName() + "</a>" + serperator;
				}else{
					mstr = str = "<a  href='/" + projectName + "/portal/channel/"
						+ channel.getEnName() + "/" + channel.getId()
						+ "_1.htm'>" + channel.getDisplayName() + "</a>"
						+ serperator;
				}
			}
			stb.insert(0, str);
			mstb.insert(0, mstr);
			if(stopChannelId!=null && channel.getId().equals(stopChannelId)){
				return channel;
			}
			if (channel.getPid() != 0) {
				channel = getParent(channel.getPid(), stb, mstb, serperator,
						flag, stopChannelId);
			} else {
			}
		}
		return channel;
	}
}
