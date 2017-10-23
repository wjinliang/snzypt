package com.dm.atform.aop;

import java.lang.reflect.Method;
import java.util.Date;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dm.platform.dao.CommonDAO;
import com.dm.platform.model.LogEntity;
import com.dm.platform.model.UserAccount;
import com.dm.platform.util.DmDateUtil;
import com.dm.platform.util.UserAccountUtil;

@Component
@Aspect
public class AtFormLogAspect {
	private static Logger logger = Logger.getLogger(AtFormLogAspect.class);
	@Autowired
	private CommonDAO commonDAO;



	@Pointcut("execution(* com.dm.atform.service.*.save*(..))")
	public void saveServiceCall() {
	}
	@Pointcut("execution(* com.dm.atform.service.*.update*(..))")
	public void updateServiceCall() {
	}

	@Pointcut("execution(* com.dm.atform.service.*.delete*(..))")
	public void deleteServiceCall() { 
	}



	@AfterReturning(value = "saveServiceCall()", argNames = "rtv", returning = "rtv")
	public void saveServiceCallCalls(JoinPoint joinPoint, Object rtv)
			throws Throwable {

		// 获取方法名
		String methodName = joinPoint.getSignature().getName();
		// 判断参数
		if (joinPoint.getArgs() != null) {
			joinPoint.getArgs()[0].getClass();
		}
		// 创建日志对象
		LogEntity log = new LogEntity();
		UserAccount user = UserAccountUtil.getInstance()
				.getCurrentUserAccount();
		if(user==null){
			user = new UserAccount();
			user.setName("网友");
		}
		log.setUser(user.getName() + "(" + user.getCode() + ")");
		log.setTitle(joinPoint.getTarget().getClass().getName() + "."
				+ methodName + "正常。");
		log.setContent(adminOptionContent(joinPoint.getArgs(), user.getName()
				+ ":添加"));
		log.setDate(DmDateUtil.DateToStr(new Date(), "yyyy-MM-dd HH:mm:ss"));
		log.setType("9");
		log.setSbtype("1");
		try{
			log.setIp(UserAccountUtil.getInstance().getCurrentIp());
		}catch(RuntimeException e){
			
		}
		commonDAO.save(log);
	}
	@AfterReturning(value = "updateServiceCall()", argNames = "rtv", returning = "rtv")
	public void updateServiceCallCalls(JoinPoint joinPoint, Object rtv)
			throws Throwable {

		// 获取方法名
		String methodName = joinPoint.getSignature().getName();
		// 判断参数
		if (joinPoint.getArgs() != null) {
			joinPoint.getArgs()[0].getClass();
		}
		// 创建日志对象
		LogEntity log = new LogEntity();
		UserAccount user = UserAccountUtil.getInstance()
				.getCurrentUserAccount();
		if(user==null){
			user = new UserAccount();
			user.setName("网友");
		}
		log.setUser(user.getName() + "(" + user.getCode() + ")");
		log.setTitle(joinPoint.getTarget().getClass().getName() + "."
				+ methodName + "正常。");
		log.setContent(adminOptionContent(joinPoint.getArgs(), user.getName()
				+ ":更新"));
		log.setDate(DmDateUtil.DateToStr(new Date(), "yyyy-MM-dd HH:mm:ss"));
		log.setType("9");
		log.setSbtype("2");
		try{
			log.setIp(UserAccountUtil.getInstance().getCurrentIp());
		}catch(RuntimeException e){
			
		}
		commonDAO.save(log);
	}

	@AfterReturning(value = "deleteServiceCall()", argNames = "rtv", returning = "rtv")
	public void deleteServiceCallCalls(JoinPoint joinPoint, Object rtv)
			throws Throwable {
		// 获取方法名
		String methodName = joinPoint.getSignature().getName();
		// 创建日志对象
		LogEntity log = new LogEntity();
		UserAccount user = UserAccountUtil.getInstance()
				.getCurrentUserAccount();
		log.setUser(user.getName() + "(" + user.getCode() + ")");
		log.setTitle(joinPoint.getTarget().getClass().getName() + "."
				+ methodName + "正常。");
		log.setContent(adminOptionContent(joinPoint.getArgs(), user.getName()
				+ ":删除"));
		log.setSbtype("3");
		log.setDate(DmDateUtil.DateToStr(new Date(), "yyyy-MM-dd HH:mm:ss"));
		log.setType("9");
		log.setIp(UserAccountUtil.getInstance().getCurrentIp());
		commonDAO.save(log);
	}


	private String adminOptionContent(Object[] args, String mName)
			throws Exception {

		if (args == null) {
			return null;
		}
		
		
		StringBuffer rs = new StringBuffer();
		rs.append(mName);
		String className = null;
		// 遍历参数对象
		for (Object info : args) {
			// 获取对象类型
			if(info==null){
				continue;
			}
			if(info!=null){
				rs.append(info.toString());
				continue;
			}
			
			className = info.getClass().getName();
			className = className.substring(className.lastIndexOf(".") + 1);
			if(className.equals("String")||className.equals("HttpServlet3RequestFactory$Servlet3SecurityContextHolderAwareRequestWrapper")){
				continue;
			}
			rs.append("[类型：" + className + "，值：");
			// 获取对象的所有方法
			Method[] methods = info.getClass().getDeclaredMethods();
			// 遍历方法，判断get方法
			boolean flag = false;
			for (Method method : methods) {
				String methodName = method.getName();
				// 判断是不是get方法
				if ((methodName.indexOf("getId") == -1)
						&& (methodName.indexOf("getCode") == -1)) {// 不是get方法
					continue;// 不处理
				}

				Object rsValue = null;
				try {

					// 调用get方法，获取返回值
					rsValue = method.invoke(info);

					if (rsValue == null) {// 没有返回值
						continue;
					}

				} catch (Exception e) {
					continue;
				}

				// 将值加入内容中
				rs.append("(" + methodName.replace("get", "") + " : " + rsValue
						+ ")");
				flag = true;
			}
			if (!flag) {
				rs.append("(" + String.valueOf(info) + ")");
			}
			rs.append("]");
		}

		return rs.toString();
	}

}
