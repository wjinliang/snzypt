package com.dm.sso;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	public static final String USER_KEY = "USER_KEY_SESSON";

	@RequestMapping("/login.do")
	public ModelAndView login(ModelAndView model,HttpServletRequest request) {
		Object encryCredential = request.getSession().getAttribute(USER_KEY);
		if(encryCredential!=null){
			model.setViewName("redirect:/j_spring_security_check");
			return model;
		}
		
		//model.setViewName("redirect:http://localhost/ki4so-web/login.do?service=http://localhost/topiecms/login.do");
		return model;
	}
	
}
