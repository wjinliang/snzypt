package com.dm.module.directive;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dm.module.model.Microcobol;
import com.dm.platform.model.TDictItem;
import com.dm.platform.util.TDictUtil;
import com.github.pagehelper.PageInfo;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
 * siteId,pageSize,pageNum,type
 * @author 
 *
 */
public class DictItemListDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(DictItemListDirective.class);
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		String dictCode = params.get("code")==null?"": params.get("code").toString();
		List<TDictItem> list =  TDictUtil.itemList(dictCode);
		env.setVariable("items",ObjectWrapper.DEFAULT_WRAPPER.wrap(list));
		body.render(env.getOut());  
	}

}
