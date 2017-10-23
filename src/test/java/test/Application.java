package test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dm.platform.dao.CommonDAO;
import com.dm.platform.model.Org;
import com.dm.platform.service.OrgService;
import com.dm.platform.service.UserAccountService;

public class Application {

	private CommonDAO commonDAO;
	private UserAccountService userAccountService ;
	private OrgService orgService;
	ApplicationContext app;
	
	public static void main(String[] args) {
		Application a = new Application();
		a.onInit();
		List<Org> list = a.commonDAO.findByPropertyName(Org.class, "code", "0");
		for(Org o:list){
			System.out.println(o);
		}
	}
	
	
	protected void onInit() {
		
		app = new ClassPathXmlApplicationContext("classpath:config/spring/applicationContext.xml");
		commonDAO = (CommonDAO) app.getBean("commonDAOImpl");
		userAccountService = (UserAccountService) app.getBean("userAccountServiceImpl");
		orgService = (OrgService) app.getBean("orgServiceImpl");
	}
}
