
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
import com.dm.cms.model.CmsVote;
import com.dm.cms.service.CmsChannelService;
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
public class VoteListDirective implements TemplateDirectiveModel {

	private Logger log = LoggerFactory.getLogger(VoteListDirective.class);

	@Autowired
	private CmsVoteService cmsVoteService;
	@Autowired
	private CmsChannelService cmsChannelService;

	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// Integer channelId = Integer.valueOf(getRequiredParam(params, "channelId"));
		Integer channelId = params.get("channelId") == null ? null : Integer
				.valueOf(params.get("channelId").toString());
		Integer pageSize = params.get("pageSize") == null ? 5 : Integer
				.valueOf(params.get("pageSize").toString());
		Integer pageNum = params.get("pageNum") == null ? 1 : Integer
				.valueOf(params.get("pageNum").toString());
		CmsChannel cmsChannel =null;
		if(channelId!=null)
			cmsChannel = cmsChannelService.findOneById(channelId);
		Integer order = Integer.valueOf(params.get("order") != null ? params
				.get("order").toString() : "1");
		String orderby = "";
		if (order == 1) {//最新更新
			orderby = "publish_date desc";
		} else if (order == 2) {//最新发布
			orderby = "publish_date desc";
		} else {//新作
			orderby = "create_time desc";
		}
		Map map = new HashMap();
		map.put("order", orderby);
		CmsVote novel = new CmsVote();
		novel.setChannelId(channelId);
		novel.setStatus("5");
		map.put("model", novel);
		PageInfo<CmsVote> page = this.cmsVoteService.findPage(pageNum, pageSize, map);
		
		List<CmsVote> novels = page.getList();
		// long total = page.getTotal();
		int titleLeft = 0;
		if (params.get("titleLeft") != null) {
			titleLeft = Integer.valueOf(params.get("titleLeft").toString());
			for (CmsVote ce : novels) {
				if (  ce.getTitle().length() > titleLeft) {
					ce.setShortTitle(ce.getTitle()
							.substring(0, titleLeft) + "…");
				}
			}
		}
		env.setVariable("cmsVotes", ObjectWrapper.DEFAULT_WRAPPER.wrap(novels));
		if(cmsChannel!=null){
			env.setVariable("pagination", ObjectWrapper.DEFAULT_WRAPPER
					.wrap(PageUtil.getInstance().channelPagination(cmsChannel,
							pageNum, page.getTotal(), pageSize)));
			 env.setVariable("paginationMobile", ObjectWrapper.DEFAULT_WRAPPER
						.wrap(PageUtil.getInstance().channelMobilePagination(cmsChannel,
								pageNum, page.getTotal(), pageSize)));
			env.setVariable("paginationlist",
			        ObjectWrapper.DEFAULT_WRAPPER.wrap(PageUtil.getInstance().channelPaginationList(cmsChannel,pageNum,page.getTotal(),pageSize)));
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
