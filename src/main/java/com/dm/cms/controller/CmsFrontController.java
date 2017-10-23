package com.dm.cms.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dm.platform.dao.CommonDAO;
import com.dm.platform.model.UserAccount;
import com.dm.platform.model.UserAttrEntity;
import com.dm.platform.service.UserAccountService;
import com.dm.platform.service.UserAttrService;
import com.dm.platform.util.UserAccountUtil;

@Controller
@RequestMapping("/front")
public class CmsFrontController {

	 @Resource UserAccountService userAccountService;
	 @Resource CommonDAO commonDAO;
	 @Resource UserAttrService userAttrService;
	 @Value("$(htmlDir)")
	 String htmlFolder;
	
	@RequestMapping("/center") public ModelAndView infoCenter(ModelAndView model) {
		UserAccount user = UserAccountUtil.getInstance().getCurrentUserAccount();
		model.addObject("htmlFoler", htmlFolder);
		if(user==null)
		{
			model.setViewName("/front/404");
			return model;
		}
    	UserAttrEntity userAttr = userAttrService.findOne(user.getCode());
    	model.addObject("currentUser", user);
    	model.addObject("userAttr", userAttr);
        model.setViewName("/template/frontCenterInfo");
        return model;
     }
}
