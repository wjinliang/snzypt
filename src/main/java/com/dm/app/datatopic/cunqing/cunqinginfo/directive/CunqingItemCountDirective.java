package com.dm.app.datatopic.cunqing.cunqinginfo.directive;

import java.io.IOException;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.dm.app.datatopic.cunqing.constants.ModelPath;
import com.dm.app.datatopic.cunqing.cunqinginfo.service.CunqingService;
import com.dm.app.util.judge.StringUtils;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

public class CunqingItemCountDirective implements TemplateDirectiveModel {
	private Logger log  = LoggerFactory.getLogger(CunqingItemCountDirective.class);
	 
	private CunqingService cunqingService;
	
	/**
	 * @description 查询该行政村中各个项目的数量
	 * @author huoge
	 * @date 2017年2月16日
	 * @return
	 */
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body)
			throws TemplateException, IOException {
		System.out.println(params.get("villageCode"));
		String villageCode=params.get("villageCode").toString();  //获取该村唯一编码
		String tipItem=params.get("tipItem").toString();  //判断是否传入参数
		System.out.println(villageCode+"==="+tipItem);
		if(StringUtils.isEmpty(villageCode)) 
		{
			return ;
		}
		if(StringUtils.isEmpty(tipItem))
		{
			return ;
		}
		long itemCount=0;
		Class clazzname=null;
		try {
			clazzname = Class.forName(ModelPath.PATH_PREFIX+tipItem);//根据该类的全限定名获取该类class实例
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return ;
		}
		System.out.println(itemCount+"---00000000000000");
			itemCount = cunqingService.findItemCountInVillage(villageCode,clazzname); 
			System.out.println(itemCount+"-----------------------");
		env.setVariable("itemCount",ObjectWrapper.DEFAULT_WRAPPER.wrap(itemCount));
		body.render(env.getOut()); 
	}
	
	

}
