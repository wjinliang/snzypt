package com.dm.view;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.view.freemarker.FreeMarkerView;

import com.dm.platform.model.UserAccount;
import com.dm.platform.util.ConfigUtil;
import com.dm.platform.util.UserAccountUtil;

public class LimiFreeMarkerView extends FreeMarkerView{

	private static final String CONTEXT_PATH = "application";
	private static final String HTML_PATH = "htmlFolder";
	private static final String HTML_MOBILE_PATH = "htmlMobileFolder";
	private static final String CURRENT_USER = "currentUser";
	
	private String htmlMobileFolder;

	private String htmlFolder;

	private String projectName;
    
    @Override
    protected void exposeHelpers(Map<String, Object> model,
            HttpServletRequest request) throws Exception {
    	init();
        model.put(CONTEXT_PATH, projectName);
        model.put(HTML_PATH, htmlFolder);
		model.put(HTML_MOBILE_PATH, htmlMobileFolder);
		UserAccount user = UserAccountUtil.getInstance().getCurrentUserAccount();
		model.put(CURRENT_USER, user);
        super.exposeHelpers(model, request);
    }

	private void init() {
		if(htmlMobileFolder==null){
			htmlMobileFolder=ConfigUtil.getConfigContent("cms","htmlMobileDir");
			projectName = ConfigUtil.getConfigContent("cms","projectName");
			htmlFolder = ConfigUtil.getConfigContent("cms","htmlDir");
		}
		
	}
}
