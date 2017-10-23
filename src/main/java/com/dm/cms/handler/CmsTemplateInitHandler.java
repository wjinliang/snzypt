package com.dm.cms.handler;

import com.dm.cms.model.CmsTemplate;
import com.dm.cms.model.CmsTemplateBlob;
import com.dm.cms.service.CmsTemplateService;
import com.dm.platform.util.FileUtil;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.util.List;

/**
 * Created by cgj on 2015/12/6.
 */
@Component public class CmsTemplateInitHandler {
    private static final Logger logger = LoggerFactory.getLogger(CmsTemplateInitHandler.class);
    @Autowired CmsTemplateService cmsTemplateService;

    @PostConstruct public void init() {
        List<CmsTemplate> list = cmsTemplateService.findCmsTemplateList(null);
        for (CmsTemplate cmsTemplate : list) {
            String targetPath = System.getProperty("web.root") + cmsTemplate
                .getTemplatePath();
            if (!FileUtils.getFile(targetPath).exists()) {
                logger.error("模板文件不存在：[{}]，开始写入", cmsTemplate.getId());
                CmsTemplateBlob cmsTemplateBlob =
                    cmsTemplateService.findBlobByBlobId(cmsTemplate.getTemplateBlobId());
                try {
                    FileUtil.createFile(
                        System.getProperty("web.root") + cmsTemplate
                            .getTemplatePath(), cmsTemplateBlob.getTemplateBlob());
                } catch (IOException e) {
                    logger.error("写入模板文件错误：[{}]", cmsTemplate.getId());
                    e.printStackTrace();
                }
            }
        }
        logger.info("初始化模板文件完成。");
    }
}
