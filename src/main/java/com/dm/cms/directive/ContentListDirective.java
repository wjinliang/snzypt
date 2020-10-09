package com.dm.cms.directive;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;

import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsContent;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsContentService;
import com.dm.cms.util.HtmlCleanerUtil;
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
public class ContentListDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(ContentListDirective.class);
	
	@Autowired
	CmsContentService cmsContentService;
	
	@Autowired
	CmsChannelService cmsChannelService;
	@Value("${isContentStatic}")
	boolean isContentStatic;
	
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		if(params.get("channelId")==null)
		{
			log.error("channelId 参数必须指定！");   
			return ;
		}
		Map map = new HashMap();
		String[] channels = new String[0];
		String channel = params.get("channelId").toString();
		List<Integer> ids = new ArrayList<Integer>();
		Integer channelId =null;
		if(channel.contains(",")){
			channels = channel.split(",");
			for(String str:channels){
				channelId = Integer.valueOf(str);
				ids.add(channelId);
			}
			map.put("channelIds", ids);
		}else{
			channelId = Integer.valueOf(channel);
		}
		Integer pageSize = params.get("pageSize") == null ? 12 : Integer.valueOf(params.get("pageSize")
				.toString());
		Integer pageNum = params.get("pageNum") == null ? 1 : Integer
				.valueOf(params.get("pageNum").toString());
		
		Integer order = Integer.valueOf(params.get("order") != null ? params.get("order")
				.toString() : "2");
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
		map.put("sort", orderby);
		CmsContent cmsContent = new CmsContent();
		cmsContent.setChannelId(channelId);
		if(isContentStatic){
			cmsContent.setIsHtml(true);
		}
		cmsContent.setStatus(new Short("2"));
		cmsContent.setIsDelete(false);
		map.put("model", cmsContent);
		CmsChannel chan = cmsChannelService.findOneById(channelId);
		PageInfo<CmsContent> page= cmsContentService.findCmsContentByPage(pageNum, pageSize, map);
		List<CmsContent> contents = page.getList();
		long total = page.getTotal();

		Integer contentLeft = params.get("contentLeft")==null?null:Integer.valueOf(params.get("contentLeft").toString());
		if(params.get("titleLeft")!=null)
		{
			int titleLeft = Integer.valueOf(params.get("titleLeft").toString());
			for(CmsContent ce:contents)		{
				if(ce.getTitle().length()>titleLeft)
				{
				 ce.setShortTitle(ce.getTitle().substring(0,titleLeft)+"...");
				}
				if(contentLeft!=null){
					if(ce.getBrief()==null||ce.getBrief().equals("")){
						String h = ce.getContentText();
						String html = HtmlCleanerUtil.getContent(h);
						System.out.println("网页内容:"+h);
						if(html!=null && html.length()>contentLeft)
							ce.setBrief(html.substring(0,contentLeft)+"...");
						else
							ce.setBrief(html);
					}else{
						String html = ce.getBrief();
						if(html!=null && html.length()>contentLeft)
							ce.setBrief(html.substring(0,contentLeft)+"...");
					}
					System.out.println("设置后网页内容:"+ce.getBrief());
				}
			}
		}
		env.setVariable("contents",ObjectWrapper.DEFAULT_WRAPPER.wrap(contents));
		if(chan.getChannelType()!=null&&chan.getChannelType().equals("2")){//链接频道
			
		}else{
			env.setVariable("pagination", ObjectWrapper.DEFAULT_WRAPPER
					.wrap(PageUtil.getInstance().channelPagination(chan,
							pageNum, total, pageSize)));
			env.setVariable("paginationMobile", ObjectWrapper.DEFAULT_WRAPPER
					.wrap(PageUtil.getInstance().channelMobilePagination(chan, pageNum, total, pageSize)));
			env.setVariable("paginationlist",
			        ObjectWrapper.DEFAULT_WRAPPER.wrap(PageUtil.getInstance().channelPaginationList(chan,pageNum,total,pageSize)));
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
