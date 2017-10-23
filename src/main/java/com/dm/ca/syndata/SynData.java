package com.dm.ca.syndata;

import java.net.MalformedURLException;
import java.rmi.RemoteException;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.xml.rpc.ServiceException;

import org.springframework.remoting.jaxrpc.ServletEndpointSupport;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.crypto.codec.Base64;

import com.bjca.uums.client.bean.DepartmentInformation;
import com.bjca.uums.client.bean.LoginInformation;
import com.bjca.uums.client.bean.PersonInformation;
import com.dm.app.util.judge.StringUtils;
import com.dm.cms.util.AppUtil;
import com.dm.platform.dao.CommonDAO;
import com.dm.platform.model.Org;
import com.dm.platform.model.UserAccount;
import com.dm.platform.model.UserRole;
import com.dm.platform.service.OrgService;
import com.dm.platform.service.UserAccountService;


@SuppressWarnings("deprecation")
public class SynData extends ServletEndpointSupport {
//	private final java.lang.String USER_WSDL = "http://172.24.61.35:9001/uumsinterface/services/User?wsdl"; //测试地址
//	private final java.lang.String DEPARTMENT_WSDL = "http://172.26.61.35:9001/uumsinterface/services/Department?wsdl";//测试地址
//	@Value("${USER_WSDL}")
	private java.lang.String USER_WSDL;
//	@Value("${DEPARTMENT_WSDL}")
	private java.lang.String DEPARTMENT_WSDL;
//	@Value("${defaultPassword}")
	private String defaultPassword;
//	@Value("${defaultRoleIds}")
	private String defaultRoleIds;
//	@Autowired
	private CommonDAO commonDAO;
//	@Autowired
	private UserAccountService userAccountService ;
//	@Autowired
	private OrgService orgService;
	/*
	 * operateID:操作类型  用户11、12、13， 角色21、22、23，机构 41、42、43  
	 * operateCode:操作码，同步用户时为用户32位码,同步机构时为机构编码,同步角色时为系统编码
	 * operateType:此参数仅用于区分个人用户和单位用户（此参数基本不用管）,个人用户 1，单位用户 2，其它内容（角色、部门，用户角色关系） 0
	 */
	
	@Override
	protected void onInit() throws ServiceException {
		super.onInit();
		USER_WSDL="http://172.24.61.35:9001/uumsinterface/services/User?wsdl"; //测试地址
		DEPARTMENT_WSDL="http://172.24.61.35:9001/uumsinterface/services/Department?wsdl";//测试地址
		defaultRoleIds="hx9kdcfScHuFLqZf";
		
		commonDAO = (CommonDAO) AppUtil.getBean("commonDAOImpl");
		userAccountService = (UserAccountService) AppUtil.getBean("userAccountServiceImpl");
		orgService = (OrgService) AppUtil.getBean("orgServiceImpl");
	}
	public boolean SynchronizedUserInfo(int operateID, String operateCode,
			String operateType) {
		boolean bol = false;
		System.out.println("operateID=======" + operateID);
		System.out.println("operateCode=======" + operateCode);
		System.out.println("operateType=======" + operateType);

		try{
			if(operateID==11||operateID==12||operateID==13){
				bol = synUser(operateID, operateCode,
				operateType);
			}
			if(operateID==21||operateID==22||operateID==23){
				bol = true;
			}
			if(operateID==41||operateID==42||operateID==43){
				bol = synDepart(operateID, operateCode,operateType);
			}
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return bol;
	}
	private boolean synDepart(int operateID, String operateCode, String operateType) {
		com.bjca.uumsinterface.services.Department.DepartmentSoapBindingStub binding1 = null;
		java.net.URL endpoint_Department = null;

		try {
			endpoint_Department = new java.net.URL(DEPARTMENT_WSDL);
		} catch (MalformedURLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			binding1 = (com.bjca.uumsinterface.services.Department.DepartmentSoapBindingStub) new com.bjca.uumsinterface.services.Department.DepartmentServiceLocator()
					.getDepartment(endpoint_Department);
		} catch (javax.xml.rpc.ServiceException jre) {
			if (jre.getLinkedCause() != null)
				jre.getLinkedCause().printStackTrace();
			throw new junit.framework.AssertionFailedError(
					"JAX-RPC ServiceException caught: " + jre);
		}
		// Time out after a minute
		binding1.setTimeout(60000);
		DepartmentInformation department = null;
		//DepartmentInformation department_1 = null;
		try {
			department = binding1.findDepartByDepartCodeForDC(operateCode);
			//department_1 = binding1.findDepartByDepartID(operateCode);//此方法已经废弃

		} catch (RemoteException e) {
			e.printStackTrace();
		}
		String departupcode = department.getDepartUpcode();
		String departcode = department.getDepartCode();
		String departname = department.getDepartName();
		System.out.println("部门上级编码====" + departupcode);
		System.out.println("部门编码为====" + departcode);
		System.out.println("部门名称====" + departname);
		if(operateID==41){
			return insertDepart(department);
		}
		if(operateID==42){
			return updateDepart(department);
		}
		if(operateID==43){
			return deleteDepart(department);
		}
		return true;
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
	private boolean synUser(int operateID, String operateCode,
			String operateType) {
		boolean bol = false;
		com.bjca.uumsinterface.services.User.UserSoapBindingStub binding = null;
		java.net.URL endpoint_User = null;
		try {
			endpoint_User = new java.net.URL(USER_WSDL);
		} catch (MalformedURLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			
			binding = (com.bjca.uumsinterface.services.User.UserSoapBindingStub) new com.bjca.uumsinterface.services.User.UserServiceLocator()
					.getUser(endpoint_User);
		} catch (javax.xml.rpc.ServiceException jre) {
			if (jre.getLinkedCause() != null)
				jre.getLinkedCause().printStackTrace();
			throw new junit.framework.AssertionFailedError(
					"JAX-RPC ServiceException caught: " + jre);
		}
		// Time out after a minute
		binding.setTimeout(60000);
		PersonInformation person = null;
		
		LoginInformation loginInformation = null;//（单独证书用户没有此对象）
		try {	
			person = binding.findPersonInfosByUserIDForDC(operateCode);
			//需要用户的登录信息(口令用户)
			loginInformation = binding
					.getLoginInformationByUserID(operateCode);
		} catch (RemoteException e) {
			e.printStackTrace();
		}	
		/*operateID 
		 * 11 新增用户 、12 修改用户、 13 删除用户
		 */
		if (operateID == 11) {//新增用户
			insertUser(person,loginInformation);
			return true;
		}
		if (operateID == 12) {//更新用户
			updateUser(person,loginInformation);
			return true;
		}

		if (operateID == 13) {
			delUser(person,loginInformation);
			bol = true;
		}
		return bol;
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
	public static void main(String[] args) throws ServiceException {
		// TODO Auto-generated method stub
		SynData demoWebService = new SynData();
		demoWebService.onInit();
		demoWebService.SynchronizedUserInfo(11, "3144c04fee219e979ef9e0c1482f2948", "1");
		//demoWebService.SynchronizedUserInfo(11, "b0b5e0c64f840687e91c4bf4f7537634", "1");
	}
}

