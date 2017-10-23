package com.dm.cms.directive;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.dm.cms.model.CmsAttachmentOther;
import com.dm.cms.model.CmsVote;
import com.dm.cms.service.CmsVoteService;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
 * 
 * @project com.dm.cms.directive.NovelDirective.java
 * @author wjl
 * @createdate 2016年1月15日 上午10:54:21
 */
public class VoteDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(VoteDirective.class);
	
	@Autowired
	private CmsVoteService cmsVoteService;
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		int voteId = Integer.valueOf(getRequiredParam(params, "voteId").toString());
		CmsVote cmsNovel = cmsVoteService.findOne(voteId);
		
		env.setVariable("cmsVote",ObjectWrapper.DEFAULT_WRAPPER.wrap(cmsNovel));
		body.render(env.getOut());  
	}
	
	
	String getRequiredParam(Map params,String key){  
        Object value = params.get(key);  
        if(StringUtils.isEmpty(value)) {  
           log.error("novelId 参数必须指定！");   
        }  
        return value.toString();  
    }

}
