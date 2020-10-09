package com.dm.platform.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.crypto.codec.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.org.bjca.uams.process.RequestProcessor;
import cn.org.bjca.uams.strategy.TransJsonStringToMap;

import com.bjca.uums.client.bean.DepartmentInformation;
import com.bjca.uums.client.bean.LoginInformation;
import com.bjca.uums.client.bean.PersonInformation;
import com.dm.app.util.judge.StringUtils;
import com.dm.platform.dao.CommonDAO;
import com.dm.platform.model.Org;
import com.dm.platform.model.UserAccount;
import com.dm.platform.model.UserRole;
import com.dm.platform.service.OrgService;
import com.dm.platform.service.UserAccountService;
import com.dm.platform.service.UserAttrService;
import com.dm.platform.service.UserRoleService;

@Controller
@RequestMapping("bjca")
public class NewCASynInfoController extends DefaultController {
	
	private Logger logger = org.slf4j.LoggerFactory.getLogger(NewCASynInfoController.class);

	@Resource
	UserRoleService userRoleService;

	@Resource
	UserAccountService userAccountService;
	String defaultRoleIds="hx9kdcfScHuFLqZf";

	@Resource
	CommonDAO commonDAO;

	@Resource
	UserAttrService userAttrService;

	@Resource
	OrgService orgService;

	private int baseUrl;

	private int queryOrg;

	private int authId;

	private int queryUser;

	@RequestMapping("SynchronizeInfo")
	public boolean SynchronizeInfo(
			HttpServletRequest request,HttpServletResponse response) {
		String synType = request.getParameter("synType");
		// System.out.println("同步信息--------------------------------------"+synType);
		if (null != request.getParameter("operateID") && null != synType) {
			int synFlag = Integer.parseInt(synType);
			switch (synFlag) {
			case 0:
				return synchronizeUser(request, response);
			case 1:
				return synchronizeDept(request, response);
				
			case 2:
				synchronizeUser(request, response);
				synchronizeDept(request, response);
				return true;
			default:
				return false;
			}
		} else {
			return false;
		}
		
	}

	private boolean synchronizeDept(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			Integer operateID = Integer
					.parseInt(request.getParameter("operateID"));
			Map map = new HashMap();
			String orgNumber = request.getParameter("orgNumber");
			String requestUrl = baseUrl + queryOrg + "?orgNumber="
					+ orgNumber + "&authId=" + authId;
			Map requestMap = sendRequest(map, requestUrl);
			int status = Integer.parseInt(requestMap.get("status")
					.toString());
			Map info = (Map) requestMap.get("info");
			DepartmentInformation department = getDepartment(info);
//			info.get
			if (status == 0) {
				// 2)更新应用系统中的机构信息
				// 应用系统自己处理
				// 3）返回结果 ，true 或者 false	
				if(operateID==41){
					return insertDepart(department);
				}
				if(operateID==42){
					return updateDepart(department);
				}
				if(operateID==43){
					return deleteDepart(department);
				}
			}
		} catch (Exception ex) {
			this.logger.info(ex.getMessage());
		}
		return false;
	}
	private DepartmentInformation getDepartment(Map info) {
		DepartmentInformation dept = new DepartmentInformation();
		dept.setDepartCode(getString(info,"orgCode"));
		dept.setDepartDescript(getString(info,"orgDescript"));
		dept.setDepartName(getString(info,"orgName"));
		dept.setDepartSortNum(getString(info,"orgSortNum"));
		dept.setDepartUpcode(getString(info,"orgUpCode"));
		return dept;
	}

	private String getString(Map info,String key) {
		if(info!=null){
			if(info.get(key)!=null){
				return (String)info.get(key);
			}
		}
		return null;
	}

	private boolean deleteDepart(DepartmentInformation department) {
		Org org = getByCode(department.getDepartCode());
		if(org!=null){
			List<Org> childs =commonDAO.findByPropertyName(Org.class, "pid", org.getId());
			if(childs.size()==0){
				orgService.deleteOrg(org);
			}else{
				System.out.println("删除部门失败！有改部门有子部门存在");
				return false;
			}
		}else{
			System.out.println("删除的部门不存在");
		}
		return true;
		
	}
	private boolean updateDepart(DepartmentInformation department) {
		Org org = getByCode(department.getDepartCode());
		if(org==null){
			return this.insertDepart(department);
		}
		org.setName(department.getDepartName());
		org.setCode(department.getDepartCode());
		org.setSeq(Long.valueOf(department.getDepartSortNum()));
		Org parent = getByCode(department.getDepartUpcode());
		org.setParent(parent);
		orgService.updateOrg(org);
		System.out.println("更新部门成功！");
		return true;
	}
	private boolean insertDepart(DepartmentInformation department) {
		Org org = getByCode(department.getDepartCode());
		if(org!=null){
			return true;//this.updateDepart(department);
		}
		org = new Org();
		org.setId(System.currentTimeMillis());
		org.setName(department.getDepartName());
		org.setCode(department.getDepartCode());
		org.setSeq(Long.valueOf(department.getDepartSortNum()==null?"1":department.getDepartSortNum()));
		if(department.getDepartUpcode()!=null){
			Org parent = getByCode(department.getDepartUpcode());
			if(parent==null){
				System.out.println("添加的部门父级部门找不到");
				//return false;
			}
			org.setParent(parent);
		}else{
			org.setParent(null);
		}
		orgService.insertOrg(org);
		System.out.println("添加的部门成功");
		return true;
	}
	private Org getByCode(String code){
		List<Org> list = commonDAO.findByPropertyName(Org.class, "code", code);
		if(list.size()>0)
			return list.get(0);
		return null;
		
	}
	private boolean synchronizeUser(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			Integer operateID = Integer
					.parseInt(request.getParameter("operateID"));
			String userIdCode = request.getParameter("userIdCode");
			String userType = request.getParameter("userType");
			this.logger.info("用户信息operateID:" +operateID + "用户唯一标识：" + userIdCode);Map map = new HashMap();
			String requestUrl = baseUrl + queryUser
					+ "?userIdCode=" + userIdCode + "&authId="
					+ authId;
			Map requestMap = sendRequest(map, requestUrl);
			int status = Integer.parseInt(requestMap.get("status")
					.toString());
			Map info = (Map) requestMap.get("info");
			if (status == 0) {
				
			/*operateID 
			 * 11 新增用户 、12 修改用户、 13 删除用户
			 */
			PersonInformation person = getUserInfo(info);
			
			LoginInformation loginInformation = getLoginInfo(info);//（单独证书用户没有此对象）
			if (operateID == 11) {//新增用户
				return insertUser(person,loginInformation);
			}
			if (operateID == 12) {//更新用户
				return updateUser(person,loginInformation);
			}

			if (operateID == 13) {
				return delUser(person,loginInformation);
			}
			

//createTime={time=1498702219000, minutes=10, seconds=19, hours=10, month=5, year=117, timezoneOffset=-480, day=4, date=29}, userIdcardNum=, appUserList=[], rootName=, policyBaseInfos=[], userEmail=, userExtList=[], userType=2, uniqueId=fa9d298a48e54cd28a294e41d5cfd398, userCredenceInfoVOCert=null, userDefault2=, userDefault3=, userDefault1=, userName=你好, userPhone=, userIdCode=fa9d298a48e54cd28a294e41d5cfd398, duties=[], asName=, groups=[], unitCode=, userSortnum=9999, userModPwdFlag=0, organizations=[], titleVOList=[], userLoginType=0, pbiList=[], certList=[], userIdType=, userAttrList=[], orglist=[{orgFlowno=7342946b9bc64c9f84ef93e0886c01bc, orgCode=100110041005, orgNumber=C060000, utoFlowno=6e95fc06a3f540a3b63d4c9b43dd4869, orgName=区经济和信息化委员会, uniqueId=fa9d298a48e54cd28a294e41d5cfd398, userType=2}], unitName=测试单位, roles=[], userStatus=1, credenceList=[{certNumber=, certUniqueid=, userInfoVO=null, creatTime=, pwdModifiedDate=2017-06-29 10:10:18.0, userType=2, credenceState=1, uniqueid=fa9d298a48e54cd28a294e41d5cfd398, credenceFlowno=3c89581dc8ff451a9a0676a6453a7f82, uciDefault2=s/iLHzG4kfg=, uciDefault3=, credenceType=, uciDefault1=, credenceClass=Credence_002, certStatus=, credenceAppend={SSHA}LJa4L2GQAbT6SV73w8ksIrY5ejhmK3pNNFAxRVJHMGYzWFpUWUVnPT0=, loginName=ceshi1}], userCredenceInfoVOPwd=null

					
					
//				用户信息:{createTime={time=1472121402000, minutes=36, seconds=42, hours=18, month=7, year=116, 
//					timezoneOffset=-480, day=4, date=25}, userIdcardNum=, appUserList=[], rootName=, policyBaseInfos=[], 
//					userEmail=zhangshengrong@bjca.org.cn, userExtList=[], userType=1, uniqueId=ba958bfb93da4b0cbb6d75a9570e9186, 
//					userCredenceInfoVOCert=null, userDefault2=, userDefault3=, userDefault1=, userName=赵盛荣, userPhone=, 
//					userIdCode=ba958bfb93da4b0cbb6d75a9570e9186, duties=[], asName=, groups=[], unitCode=, userSortnum=9999,
//					userModPwdFlag=1, organizations=[], titleVOList=[], userLoginType=0, pbiList=[], certList=[], userIdType=-1, 
//					userAttrList=[
//					{aiDefaultValue=, isPermitUpdate=0, aiTypeComplex=, aiType=select, aiIsComplex=1, 
//					valueList=[
//					{avDefault1=, avDefault2=, avCode=1, avDefault3=, isDefault=1, aiFlowno=2f9b447771e944319a96c34c20400284, avName=初级, checked=checked, avFlowno=0550eeef9a514648b0fada264f233e72}, 
//					{avDefault1=, avDefault2=, avCode=2, avDefault3=, isDefault=0, aiFlowno=2f9b447771e944319a96c34c20400284, avName=中级, checked=, avFlowno=a78926d5b8d3476396bd193c5a490d5f}, 
//					{avDefault1=, avDefault2=, avCode=3, avDefault3=, isDefault=0, aiFlowno=2f9b447771e944319a96c34c20400284, avName=高级, checked=, avFlowno=e2d8e6a2ff9f4504a0e29c7d9c16baf7}, 
//					{avDefault1=, avDefault2=, avCode=4, avDefault3=, isDefault=0, aiFlowno=2f9b447771e944319a96c34c20400284, avName=任务部署, checked=, avFlowno=053d74507d4b4ba98ed4ae61f311a131}], 
//					aiEname=title, aiName=职位, asCode=, isEmpty=1, aiTypeSimply=, valueVOList=[], aiFlowno=2f9b447771e944319a96c34c20400284, aiDescribe=, aiDefault2=, aiDefault1=, aiDefault3=, asName=}], 
//					orglist=[
//					{orgFlowno=ebb455c528164c0ca3ee723f4a18bb17, orgCode=10011019, orgNumber=sxsjzsyjj, utoFlowno=8a4c80239ed1454180f104466ccd5e9c, orgName=山西省晋中食药监局, uniqueId=ba958bfb93da4b0cbb6d75a9570e9186, userType=1}],
//					unitName=, roles=[], userStatus=1, 
//					credenceList=[
//					{certNumber=, certUniqueid=, userInfoVO=null, creatTime=, pwdModifiedDate=2016-08-25 18:43:05.0, userType=-1, credenceState=1, uniqueid=ba958bfb93da4b0cbb6d75a9570e9186, credenceFlowno=00835815aee04604919faf069684619d, uciDefault2=9vJylZTqTc8=, uciDefault3=, credenceType=, uciDefault1=, credenceClass=Credence_002, certStatus=, credenceAppend={SSHA}SYAMxMjgbnwzjd1DoXYbibfwIPRJdG5RTnJxYzdYb01yY2tiMVprczFBPT0=, loginName=wzk}, 
//					{certNumber=, certUniqueid=SF140203197901253244, userInfoVO=null, creatTime=, pwdModifiedDate=2016-08-25 18:41:25.0, userType=-1, credenceState=1, uniqueid=ba958bfb93da4b0cbb6d75a9570e9186, credenceFlowno=e598f7843fce42f086a5dac8c5abe766, uciDefault2=, uciDefault3=, credenceType=, uciDefault1=, credenceClass=Credence_001, certStatus=, credenceAppend=, loginName=}], userCredenceInfoVOPwd=null}
			}			
		} catch (Exception ex) {
			this.logger.info(ex.getMessage());
		}
		return false;
	}
		private LoginInformation getLoginInfo(Map info) {
			LoginInformation login = new LoginInformation();
			//登录名
			ArrayList<Map<String,String>> credenceList = (ArrayList<Map<String,String>>)info.get("credenceList");
			for(Map<String,String> maploopcredenceList : credenceList)
			{
//			值为 Credence_002 代表用户名密码方式（密码加密码处理，无法获得） ； Credence_001代表证书方式	
				String credenceClass = maploopcredenceList.get("credenceClass");
				if(credenceClass!=null && credenceClass.equals("Credence_002")){
					String loginName = maploopcredenceList.get("loginName");
					login.setLoginName(loginName);
					login.setLoginPwd("sn@userPWD");//默认密码
					break;
				}
			}
			return login;
			
	}

		private PersonInformation getUserInfo(Map info) {
			PersonInformation person = new PersonInformation();
			//用户基本属性
			this.logger.info("用户信息:" + info.toString());
			this.logger.info("用户姓名:" + info.get("userName"));
			this.logger.info("用户邮箱:" + info.get("userEmail"));
			person.setUserEmail(getString(info,"userEmail"));
			person.setUserName(getString(info,"userName"));
			person.setUserIdcardNum(getString(info,"userIdcardNum"));
			person.setUserIdcode(getString(info,"userIdCode"));
			person.setUserPhone(getString(info,"userPhone"));
			Collection departs = new ArrayList<>();
			//用户所在机构
			ArrayList<Map<String,String>> orglist = (ArrayList<Map<String,String>>)info.get("orglist");
			for(Map<String,String> maplooporglist : orglist)
			{
				DepartmentInformation depart  = getDepartment(maplooporglist);
				departs.add(depart);
				break;
				
			}
			person.setDeparts(departs);
			return person;
			
	}

		private boolean delUser(PersonInformation person,
			LoginInformation loginInformation) {
		System.out.println("删除-用户32位码===" + person.getUserIdcode());
		UserAccount entity = userAccountService.findOne(person.getUserIdcode());
		if(entity!=null){
			userAccountService.deleteUser(entity);
			System.out.println("删除用户成功");
		}else{
			System.out.println("要删除的用户找不到");
		}
		return true;
	}
	private boolean updateUser(PersonInformation person,
			LoginInformation loginInformation) {
		Collection collection = person.getDeparts();
		Iterator it = collection.iterator();
		Org org = null;
		while (it.hasNext()) {
			DepartmentInformation depart = (DepartmentInformation) it
					.next(); 
			System.out.println("DepartCode=" + depart.getDepartCode());
			System.out.println("Default=" + depart.getDepartDefault());
			System.out.println("DepartUpcode=" + depart.getDepartUpcode());
			org = this.getByCode(depart.getDepartCode());
			if(org==null){
				insertDepart(depart);
				org = this.getByCode(depart.getDepartCode());
			}
			break;
		}
		System.out.println("更新-用户32位码===" + person.getUserIdcode());

		System.out.println("用户姓名===" + person.getUserName());
		System.out.println("用户身份证号码===" + person.getUserIdcardNum());
		System.out.println("用户登录名===="+ loginInformation.getLoginName());
		UserAccount user = userAccountService.findByLoginName(loginInformation.getLoginName());
		if(user==null){//添加
			return insertUser(person, loginInformation);
			//return true;
		}
		user.setName(loginInformation.getLoginNickName());
		user.setEmail(person.getUserEmail());
		user.setIdCard(person.getUserIdcardNum());
		user.setMobile(person.getUserPhone());
		Date date = new Date();
		user.setUpdateTime(date);
		ShaPasswordEncoder sha = new ShaPasswordEncoder();
		String password = loginInformation.getLoginPwd();
		sha.setEncodeHashAsBase64(false);
		user.setPassword(sha.encodePassword(
				password, null));
		user.setSynPassword(new String(Base64.encode(loginInformation.getLoginPwd().getBytes())));
				
		user.setOrg(org);
		userAccountService.updateUser(user);
		return true;
		
	}
	private boolean insertUser(PersonInformation person, LoginInformation loginInformation){
			Collection collection = person.getDeparts();
			Iterator it = collection.iterator();
			Org org = null;
			while (it.hasNext()) {
				DepartmentInformation depart = (DepartmentInformation) it
						.next(); 
				System.out.println("DepartCode=" + depart.getDepartCode());
				System.out.println("Default=" + depart.getDepartDefault());
				System.out.println("DepartUpcode=" + depart.getDepartUpcode());
				org = this.getByCode(depart.getDepartCode());
				if(org==null){
					insertDepart(depart);
					org = this.getByCode(depart.getDepartCode());
				}
				break;
			}
			System.out.println("添加-用户32位码===" + person.getUserIdcode());

			System.out.println("用户姓名===" + person.getUserName());
			System.out.println("用户身份证号码===" + person.getUserIdcardNum());
			System.out.println("用户登录名===="+ loginInformation.getLoginName());
			UserAccount u = userAccountService.findByLoginName(loginInformation.getLoginName());
			if(u!=null){//更新
				System.out.println("同步用户："+ loginInformation.getLoginName()+" 已存在 ");
				//TODO 用户已存在 是否更新
				return true;
			}
			UserAccount user = new UserAccount();
			user.setLoginname(loginInformation.getLoginName());
			//user.setCode(person.getUserIdcardNum());
			user.setIdCard(person.getUserIdcardNum());
			user.setCode(person.getUserIdcode());
			user.setName(person.getUserName());
			user.setEnabled(true);
			user.setEmail(person.getUserEmail());
			user.setMobile(person.getUserPhone());
			Date date = new Date();
			user.setCreateTime(date);
			user.setUpdateTime(date);
			user.setNonLocked(true);
			ShaPasswordEncoder sha = new ShaPasswordEncoder();
			sha.setEncodeHashAsBase64(false);
			user.setPassword(sha.encodePassword(
					loginInformation.getLoginPwd(), null));
			user.setPasswordExpired(false);
			user.setAccountExpired(false);
			user.setSynPassword(new String(Base64.encode(loginInformation.getLoginPwd().getBytes())));
			//角色
			if (!StringUtils.isEmpty(defaultRoleIds)) {
				Set<UserRole> urset = new HashSet<UserRole>();
				String ids[] = defaultRoleIds.split(",");
				for (String roleid : ids) {
					UserRole ur = new UserRole();
					ur = commonDAO.findOne(UserRole.class, roleid);
					urset.add(ur);
				}
				user.setRoles(urset);
			} else {
				user.setRoles(null);
			}
			user.setOrg(org);
			userAccountService.insertUser(user);
			System.out.println("同步用户："+ loginInformation.getLoginName()+" 成功！ ");
			return true;
	}
	private Map sendRequest(Map<String, Object> map, String requestUrl) {
		RequestProcessor requestProcessor = new RequestProcessor(map,
				requestUrl, null).invoke();
		if (requestProcessor.isFailed()) {
			return null;
		}
		String result = requestProcessor.getResult();
		Map requestMap = null;
		try {
			requestMap = new TransJsonStringToMap().transResultStringToMap(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return requestMap;
	}
}