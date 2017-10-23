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
import com.dm.cms.model.CmsContent;
import com.dm.cms.model.CmsQuestionnaires;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsContentService;
import com.dm.cms.service.CmsQuestionnairesService;
import com.dm.cms.util.PageUtil;
import com.github.pagehelper.PageInfo;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
 * @description 
 * @author wj
 * @version 2.0
 * @createTime 2015-12-24
 */
public class QuestionnairesListDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(QuestionnairesListDirective.class);
	
	@Autowired
	CmsQuestionnairesService questionnairesService;
	
	@Autowired
	CmsChannelService cmsChannelService;
	
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		// TODO Auto-generated method stub
		Integer pageSize = params.get("pageSize") == null ? 12 : Integer.valueOf(params.get("pageSize")
				.toString());
		Integer pageNum = params.get("pageNum") == null ? 1 : Integer
				.valueOf(params.get("pageNum").toString());
		
		Integer order = Integer.valueOf(params.get("order") != null ? params.get("order")
				.toString() : "1");
		String orderby="";
		if(order ==1){
			orderby = "publish_time desc";
		}else if(order == 2){
			orderby = "seq desc,publish_time desc";
		}
		else
		{
			orderby = "create_time desc";
		}
		Map map = new HashMap();
		map.put("sort", orderby);
		PageInfo<CmsQuestionnaires> page = this.questionnairesService.findByPage(pageNum, pageSize, map);
		long total = page.getTotal();
		List<CmsQuestionnaires> contents = page.getList();
		if(params.get("titleLeft")!=null)
		{
			int titleLeft = Integer.valueOf(params.get("titleLeft").toString());
			for(CmsQuestionnaires ce:contents)		{
				if(ce.getTitle().length()>titleLeft)
				{
				 ce.setShortTitle(ce.getTitle().substring(0,titleLeft)+"...");
				}
			}
		}
		env.setVariable("contents",ObjectWrapper.DEFAULT_WRAPPER.wrap(contents));
		if(params.get("channelId")!=null){
			Integer channelId = Integer.valueOf(params.get("channelId").toString());
			CmsChannel channel = cmsChannelService.findOneById(channelId);
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
