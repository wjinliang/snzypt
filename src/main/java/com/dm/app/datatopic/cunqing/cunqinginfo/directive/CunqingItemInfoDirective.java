package com.dm.app.datatopic.cunqing.cunqinginfo.directive;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dm.app.datatopic.cunqing.constants.ModelPath;
import com.dm.app.datatopic.cunqing.cunqinginfo.service.CunqingService;
import com.dm.app.datatopic.model.MpJbxx;
import com.dm.app.util.judge.StringUtils;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

public class CunqingItemInfoDirective implements TemplateDirectiveModel {
	private Logger log  = LoggerFactory.getLogger(CunqingItemCountDirective.class);
	 
	private CunqingService cunqingService;
	
	/**
	 * @description 查询该行政村中各个项目中的列表详情
	 * @author huoge
	 * @date 2017年2月16日
	 * @return
	 */
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body)
			throws TemplateException, IOException {
		
		String villageCode=(String)params.get("villageCode"); //获取该村唯一编码
		String tipItem=(String)params.get("tipItem"); //获取要查询的项目class类标志字符串。
		if(StringUtils.isEmpty(villageCode)) //判断是否传入参数
		{
			return ;
		}
		if(StringUtils.isEmpty(tipItem))
		{
			return ;
		}
		List result=new ArrayList<>();
		Class clazzname=null;
		try {
			clazzname = Class.forName(ModelPath.PATH_PREFIX+tipItem); //根据该类的全限定名获取该类class实例
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return ;
		}
			result = cunqingService.findItemInfoInVillage(villageCode,clazzname);
		env.setVariable("itemListInfo",ObjectWrapper.DEFAULT_WRAPPER.wrap(result));
		body.render(env.getOut()); 
	}
	
	

}
