package com.dm.cms.directive;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dm.cms.model.CmsFriendlink;
import com.dm.cms.service.CmsFriendlinkService;
import com.github.pagehelper.PageInfo;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
 * @description 友情链接
 * @author dyt
 * @version 2.0
 * @createTime 2015-12-24
 */
public class FriendlinkListDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(FriendlinkListDirective.class);
	
	@Autowired
	private CmsFriendlinkService cmsFriendlinkService;
	
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		if(params.get("siteId")==null)
		{
			log.error("siteId 参数必须指定！");   
			return ;
		}
		Long siteId = Long.valueOf(params.get("siteId").toString());
		Integer pageSize = params.get("pageSize") == null ? 100 : Integer.valueOf(params.get("pageSize")
				.toString());
		Integer pageNum = params.get("pageNum") == null ? 1 : Integer
				.valueOf(params.get("pageNum").toString());
		
		String type = params.get("type") != null ? params.get("type")
				.toString() : null;
		Map map = new HashMap();
		CmsFriendlink link = new CmsFriendlink();
		link.setType(type);
		link.setSiteId(siteId);
		link.setIsShow("1");
		PageInfo<CmsFriendlink> page= cmsFriendlinkService.findCmsFriendlinkByPage(pageNum, pageSize, link);
		List<CmsFriendlink> linkList = page.getList();
		long total = page.getTotal();
		env.setVariable("friendlinks",ObjectWrapper.DEFAULT_WRAPPER.wrap(linkList));
		body.render(env.getOut());  
	}

}
