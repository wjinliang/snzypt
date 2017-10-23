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

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.crypto.codec.Base64;

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


public class CopyOfSynData {
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
	ApplicationContext app;
	/*
	 * operateID:操作类型  用户11、12、13， 角色21、22、23，机构 41、42、43  
	 * operateCode:操作码，同步用户时为用户32位码,同步机构时为机构编码,同步角色时为系统编码
	 * operateType:此参数仅用于区分个人用户和单位用户（此参数基本不用管）,个人用户 1，单位用户 2，其它内容（角色、部门，用户角色关系） 0
	 */
	
	protected void onInit() {
		USER_WSDL="http://172.24.61.35:9001/uumsinterface/services/User?wsdl"; //测试地址
		DEPARTMENT_WSDL="http://172.24.61.35:9001/uumsinterface/services/Department?wsdl";//测试地址
		defaultRoleIds="hx9kdcfScHuFLqZf";
		app = new ClassPathXmlApplicationContext("classpath:config/spring/applicationContext.xml");
		commonDAO = (CommonDAO) app.getBean("commonDAOImpl");
		userAccountService = (UserAccountService) app.getBean("userAccountServiceImpl");
		orgService = (OrgService) app.getBean("orgServiceImpl");
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
		user.setMobile(person.getUserPhone());
		user.setIdCard(person.getUserIdcardNum());
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
		CopyOfSynData demoWebService = new CopyOfSynData();
		demoWebService.onInit();
		String[] list = new String[]{

				"7b05d1e1ce941069ec92d59b209a8da1",
				"023c154416455727b9826fbbf409798b",
				"ec1e48c6495f2f922e41c4a8c6f2883b",
				"83a15ebbf9f5f21db3d721eeeaa34dc4",
				"81b3b5315211cf848a84f85c540612bb",
				"f5ccce874eeda19aea47d8acff4e3b02",
				"3d4d714db78b0384dcb4461fbb6e8f51",
				"416328b291f028a2ae9e3ce9bb08df4c",
				"71daf34b11b605ba5173e0538a89bbfd",
				"dd9111d0b00b47af631d90274d6a4659",
				"77bfb2025dcf72e9fc2bede6bdcf52ce",
				"caa356278bf105badab340889f6a3dd4",
				"17f9b6d0af4fd708b45a75714f389601",
				"4e33f61f8f58238ae6c0fbf2973af15e",
				"5d0b8bf83dab07934c399272b2711f73",
				"baa80cf1f660aed3adf43ada4e5b3e76",
				"cb99b1b1cd936aeccfdb1c3c73de08c2",
				"fbd0db551f07e4bbf1dcbad6445c5d72",
				"dd84fa849432ae05679ccb86d67f8ff2",
				"0af11a48860cf340266a2fa87bd57346",
				"b87c2c0ec7bb1c4599fb20f8fc1984c5",
				"770780edb3ffaeff517aec3591cecbbb",
				"3fb5d1053864e7e68b027b8c813a2e90",
				"dabe6b4285f14144b81c6a1fbf7a8c30",
				"a72bf50c5a23b0482036f0e3bed1e90b",
				"1a9dd741c07cabe4e0481a7a13c2ad0e",
				"873db7974a3b8fc1b8d1ab66b190b6e2",
				"f5dd4c9eae2644ba28b162631f0898b5",
				"d831dcf65f10083c208b6af4fc0afefe",
				"a8c41322d417264d13f8dcfe909c40d3",
				"c66872ec265a74b3bafe69d5a824fbeb",
				"3c7cae8eeb817cb41fdaca4bb99b3c73",
				"1892ed776b849b6806e2d9360e12ffdc",
				"343f4d6bc2030a9ca1b6652c64b1c624",
				"b3792f9bb32757892d47af5c5c262707",
				"3eb4be08fa4a28bddc51572698a6974a",
				"91d5445b4b349a256c31cc78ae7f35cb",
				"2e359ff3ff9fae1b75a41cbfd7d92620",
				"c0eb7ac62eab4a648880fb37cf1a7849",
				"cceeab6c60bc716dba5f894fb26a619c",
				"f7837c97029de2b6983122ad6a74687c",
				"5fb7b2384bf8f3560930ffb8c6b9d4e7",
				"386f81b13d75f3bfd2ba673c2ba52738",
				"c83244ec6a498a2b0becc3e8c236352e",
				"964a4d98d38bdffcdcaed912d15326c2",
				"30de83b8b3ea68f1451d4e889f28768c",
				"d8d020497ea8bb8b073c1cb8540ce98b",
				"ebc175bb873b2e32c3cd0c249a1c65fc",
				"e65b939fe2bc1818490cc0243b2179b6",
				"27299cbe3d4b253abdc73adb6c603f0b",
				"0f8c75cd558c7f7b634968f924a215df",
				"5eafe576bd10febd71c351c7045de6ff",
				"6bcb4ad8de06af5bbb99d649f80315b0",
				"20edb329fe6d70bbc32ebdd83c70e086",
				"3b8a771eaa2e179fde78245b372f8784",
				"117c81d983e5aebb7ad3e6cc6949951d",
				"5caa332a5db98b9130360316f5c27076",
				"a8aa3235b9982a76a0cb07c16b3b66da",
				"52552825efd6fd3aa7fcbcc699f84679",
				"d615659878e93ac0051f9b7bda13629c",
				"65c004ce3975020808afba9acdbb444f",
				"aff4fb0e93382abebdd3dc991d7835d7",
				"231330a579b60ecb770ddb2c642f595a",
				"96baa16f83f2780be205a88664e041ea",
				"920c09d31fd2dd3c06bcacd3389262e6",
				"39cd8c978203dbc2bac4761a483a8f70",
				"d96483aa20702324860b5e9c8f933f11",
				"8e2e220a33071d238f992a18a9274047",
				"7d5a875cb764c2845fe62dfe257d3366",
				"241676914929791e9168182f52e2117a",
				"e7fe65442451f4905204276d93ad8e40",
				"f01368034d1babe2f57cb033252f7c35",
				"5bd2670da0b903de053b8227acabb967",
				"d0f2e96d2e7a29502d9da0beb2a7fc38",
				"8b5107435512b53aa8bebafa46e81a36",
				"e0998fe9ac540d499abae57982ab4afb",
				"8a599411e8ac68d2268e75fe873196d2",
				"4c5dcfcaf1fc38a37e7af8919687517e",
				"29e715bcfad4439eca59461ec8f5e45f",
				"45e9e80e0eda6b8676a80482115fea37",
				"49087860e8fa37de2ef3dee632e1d4de",
				"a5fe5ecab38b7acf2c8b42ab7965557c",
				"ec52f881bc1e2bd21f4719579dada276"};
		for(int i=0;i<list.length;i++){
			//if(i>=100){
				String id=list[i];
				demoWebService.SynchronizedUserInfo(11, id, "0");
			//}
		}
		//demoWebService.SynchronizedUserInfo(11, "b0b5e0c64f840687e91c4bf4f7537634", "1");
	}
}

