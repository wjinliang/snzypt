package com.dm.platform.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.org.bjca.security.SecurityEngineDeal;
import cn.org.bjca.uams.rest.spi.BjcaRestSdk;

import com.dm.platform.dao.CommonDAO;
import com.dm.platform.dto.RegeistDto;
import com.dm.platform.model.TempUser;
import com.dm.platform.model.UserAccount;
import com.dm.platform.model.UserAttrEntity;
import com.dm.platform.model.UserMenu;
import com.dm.platform.model.UserRole;
import com.dm.platform.security.MyUsernamePasswordAuthenticationFilter;
import com.dm.platform.service.FileService;
import com.dm.platform.service.InboxService;
import com.dm.platform.service.UserAccountService;
import com.dm.platform.service.UserAttrService;
import com.dm.platform.service.UserRoleService;
import com.dm.platform.util.FileUtil;
import com.dm.platform.util.MailUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.UUIDUtils;
import com.dm.platform.util.UserAccountUtil;

@Controller

public class NewCAController extends DefaultController {

	@Resource
	UserRoleService userRoleService;

	@Resource
	UserAccountService userAccountService;

	@Resource
	CommonDAO commonDAO;

	@Resource
	UserAttrService userAttrService;

	@Resource
	InboxService inboxService;
	@Resource
	FileService fileService;
	
	@Resource
	Cache myCache;
	@Value("${imagePath}")
	String imagePath;
	@Value("${webappName}")
	String webappName;
	@Value("${projectName}")
	String projectName;

	@RequestMapping("/")
	public String base(ModelAndView model) {
		return "redirect:/login";
	}

	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response,
			ModelAndView model) {
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		String strServerCert = null;
		String strRandom = null;
		String strSignedData = null;
		//request.setCharacterEncoding("utf-8");
		//Properties properties = new Properties();
		try {
		
			//SecurityEngineDeal.setRootPath("C:/BJCAROOT");修改证书路径
			
			SecurityEngineDeal sed = null;
			System.out.println("webappName=SecXV3Default{}="+webappName);
		  	sed = SecurityEngineDeal.getInstance(webappName);
			strServerCert = sed.getServerCertificate();
	
			strRandom = sed.genRandom();//产生随机数
	
			strSignedData = sed.signData(strRandom);
			//String certPub = sed.getCertInfo(clientCert, 8);
			//HttpSession session = request.getSession();
			System.out.println("随机数:"+strRandom);
			System.out.println("服务器证书:"+strServerCert);
			System.out.println("签名数据:"+strSignedData);
			request.setAttribute("strRandom", strRandom);
			request.setAttribute("strServerCert", strServerCert);
			request.setAttribute("strSignedData", strSignedData);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.setViewName("/login");
		return model;
	}
	@RequestMapping("/portalLogin")
	public ModelAndView portalLogin(HttpServletRequest request,
			HttpServletResponse response,
			ModelAndView model) {
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		String strServerCert = null;
		String strRandom = null;
		String strSignedData = null;
		//request.setCharacterEncoding("utf-8");
		//Properties properties = new Properties();
		try {
		
			//SecurityEngineDeal.setRootPath("C:/BJCAROOT");修改证书路径
			
			SecurityEngineDeal sed = null;
			System.out.println("webappName=SecXV3Default{}="+webappName);
		  	sed = SecurityEngineDeal.getInstance(webappName);
			strServerCert = sed.getServerCertificate();
	
			strRandom = sed.genRandom();//产生随机数
	
			strSignedData = sed.signData(strRandom);
			//String certPub = sed.getCertInfo(clientCert, 8);
			//HttpSession session = request.getSession();
			System.out.println("随机数:"+strRandom);
			System.out.println("服务器证书:"+strServerCert);
			System.out.println("签名数据:"+strSignedData);
			request.setAttribute("strRandom", strRandom);
			request.setAttribute("strServerCert", strServerCert);
			request.setAttribute("strSignedData", strSignedData);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.setViewName("/portalLogin");
		return model;
	}
	/*@RequestMapping("/calogin")
	public ModelAndView calogin(HttpServletRequest request,
			HttpServletResponse response,
			ModelAndView model) {
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		String strServerCert = null;
		String strRandom = null;
		String strSignedData = null;
		//request.setCharacterEncoding("utf-8");
		//Properties properties = new Properties();
		try {
		
		//SecurityEngineDeal.setRootPath("C:/BJCAROOT");修改证书路径
		
		SecurityEngineDeal sed = null;
	  	sed = SecurityEngineDeal.getInstance(webappName);
		strServerCert = sed.getServerCertificate();

		strRandom = sed.genRandom();//产生随机数

		strSignedData = sed.signData(strRandom);
		//String certPub = sed.getCertInfo(clientCert, 8);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//HttpSession session = request.getSession();
		System.out.println("随机数:"+strRandom);
		System.out.println("服务器证书:"+strServerCert);
		System.out.println("签名数据:"+strSignedData);
		request.setAttribute("strRandom", strRandom);
		request.setAttribute("strServerCert", strServerCert);
		request.setAttribute("strSignedData", strSignedData);
		model.setViewName("/ca/index");
		return model;
	}*/
	@RequestMapping("/ssologin")
	public ModelAndView ssoLogin(HttpServletRequest request,
			ModelAndView model,RedirectAttributes reAttr){
		 //票据
        String tokenId = request.getParameter("tokenId");
        //认证服务器URL
        String amUrl = request.getParameter("amUrl");
        //随机数
        String random = request.getParameter("random");
        //初始化设置认证服务器URL
        Map map1 = BjcaRestSdk.getInstance().setServerUrl(amUrl);
        //状态码
        String status = map1.get("status").toString();
        
        //判断初始化状态：0--成功 301--服务器 URL 不能为空！ 305--服务器 URL 未知错误，检查服务器 URL
        if("0".equals(status)){
        	//用户属性名称
        	String attributeName = "useridcode";
        	//获得用户属性值
           // Map map2 = BjcaRestSdk.getInstance().getUserAttribute(tokenId, attributeName, random);
            Map map2 = BjcaRestSdk.getInstance().getUserAttributeWithoutRandom(tokenId, attributeName);//不需要随机数
            //状态码
            status = map2.get("status").toString();
            if("0".equals(status)){
            	//获得用户唯一标识,查询本系统的用户信息
        	    String userid = (String) map2.get("useridcode");
			//TODO 验证用户
			UserAccount user = userAccountService.findOne(userid);
			if(user==null){
				model.addObject("msg", "没有找到该用户信息！");
				model.setViewName("redirect:/login?ca_error=true");
				return model;
			}
			model.addObject("msg", "验证成功！");
			String username =user.getLoginname();// "admin";
			String password =user.getSynPassword();// "admin";
			
			Object validateCode = request.getSession().getAttribute(MyUsernamePasswordAuthenticationFilter.VALIDATE_CODE);
			//password =new String(Base64.encode(password.getBytes()));
			reAttr.addAttribute("j_username",username);
			reAttr.addAttribute("j_password",password);
			reAttr.addAttribute("j_captcha",validateCode);
			model.setViewName("redirect:/j_spring_security_check");
		
    	    
        }else{
        	//101--随机数已失效! 301--未知错误！ 102--验证 Token 失败！ 103--获取用户信息失败！ 
        	//304--系统内部错误！ 306--参数编码错误 307--服务连接错误！ 308--用户认证失败！
        	//309--用户状态异常！ 310--请求地址不存在
        	String code = (String)map2.get("message");
        	System.out.println("map2.get('message'):"+code);
			model.addObject("msg",getMsg(code) );
			model.setViewName("redirect:/login?ca_error=true");
			return model;
        }
	    }else{
	    	System.out.println(map1.get("message"));
			model.addObject("msg", map1.get("message"));
			model.setViewName("redirect:/login?ca_error=true");
			return model;
	    }
	
		return model;
	}
	private Object getMsg(String code) {
		// TODO Auto-generated method stub
		//101--随机数已失效! 301--未知错误！ 102--验证 Token 失败！ 103--获取用户信息失败！ 
    	//304--系统内部错误！ 306--参数编码错误 307--服务连接错误！ 308--用户认证失败！
    	//309--用户状态异常！ 310--请求地址不存在
		switch (code) {
		case "101":return "随机数已失效!";
		case "102":return "验证 Token 失败！";
		case "103":return "获取用户信息失败！";
		case "301":return "未知错误！";
		case "304":return "系统内部错误！";
		case "306":return "参数编码错误";
		case "307":return "服务连接错误！";
		case "308":return "用户认证失败！";
		case "309":return "用户状态异常！";
		case "310":return "请求地址不存在";

		default:
			return "其他错误";
		}
	}

	@RequestMapping("/cacheck")
	public ModelAndView caCheck(String UserCert,String UserSignedData,
			String ContainerName,String ranStr,HttpServletRequest request,
			ModelAndView model,RedirectAttributes reAttr){
		 model.addObject("message","验证失败，请手动登录！");
		model.setViewName("redirect:/login?ca_error=true");
		//获得登陆用户cert
		String clientCert = UserCert;
		SecurityEngineDeal sed = null;
		try {
		  	sed = SecurityEngineDeal.getInstance(webappName);
			String certPub = sed.getCertInfo(clientCert, 8);
			HttpSession session = request.getSession();
		//验证客户端证书
			int retValue = sed.validateCert(clientCert);

			if (retValue == 1) {
				session.setAttribute("ContainerName", ContainerName);
				String uniqueIdStr = "";
				try {
					uniqueIdStr = sed.getCertInfo(clientCert, 17);
				} catch (Exception e) {
					  model.addObject("message","客户端证书验证失败:" + e.getMessage());
				}
				session.setAttribute("UniqueID", uniqueIdStr);
				String uniqueId = "";
				try {
					//获得登陆用户ID
					uniqueId = sed.getCertInfoByOid(clientCert,"2.16.840.1.113732.2");
					uniqueId = uniqueId.replace("SF", "");
					//TODO 验证用户
					List<UserAccount> users = commonDAO.findByPropertyName(UserAccount.class, "idCard", uniqueId);
					UserAccount user = users.get(0);
					model.addObject("msg", "验证成功！");
					String username = user.getLoginname();//"admin";
					String password = user.getSynPassword();//"admin";
					Object validateCode = request.getSession().getAttribute(MyUsernamePasswordAuthenticationFilter.VALIDATE_CODE);
					//password =new String(Base64.encode(password.getBytes()));
					reAttr.addAttribute("j_username",username);
					reAttr.addAttribute("j_password",password);
					reAttr.addAttribute("j_captcha",validateCode);
					model.setViewName("redirect:/j_spring_security_check");
					return model;
				} catch (Exception e) {
					e.printStackTrace();
					  model.addObject("message","客户端证书验证失败:" + e.getMessage())
							;
				}
				
				/*System.out.println("<h3>欢迎您使用本系统!</h3>");
				System.out.println("<h3>主题通用名：");
				System.out.println(uniqueIdStr);
				System.out.println("<br/>证书颁发者(颁发者通用名): ");
				System.out.println(certPub);
				System.out.println("<br/>证书唯一标识(备用主题通用名)：");
				System.out.println(uniqueId);
				System.out.println("<font color='red'>(实际集成时,会将唯一标识与数据库比对,判断是否为合法用户)</font>");
				System.out.println("</h3><br/>");*/
			} else {
				System.out.println("客户端证书验证失败！");

				if (retValue == -1) {
					 model.addObject("message","登录证书的根不被信任");
				} else if (retValue == -2) {
					  model.addObject("message","登录证书超过有效期");
				} else if (retValue == -3) {
					  model.addObject("message","登录证书为作废证书");
				} else if (retValue == -4) {
					  model.addObject("message","登录证书被临时冻结");
				}
				return model;
			}
		} catch (Exception ex) {
			 model.addObject("message","客户端证书验证失败:" + ex.getMessage());
			return model;
		}

		//验证客户端签名
		try {
			if (sed.verifySignedData(clientCert, ranStr, UserSignedData)) {
			
			} else {
				 model.addObject("message","验证客户端签名错误！");
				return model;
			}
		} catch (Exception e) {
			model.addObject("message","验证客户端签名错误:" + e.getMessage());
			return model;
		}
		return model;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping("/mainpage")
	public ModelAndView mainpage(ModelAndView model) {
		try {
			UserAccount currentUser = UserAccountUtil.getInstance()
					.getCurrentUserAccount();

			if (currentUser.getRoles().size() > 0) {
				Map<String, Object> map = new HashMap<String, Object>();
				model.setViewName("/admin/dashboard");
				return Model(model);
			} else {
				return Error("未授权角色");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return Error(e);
		}
	}

	@RequestMapping("/saveRegiest")
	public ModelAndView saveRegiest(ModelAndView model, RegeistDto ruser) {
		try {
			UserAccount userAccount = new UserAccount();
			userAccount.setCode(UUIDUtils.getUUID16());
			userAccount.setEnabled(true);
			userAccount.setNonLocked(true);
			userAccount.setPasswordExpired(false);
			userAccount.setAccountExpired(false);
			userAccount.setEmail(ruser.getEmail());
			userAccount.setMobile(ruser.getMobile());
			userAccount.setCreateTime(new Date());
			userAccount.setPassword(getEncodePassword(ruser.getPassword()));
			userAccount.setName(ruser.getFullname());
			userAccount.setLoginname(ruser.getUsername());
			userAccount.setOrg(null);
			Set<UserRole> urset = new HashSet<UserRole>();
			UserRole ur = new UserRole();
			ur = userRoleService.findOneByRoleName("游客");
			urset.add(ur);
			userAccount.setRoles(urset);
			commonDAO.save(userAccount);
			model.setViewName("redirect:/login");
			return model;
		} catch (Exception e) {
			e.printStackTrace();
			model.setViewName("redirect:/login");
			return model;
		}
	}

	@RequestMapping("/ajaxSaveRegister")
	@ResponseBody
	public Object ajaxSaveRegister(RegeistDto ruser) {
		UserAccount userAccount = new UserAccount();
		userAccount.setCode(UUIDUtils.getUUID16());
		userAccount.setEnabled(true);
		userAccount.setNonLocked(true);
		userAccount.setPasswordExpired(false);
		userAccount.setAccountExpired(false);
		userAccount.setEmail(ruser.getEmail());
		userAccount.setMobile(ruser.getMobile());
		userAccount.setPassword(getEncodePassword(ruser.getPassword()));
		userAccount.setName(ruser.getFullname());
		userAccount.setLoginname(ruser.getUsername());
		userAccount.setOrg(null);
		Set<UserRole> urset = new HashSet<UserRole>();
		UserRole ur = new UserRole();
		ur = userRoleService.findOneByRoleName("游客");
		urset.add(ur);
		userAccount.setRoles(urset);
		commonDAO.save(userAccount);
		return ResponseUtil.success();
	}

	@RequestMapping("/center")
	public ModelAndView infoCenter(ModelAndView model) {
		String userId = UserAccountUtil.getInstance().getCurrentUserId();
		UserAccount user = this.userAccountService.findOne(userId);
		UserAttrEntity userAttr = this.userAttrService.findOne(user.getCode());
		model.addObject("currentUser", user);
		model.addObject("userAttr", userAttr);
		model.setViewName("/admin/center");
		return Model(model);
	}

	@RequestMapping("/checkunique")
	public void checkloginname(HttpServletResponse response,
			@RequestParam(value = "param", required = false) String param,
			@RequestParam(value = "name", required = false) String name) {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			if (commonDAO.findByPropertyName(UserAccount.class, name, param)
					.size() > 0) {
				out.write("false");
			} else {
				if (commonDAO.findByPropertyName(TempUser.class, name, param)
						.size() > 0) {
					out.write("false");
				} else {
					out.write("true");
				}

			}
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping(value="/resetPassword",method=RequestMethod.GET)
	@ResponseBody
	public Object resetPassword(HttpServletRequest request,
			ModelAndView model,
			@RequestParam(value = "email", required = true) String email)
			throws IOException {
		try {
			UserAccount user = new UserAccount();
			user = userAccountService.findByEmail(email);
			if (user != null) {
				// String newPassword = getRandomString(12);
				// String jiamicode = getEncodePassword(newPassword);
				// user.setPassword(jiamicode);
				// commonDAO.update(user);
				// MailUtil.getInstance().sendMail(user.getEmail(), "重置密码",
				// newPassword);
				//===重置密码start
				MailUtil.getInstance().sendMail(user.getEmail(), "重置密码",
						this.getEMailContent(request, user));
				String sid = this.getDigitalSignature(user);
				request.getSession().setAttribute(sid, user.getLoginname());
				//===重置密码end
				return new HashMap() {{
		            put("status", 1);
		            put("msg", "邮件发送成功,请查收!");
		        }};
			} else {
				return new HashMap() {{
		            put("status", 0);
		            put("msg", "该邮箱注册的用户不存在！");
		        }};
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new HashMap() {{
	            put("status", 0);
	            put("msg", "操作失败！");
	        }};
		}
	}

	private String getEncodePassword(String password) {
		ShaPasswordEncoder sha = new ShaPasswordEncoder();
		sha.setEncodeHashAsBase64(false);
		return sha.encodePassword(password, null);
	}

	private String getRandomString(int length) { // length表示生成字符串的长度
		String base = "abcdefghijklmnopqrstuvwxyz0123456789";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			int number = random.nextInt(base.length());
			sb.append(base.charAt(number));
		}
		return sb.toString();
	}

	// ===========邮箱找回密码开始===========
	@RequestMapping("/checkUrl")
	public Object checkUrl(@RequestParam("sid") String sid,
			@RequestParam("user") String loginName,
			HttpServletRequest request) {
		if (!this.checkUrl(request, sid, loginName)) {
			return "/login";
		}
		return "/resetPassword";
	}

	private boolean checkUrl(HttpServletRequest request, String sid,
			String loginName) {
		boolean f = false;
		if (sid == null || loginName == null) {
			return f;
		}
		Object o = request.getSession().getAttribute(sid);
		if (o == null) {
			return f;
		}
		if (System.currentTimeMillis() - request.getSession().getCreationTime() > 1000 * 60 * 60 * 24) {
			return f;
		}
		if (!o.toString().equals(loginName)) {
			return f;
		}
		UserAccount user = this.userAccountService.findByLoginName(loginName);
		if (user == null) {
			return f;
		}
		return true;
	}

	private String getDigitalSignature(UserAccount user) {
		String key = user.getLastLoginTime();
		String str = user.getLoginname() + "-" + user.getEmail() + "-" + key;
		String digitalSignature = this.getEncodePassword(str);
		return digitalSignature;
	}

	private String getEMailContent(HttpServletRequest request, UserAccount user) {
		String digitalSignature = this.getDigitalSignature(user);
		String path = request.getContextPath();
		String resetPassHref = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getLocalPort() + path
				+ "/checkUrl"
				+ "?sid=" + digitalSignature + "&user=" + user.getLoginname();
		String content = "请勿回复本邮件.点击下面的链接,重设密码<br/><a href=" + resetPassHref
				+ " target='_BLANK'>" + resetPassHref + "</a>  或者    <a href="
				+ resetPassHref + " target='_BLANK'>点击我重新设置密码</a>"
				+ "<br/>tips:本邮件超过一天 ,链接将会失效，需要重新申请'找回密码'";
		return content;
	}

	@RequestMapping(value ="resetPassword",method=RequestMethod.POST)
	public Object updatePassword(HttpServletRequest request,
			ModelAndView model,
			@RequestParam("sid") String sid,
			@RequestParam("username") String username,
			@RequestParam("password") String password) {
		if (!this.checkUrl(request, sid, username))
			return Redirect(model, getRootPath() + "/login", "请重新申请！");// 错误
		UserAccount user = this.userAccountService.findByLoginName(username);
		user.setPassword(this.getEncodePassword(password));
		this.userAccountService.updateUser(user);
		request.getSession().removeAttribute(sid);
		return NewRedirect(model, getRootPath() + "/login", "修改成功请登陆！");
	}

	// ==========邮箱找回密码结束===========
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/loadMenus")
	public @ResponseBody
	Object loadMenus() {
		try {
			Comparator<UserMenu> c = new Comparator<UserMenu>() {
				public int compare(UserMenu o1, UserMenu o2) {
					return (int) ((o1.getSeq() == null ? 0 : o1.getSeq()) - (o2
							.getSeq() == null ? 0 : o2.getSeq()));
				}
			};
			Set<UserMenu> menus = new HashSet<UserMenu>();
			List list = new ArrayList();
			String[] roleid = UserAccountUtil.getInstance().getCurrentRoles()
					.split(",");
			List<UserMenu> menuList = new ArrayList<UserMenu>();
			for (String id : roleid) {
				if (myCache.get(id) == null) {
					putOneRole(id);
				}
				for (UserMenu m : (Set<UserMenu>) myCache.get(id)
						.getObjectValue()) {
					menus.add(m);
				}
			}
			for (UserMenu userMenu : menus) {
				menuList.add(userMenu);
			}
			Collections.sort(menuList, c);
			for (UserMenu m : menuList) {
				Map map = new HashMap();
				if(m.getIsShow()==null || m.getIsShow().equals("0")){
					continue;
				}
				map.put("id", m.getId());
				map.put("name", m.getName());
				if (m.getPuserMenu() != null) {
					if (!menuList.contains(m.getPuserMenu())) {
						map.put("pId", 0);
					} else {
						map.put("pId", m.getPuserMenu().getId());
					}
				} else {
					map.put("pId", 0);
				}
				map.put("icon", m.getIcon());
				map.put("url", m.getUrl());
				if (m.getChildren().size() == 0) {
					map.put("isLeaf", true);
				} else {
					map.put("isLeaf", false);
				}
				list.add(map);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return errorJson("异常");
		}
	}

	private void putOneRole(String roleId) {
		UserRole u = commonDAO.findOne(UserRole.class, roleId);
		putMenusByRole(u);
	}

	private void putMenusByRole(UserRole u) {
		Set<UserMenu> menus = new HashSet<UserMenu>();
		menus = u.getMenus();
		Element element = new Element(u.getCode(), menus);
		myCache.put(element);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/userInfo")
	public @ResponseBody
	Object userInfo() {
		try {
			UserAccount user = UserAccountUtil.getInstance()
					.getCurrentUserAccount();
			Map map = new HashMap();
			map.put("avatar", user.getHeadpic());
			map.put("userName", user.getName());
			map.put("status", "1");
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return errorJson("内部异常");
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/updateUserInfo")
	// @ResponseBody
	public Object updateUserInfo(ModelAndView model, UserAccount userAccount,
			UserAttrEntity userAttr) {
		String userCode = UserAccountUtil.getInstance().getCurrentUserId();
		UserAccount user = this.userAccountService.findOne(userCode);
		user.setEmail(userAccount.getEmail());
		user.setName(userAccount.getName());
		user.setMobile(userAccount.getMobile());
		this.userAccountService.updateUser(user);
		UserAttrEntity temp = this.userAttrService.findOne(userCode);
		userAttr.setUserId(userCode);
		if(temp==null){
			this.userAttrService.insert(userAttr);
		}else{
			this.userAttrService.update(userAttr);
		}
		model.setViewName("redirect:/center");
		return model;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/updatePassword")
	@ResponseBody
	public Object updatePassword(ModelAndView model,
			@RequestParam("oldpassword") String oldpassword,
			@RequestParam("newpassword") String newpassword) {
		UserAccount user = UserAccountUtil.getInstance()
				.getCurrentUserAccount();
		String password = user.getPassword();
		String jiamicode = getEncodePassword(oldpassword);
		if (!password.equals(jiamicode)) {
			return ResponseUtil.error("密码错误!");
		}
		user.setPassword(getEncodePassword(newpassword));
		this.userAccountService.updateUser(user);
		return ResponseUtil.success("修改成功,请重新登陆！");
		// return Redirect(model, getRootPath() + "/logout", "密码修改成功，请重新登陆！");
	}

	@RequestMapping(method = RequestMethod.POST, value = "/headpicUpload")
	public @ResponseBody
	Object singleUpload(
			@RequestParam(value = "file", required = false) MultipartFile multipartFile,
			HttpServletRequest httpServletRequest) throws IOException {
		if (multipartFile == null || multipartFile.isEmpty()) {
			return ResponseUtil.error("请先选择附件");
		}
		String fileType = multipartFile.getOriginalFilename()
                .substring(multipartFile.getOriginalFilename().lastIndexOf(".")+1);
            	String type="jpg,jpeg,png";
            	if(!type.contains(fileType))
            	{
            		JSONObject jsonList = JSONObject.fromObject(ResponseUtil.error("上传的文件格式不支持"));
            		Map map = ResponseUtil.error();
            		map.put("msg", "更新失败！(格式为jpg,jpeg,png)");
            		return map;
            	}
		String baseDir = System.getProperty("web.root");
		String path = baseDir + imagePath;
		String realfileName = multipartFile.getOriginalFilename();
		String fileName = String.valueOf(System.currentTimeMillis())
				+ realfileName.substring(realfileName.lastIndexOf("."));
		// String newFileName =
		// FileUtil.saveFileFromMultipartFile(multipartFile, path);
		File targetFile = new File(path);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		FileUtil.saveFileFromInputStream(multipartFile.getInputStream(), path,
				fileName);
		String url = "/"+projectName + "/" +imagePath+"/"+fileName;
		String id = String.valueOf(System.currentTimeMillis());
		fileService.insertFile(id, url,
				String.valueOf(multipartFile.getSize()), realfileName,
				multipartFile.getContentType(), path + "/" + fileName, "0");
		String userId = UserAccountUtil.getInstance().getCurrentUserId();
		UserAccount user = this.userAccountService.findOne(userId);
		user.setHeadpic(url);
		// user.set(id);
		this.userAccountService.updateUser(user);
		Map map = ResponseUtil.success();
		map.put("msg", "更新成功！");
		return map;
	}
}