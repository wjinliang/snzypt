package com.dm.search.directive;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.dm.cms.model.CmsContent;
import com.dm.cms.model.CmsNovel;
import com.dm.cms.service.CmsNovelService;
import com.dm.cms.util.PageUtil;
import com.dm.search.model.SearchResult;
import com.dm.search.service.SearchConfigService;
import com.github.pagehelper.PageInfo;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * 
 * @project com.dm.search.directive.SearchListDirective.java
 * @author wjl
 * @createdate 2016年1月27日 上午9:45:34
 */
public class SearchListDirective implements TemplateDirectiveModel {

	private Logger log = LoggerFactory.getLogger(SearchListDirective.class);

	@Autowired
	SearchConfigService searchConfigService;

	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// Integer channelId = Integer.valueOf(getRequiredParam(params, "channelId"));
		String sortField = params.get("sortField") == null ? null : (params.get("sortField").toString());
		Integer pageSize = params.get("pageSize") == null ? 10 : Integer
				.valueOf(params.get("pageSize").toString());
		Integer pageNum = params.get("pageNum") == null ? 1 : Integer
				.valueOf(params.get("pageNum").toString());
		String entity = params.get("entity")== null ? "cmsContent":params.get("entity").toString();
		Map map = searchConfigService.searchResults("*","", pageNum, pageSize,sortField,entity,null, null);
		// long total = page.getTotal();
		List<SearchResult> list = (List<SearchResult>)map.get("list");
		for(SearchResult s:list){
			s.setTitle(s.getTitle().replace(" ", "").replace("<fontcolor='#fc0505\'>", "").replace("</font>", ""));
			s.setContent("");
		}
		env.setVariable("list", ObjectWrapper.DEFAULT_WRAPPER.wrap(list));
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
