/*package com.dm.sso;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.github.ebnew.ki4so.client.handler.AppClientLogoutHandler;
import com.github.ebnew.ki4so.common.utils.StringUtils;

public class Ki4soAppClientLogoutHandlerImpl implements AppClientLogoutHandler {
	
	private static Logger logger = Logger.getLogger(Ki4soAppClientLogoutHandlerImpl.class.getName());
	public static final String USER_KEY = "USER_KEY_SESSON";
	@Override
	public void logoutClient(HttpServletRequest request,
			HttpServletResponse response, String userId) {
		//若已经登录，则作相关处理。
		if(!StringUtils.isEmpty(userId)){
			//remove the exception
			request.getSession().removeAttribute(USER_KEY);
			logger.info("the user id is userId has logined out the app");
		}
	}

}
*/