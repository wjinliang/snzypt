package com.dm.cms.util;


import java.util.Map;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * 获取spring容器中的bean
 * @project com.dm.cms.util.AppUtil.java
 * @author wjl
 * @createdate 2015年12月29日 下午7:29:57
 */
public class AppUtil implements ApplicationContextAware {
	private static ApplicationContext appContext;
	@Override
	public void setApplicationContext(ApplicationContext arg0)
			throws BeansException {
		appContext = arg0;

	}
	 public static Object getBean(String paramString)
	  {
	    return appContext.getBean(paramString);
	  }
	 public static <T> Map<String, T> getBeansOfType(Class type)
	  {
		 Map<String, T> map = appContext.getBeansOfType(type);
	    return map;
	  }
}