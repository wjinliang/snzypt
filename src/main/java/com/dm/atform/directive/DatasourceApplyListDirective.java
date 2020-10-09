package com.dm.atform.directive;

import java.io.IOException;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dm.atform.model.AtDatasourceApply;
import com.dm.atform.service.AtDatasourceApplyService;
import com.dm.cms.model.CmsChannel;
import com.dm.cms.service.CmsChannelService;
import com.dm.platform.model.UserAccount;
import com.dm.platform.util.SqlParam;
import com.github.pagehelper.PageInfo;

import freemarker.core.Environment;
import freemarker.ext.beans.StringModel;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
 * 数据资源信息
 * @author Mr.Jin
 *
 */
public class DatasourceApplyListDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(DatasourceApplyListDirective.class);
	@Autowired
	private AtDatasourceApplyService atDatasourceApplyService;
	
	@Autowired
	CmsChannelService cmsChannelService;
	
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		StringModel el = (StringModel)env.getGlobalVariable("currentUser");
		if(el==null){
			return;
		}
		UserAccount user  = (UserAccount)el.getWrappedObject();
		Integer channelId = params.get("channelId")==null?null:Integer.valueOf(params.get("channelId").toString());
		CmsChannel chan = cmsChannelService.findOneById(channelId);
		Integer pageSize = params.get("pageSize") == null ? 12 : Integer.valueOf(params.get("pageSize")
				.toString());
		Integer pageNum = params.get("pageNum") == null ? 1 : Integer
				.valueOf(params.get("pageNum").toString());
		AtDatasourceApply model = new AtDatasourceApply();
		model.setApplyUserId(user.getCode());
		Map map =new SqlParam().autoParam(model, "applyTime_desc",pageNum,pageSize);
		PageInfo<AtDatasourceApply> page = atDatasourceApplyService.findByArg(map);
		env.setVariable("datasourceApplyList",ObjectWrapper.DEFAULT_WRAPPER.wrap(page.getList()));
		body.render(env.getOut());  
	}

}
