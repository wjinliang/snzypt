package com.dm.platform.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.dm.cms.util.AppUtil;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;

/*******************************************************************************
 * 
 * @author wuzhenzhong
 * 
 * @since Feb 5, 2010
 * 
 ******************************************************************************/
public class FreeMarkertUtil {
	/**
	 * templatePath模板文件存放路径,templateName 模板文件名称,filename 生成的文件名称
	 * @param templatePath
	 * @param templateName
	 * @param fileName
	 * @param root
	 */
	
	private static Logger log = LoggerFactory.getLogger(FreeMarkertUtil.class);
	
	public static boolean analysisTemplate(String templatePath,
			String templateName, String fileName, Map<?, ?> root,HttpServletRequest request) {
			//初使化FreeMarker配置
			Configuration config = new Configuration();
			Writer out =null;
			// 设置要解析的模板所在的目录，并加载模板文件
		try {
			config.setDirectoryForTemplateLoading(new File(templatePath));
			// 设置包装器，并将对象包装为数据模型
			config.setObjectWrapper(new DefaultObjectWrapper());
			// 获取模板,并设置编码方式，这个编码必须要与页面中的编码格式一致
			config = updateConfiguration(config, request);
			// 否则会出现乱码
			Template template = config.getTemplate(templateName, "UTF-8");
			// 合并数据模型与模板
			FileOutputStream fos = null;
			fos = new FileOutputStream(fileName);
			out = new OutputStreamWriter(fos, "UTF-8");
			template.process(root, out);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			log.error(e.getMessage());
			return false;
		} catch (TemplateException e) {
			// TODO Auto-generated catch block
			log.error(e.getMessage());
			return false;
		} catch (IllegalArgumentException e) {
			log.error(e.getMessage());
			return false;
		} finally {
			if (out != null) {
				try {
					out.flush();
					out.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					log.error(e.getMessage());
					return false;
				}
			}
		}
			return true;
	}
	protected static Configuration updateConfiguration(Configuration configuration,HttpServletRequest request)
            throws TemplateException {
 
        // 设置标签类型([]、<>),[]这种标记解析要快些
        configuration.setTagSyntax(Configuration.AUTO_DETECT_TAG_SYNTAX);
        Map<String, TemplateDirectiveModel> beans = new HashMap<String, TemplateDirectiveModel>();
        // 设置允许属性为空
        configuration.setClassicCompatible(true);
        if(request != null) {
        WebApplicationContext webApp=RequestContextUtils.getWebApplicationContext(request, request.getSession().getServletContext());
        // 获取实现TemplateDirectiveModel的bean
        beans = webApp.getBeansOfType(TemplateDirectiveModel.class);
        }else{
        	beans = AppUtil
        			.getBeansOfType(TemplateDirectiveModel.class);
        }
        for (String key : beans.keySet()) {
            Object obj = beans.get(key);
            if (obj != null && obj instanceof TemplateDirectiveModel) {
                configuration.setSharedVariable(key, obj);
            }
        }
 
        return configuration;
    }

}
