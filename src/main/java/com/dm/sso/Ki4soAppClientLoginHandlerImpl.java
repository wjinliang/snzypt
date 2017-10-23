/*package com.dm.sso;

import java.io.UnsupportedEncodingException;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.codec.Base64;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.dm.platform.dao.CommonDAO;
import com.github.ebnew.ki4so.client.handler.AppClientLoginHandler;
import com.github.ebnew.ki4so.core.model.EncryCredentialInfo;

*//**
 * 默认的登录认证实现。
 * @author burgess yang
 *
 *//*
public class Ki4soAppClientLoginHandlerImpl extends
UsernamePasswordAuthenticationFilter implements AppClientLoginHandler {
	
	private static Logger logger = Logger.getLogger(Ki4soAppClientLoginHandlerImpl.class.getName());

	public static final String USER_KEY = "USER_KEY_SESSON";
	
	
	@Override
	public String loginClient(EncryCredentialInfo encryCredentialInfo, HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute(USER_KEY, encryCredentialInfo);
		logger.info("the user id is "+encryCredentialInfo.getUserId() +" has logined in the app");
		//request.setAttribute("j_username", userName);
		return "http://localhost/topiecms/j_spring_security_check";
	}
	public static final String VALIDATE_CODE = "validateCode";
	public static final String USERNAME = "j_username";
	public static final String PASSWORD = "j_password";
	public static final String USER_ID= "UserId";

	@Resource
	CommonDAO commonDAO;

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request,
			HttpServletResponse response) throws AuthenticationException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		// 检测验证码

		String username = obtainUsername(request);
		String password = obtainPassword(request);
		Object encryCredential = request.getSession().getAttribute(USER_KEY);
		if(encryCredential!=null){
			EncryCredentialInfo encryCredentialInfo = (EncryCredentialInfo)encryCredential;
			String userId = encryCredentialInfo.getUserId();
			username = "admin";
			password = "admin";
			UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(
					username, password);
			
			// 允许子类设置详细属性
			setDetails(request, authRequest);

			return this.getAuthenticationManager().authenticate(authRequest);
		}
		checkValidateCode(request);
		try{
			if(Base64.isBase64(password.getBytes())){
				password = new String(Base64.decode(password.getBytes()));
			}else{
				password="s";
			}
		}catch(Exception e){
			password="s";
		}finally{
			
		}

		// 验证用户账号与密码是否对应
		username = username.trim();
		UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(
				username, password);

		// 允许子类设置详细属性
		setDetails(request, authRequest);

		return this.getAuthenticationManager().authenticate(authRequest);
	}
	
	protected void checkValidateCode(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute(VALIDATE_CODE);
			if(obj==null){
				throw new AuthenticationServiceException("验证码错误！");
			}else{
			String sessionValidateCode = obtainSessionValidateCode(session);
			session.setAttribute(VALIDATE_CODE, null);
			String validateCodeParameter = obtainValidateCodeParameter(request);
			if (StringUtils.isEmpty(validateCodeParameter)
					|| !sessionValidateCode.equalsIgnoreCase(validateCodeParameter)) {
				throw new AuthenticationServiceException("验证码错误！");
			}
		}
	}

	private String obtainValidateCodeParameter(HttpServletRequest request) {
		Object obj = request.getParameter("j_captcha");
		return null == obj ? "" : obj.toString();
	}

	protected String obtainSessionValidateCode(HttpSession session) {
		Object obj = session.getAttribute(VALIDATE_CODE);
		return null == obj ? "" : obj.toString();
	}

	@Override
	protected String obtainUsername(HttpServletRequest request) {
		Object obj = request.getParameter(USERNAME);
		return null == obj ? "" : obj.toString();
	}
	
	protected String obtainUserId(HttpServletRequest request) {
		Object obj = request.getParameter(USER_ID);
		return null == obj ? null : obj.toString();
	}

	@Override
	protected String obtainPassword(HttpServletRequest request) {
		Object obj = request.getParameter(PASSWORD);
		return null == obj ? "" : obj.toString();
	}

}
*/