package com.dm.cms.directive;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dm.cms.model.CmsAdvertising;
import com.dm.cms.service.CmsAdvertisingService;
import com.dm.platform.util.DmDateUtil;
import com.github.pagehelper.PageInfo;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

public class AdvertisingListDirective implements TemplateDirectiveModel {

	private Logger log = LoggerFactory.getLogger(NovelDirective.class);

	@Autowired
	private CmsAdvertisingService cmsAdvertisingService;

	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		if (params.get("siteId") == null) {
			log.error("adDrictive siteId必须指定");
			return;
		}
		Integer pageSize = params.get("pageSize") == null ? 100 : Integer
				.valueOf(params.get("pageSize").toString());

		Long siteId = Long.valueOf(params.get("siteId").toString());
		CmsAdvertising ad = new CmsAdvertising();
		ad.setSiteId(siteId);
		//ad.setEnabled(true);
		/*if (params.get("checkDate") != null
				&& Boolean.valueOf(params.get("checkDate").toString())) {*/
			Date now = new Date();
			ad.setStartime(DmDateUtil.DateToStr(now));
			ad.setEndtime(DmDateUtil.DateToStr(now));
		//}
		if (params.get("type") != null) {
			ad.setType(params.get("type").toString());
		}
		Map map = new HashMap();
		map.put("model", ad);
		PageInfo<CmsAdvertising> page = this.cmsAdvertisingService.findCmsAdvertisingByPageForPortal(1, pageSize, map);
		List<CmsAdvertising> ads = page.getList();
		env.setVariable("advertisings",
				ObjectWrapper.DEFAULT_WRAPPER.wrap(ads));
		body.render(env.getOut());
	}
}
