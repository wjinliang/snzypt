package com.dm.cms.directive;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsInterview;
import com.dm.cms.model.CmsNovel;
import com.dm.cms.model.CmsVote;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsInterviewService;
import com.dm.cms.service.CmsVoteService;
import com.dm.cms.util.PageUtil;
import com.github.pagehelper.PageInfo;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * 
 * @project com.dm.cms.directive.NovelListDirective.java
 * @author wjl
 * @createdate 2016年1月15日 下午2:45:16
 */
public class InterviewListDirective implements TemplateDirectiveModel {

	private Logger log = LoggerFactory.getLogger(InterviewListDirective.class);

	@Autowired
	private CmsInterviewService cmsInterviewService;
	@Autowired
	private CmsChannelService cmsChannelService;

	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// Integer channelId = Integer.valueOf(getRequiredParam(params,
		// "channelId"));
		Integer channelId = params.get("channelId") == null ? null : Integer
				.valueOf(params.get("channelId").toString());
		Integer pageSize = params.get("pageSize") == null ? 5 : Integer
				.valueOf(params.get("pageSize").toString());
		Integer pageNum = params.get("pageNum") == null ? 1 : Integer
				.valueOf(params.get("pageNum").toString());
		String finish = params.get("finish") == null ? null : String.valueOf(params.get("finish"));
		CmsChannel cmsChannel = null;
		if (channelId != null)
			cmsChannel = cmsChannelService.findOneById(channelId);
		Integer order = Integer.valueOf(params.get("order") != null ? params
				.get("order").toString() : "1");
		String orderby = "";
		if (order == 1) {// 最新更新
			orderby = "start_time desc";
		} else if (order == 2) {// 最新发布
			orderby = "update_time desc";
		} else {// 新作
			orderby = "create_time desc";
		}

		Map map = new HashMap();
		CmsInterview novel = new CmsInterview();
		novel.setChannelId(channelId);
		if (finish == null){
			novel.setStatus("5");
		}else {
			novel.setStatus("2");
			orderby = "start_time asc";
		}
		map.put("order", orderby);
		map.put("model", novel);
		PageInfo<CmsInterview> page = this.cmsInterviewService.findByPage(
				pageNum, pageSize, map);

		List<CmsInterview> novels = page.getList();
		// long total = page.getTotal();
		int titleLeft = 0;
		if (params.get("titleLeft") != null) {
			titleLeft = Integer.valueOf(params.get("titleLeft").toString());
		}
		int descLeft = 0;
		if (params.get("descLeft") != null) {
			descLeft = Integer.valueOf(params.get("descLeft").toString());
		}
		for (CmsInterview ce : novels) {
			if (descLeft != 0 && ce.getTitle().length() > descLeft) {
				ce.setShortTitle(ce.getTitle().substring(0, descLeft) + "...");
			}

		}
		env.setVariable("cmsInterviews",
				ObjectWrapper.DEFAULT_WRAPPER.wrap(novels));
		if (cmsChannel != null) {
			env.setVariable("pagination", ObjectWrapper.DEFAULT_WRAPPER
					.wrap(PageUtil.getInstance().channelPagination(cmsChannel,
							pageNum, page.getTotal(), pageSize)));
			env.setVariable("paginationMobile", ObjectWrapper.DEFAULT_WRAPPER
					.wrap(PageUtil.getInstance().channelMobilePagination(
							cmsChannel, pageNum, page.getTotal(), pageSize)));
			env.setVariable("paginationlist", ObjectWrapper.DEFAULT_WRAPPER
					.wrap(PageUtil.getInstance().channelPaginationList(
							cmsChannel, pageNum, page.getTotal(), pageSize)));
		}
		body.render(env.getOut());
	}

	String getRequiredParam(Map params, String key) {
		Object value = params.get(key);
		if (StringUtils.isEmpty(value)) {
			log.error("channelId 参数必须指定！");
		}
		return value.toString();
	}

}
