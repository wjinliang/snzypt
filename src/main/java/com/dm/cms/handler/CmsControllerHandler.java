package com.dm.cms.handler;

import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsContent;
import com.dm.cms.model.CmsSite;
import com.dm.cms.model.CmsTemplate;
import com.dm.cms.service.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mobile.device.Device;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by cgj on 2015/11/23.
 */
public class CmsControllerHandler {
    @Autowired protected CmsSiteService cmsSiteService;
    @Autowired protected CmsChannelService cmsChannelService;
    @Autowired protected CmsContentService cmsContentService;
    @Autowired protected CmsTemplateService cmsTemplateService;
    @Autowired protected CmsAttachmentService cmsAttachmentService;
    @Autowired protected CmsNovelService cmsNovelService;
    @Value("${template.mobileBasePath}")
	String mobileFolder;
	@Value("${template.basePath}")
	String templateFolder;

    protected String getWholePath() {
        HttpServletRequest request =
            ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String path = request.getContextPath();
        String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + path;
        return basePath;
    }

    public String siteUrl(CmsSite cmsSite,Device device) {
        if (cmsSite.getIsHtml()) {
            return "redirect:" + getWholePath() + "/html/" + cmsSite.getDomain() + "/index.html";
        } else {
            return getTemplatePath(cmsSite.getTemplateId(),device.isMobile());
        }
    }

    public String channelUrl(CmsChannel cmsChannel,Device device) {
        if (cmsChannel.getIsHtml()) {
            return "redirect:" + getWholePath() + "/html/" + cmsChannel.getSiteDomain() + "/"
                + cmsChannel.getEnName() + ".html";
        } else {
            return getTemplatePath(cmsChannel.getTemplateId(),device.isMobile());
        }
    }

    public String contentUrl(CmsContent cmsContent,Device device) {
        if (cmsContent.getIsHtml()) {
            return "redirect:" + getWholePath() + "/html/" + cmsContent.getSiteDomain() + "/"
                + cmsContent.getChannelEnName() + "/" + cmsContent.getId() + ".html";
        } else {
            return getTemplatePath(cmsContent.getTemplateId(),device.isMobile());
        }
    }
    private String getTemplatePath(Integer tempateId,boolean isMobile)
    {
    	 CmsTemplate cmsTemplate = cmsTemplateService.findOneById(tempateId);
    	 String template = cmsTemplate.getTemplatePath().replace(".ftl", "");
    	 if(isMobile){
    		 template = template.replace(templateFolder, mobileFolder);
    	 }
         return template;
    }

}
