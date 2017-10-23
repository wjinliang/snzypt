package com.dm.cms.handler;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;

import com.dm.platform.util.FreeMarkertUtil;

/**
 * 生成html
 * 
 * @project com.dm.cms.handler.generatorHtmlHandler.java
 * @author wjl
 * @createdate 2016年2月23日 下午4:14:50
 */
public class generatorHtmlHandler{
	@Value("${htmlDir}")
	protected String htmlFolder;
	@Value("${htmlMobileDir}")
	protected String htmlMobileFolder;
	@Value("${template.mobileBasePath}")
	private String templateMobileFolder;
	@Value("${template.basePath}")
	private String templateFolder;
	@Value("${projectName}")
	private String projectName;
	private static final String CONTEXT_PATH = "application";
	private static final String HTML_PATH = "htmlFolder";
	private static final String HTML_MOBILE_PATH = "htmlMobileFolder";

	public boolean generatorHtmlPCAndModile(String templatePathName,
			String htmldir, String htmlFile, Map root,
			HttpServletRequest request) {
		if(request!=null){
			projectName = request.getContextPath();
		}
		String baseDir = System.getProperty("web.root");
		String webappDir = baseDir.substring(0,
				baseDir.lastIndexOf(projectName.substring(1)) - 1);
		root.put(CONTEXT_PATH, projectName);
		root.put(HTML_PATH, htmlFolder);
		//pc
		String pchtmldir = webappDir + htmlFolder + htmldir;
		String pctemplatePathName = templatePathName;
		boolean success = this.html(baseDir,pctemplatePathName, pchtmldir, htmlFile, root, request);
		//mobile
		if (success && templateMobileFolder != null
				&& !templateMobileFolder.equals("")) {
			root.put(HTML_MOBILE_PATH, htmlMobileFolder);
			String mobilehtmldir = webappDir + htmlFolder+htmlMobileFolder+ htmldir;
			String mobiletemplatePathName = templateFolder+templatePathName.replace(templateFolder, templateMobileFolder);
			success = this.html(baseDir,mobiletemplatePathName, mobilehtmldir, htmlFile, root, request);

		}
		return success;
	}

	private boolean html(String baseDir,String templatePathName, String htmldir,
			String htmlFile, Map root, HttpServletRequest request) {
		File folder = new File(htmldir);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		htmlFile = htmldir + htmlFile;
		File file = new File(htmlFile);
		if (file.exists()) {
			file.delete();
		}
		boolean success = FreeMarkertUtil.analysisTemplate(baseDir,
				templatePathName, htmlFile, root, request);
		return success;

	}
}
