package com.dm.cms.directive;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsContent;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsContentService;
import com.dm.cms.util.PageUtil;
import com.github.pagehelper.PageInfo;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
 * @description 内容列表置标
 * @author dyt
 * @version 2.0
 * @createTime 2015-12-24
 */
public class PubDocListDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(PubDocListDirective.class);
	
	@Autowired
	CmsContentService cmsContentService;
	
	@Autowired
	CmsChannelService cmsChannelService;
	
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		if(params.get("channelId")==null)
		{
			log.error("channelId 参数必须指定！");   
			return ;
		}
		Integer channelId = Integer.valueOf(params.get("channelId").toString());
		Integer pageSize = params.get("pageSize") == null ? 12 : Integer.valueOf(params.get("pageSize")
				.toString());
		Integer pageNum = params.get("pageNum") == null ? 1 : Integer
				.valueOf(params.get("pageNum").toString());
		
		Integer order = Integer.valueOf(params.get("order") != null ? params.get("order")
				.toString() : "1");
		String orderby="";
		if(order ==1){
			orderby = "seq desc,publish_date desc";
		}else if(order == 2){
			orderby = "publish_date desc";
		}
		else
		{
			orderby = "create_time desc";
		}
		Map map = new HashMap();
		map.put("order", orderby);
		CmsContent cmsContent = new CmsContent();
		cmsContent.setChannelId(channelId);
		cmsContent.setIsHtml(true);
		map.put("model", cmsContent);
		CmsChannel channel = cmsChannelService.findOneById(channelId);
		PageInfo<CmsContent> page= cmsContentService.findCmsContentByPage(pageNum, pageSize, map);
		List<CmsContent> contents = page.getList();
		long total = page.getTotal();
		int titleLeft=30;
		boolean fattitle = false;
		if(params.get("titleLeft")!=null)
		{
			fattitle=true;
			titleLeft = Integer.valueOf(params.get("titleLeft").toString());
		}
		List<Map> docs = new ArrayList<Map>();
		for(CmsContent ce:contents)		{
			Map doc = ce.toDoc();
			
			if(fattitle &&ce.getTitle().length()>titleLeft)
			{
				doc.put("title",(ce.getTitle().substring(0,titleLeft)));
			}
			docs.add(doc);
		}
		env.setVariable("docs",ObjectWrapper.DEFAULT_WRAPPER.wrap(docs));
		if(channel.getChannelType().equals("2")){//链接频道
			
		}else{
			env.setVariable("pagination", ObjectWrapper.DEFAULT_WRAPPER
					.wrap(PageUtil.getInstance().channelPagination(channel,
							pageNum, total, pageSize)));
			env.setVariable("paginationMobile", ObjectWrapper.DEFAULT_WRAPPER
					.wrap(PageUtil.getInstance().channelMobilePagination(channel, pageNum, total, pageSize)));
			env.setVariable("paginationlist",
			        ObjectWrapper.DEFAULT_WRAPPER.wrap(PageUtil.getInstance().channelPaginationList(channel,pageNum,total,pageSize)));
		}
		body.render(env.getOut());  
	}
	
	String getRequiredParam(Map params,String key){  
        Object value = params.get(key);  
        if(StringUtils.isEmpty(value)) {  
           log.error("channelId 参数必须指定！");   
        }  
        return value.toString();  
    }

}
