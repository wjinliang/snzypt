package initDivition.init;

import initDivition.util.DataSourceUtil;
import initDivition.util.InitData;
import initDivition.util.TimeUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.security.authentication.encoding.ShaPasswordEncoder;

public class ZsInitUser {
	
	
	static String[] schoolAge ={null,"高中及以下","中专","专科","本科","硕士","博士",null,null,"博士后"};// new String[]();
	static String[] titleA = {null,"高级","中级","初级","技术员","推广研究员","无技术职称"};
	public static void main(String[] args) {
		Connection zcptconn = DataSourceUtil.getConnection("zcptdataSource");
		Statement zcptStat = null;
		//Connection conn = DataSourceUtil.getConnection("zsdataSource");
		try {
			zcptStat = zcptconn.createStatement();
			ResultSet result = zcptStat.executeQuery("select count(*) from t_user_account");
			while(result.next()){
				System.out.println(result.getInt(1));
			}
			
			zcptStat.close();
		}catch(Exception e){
			
		}
		
	}
	public static void main1(String[] args) {
		Connection zcptconn = DataSourceUtil.getConnection("zcptdataSource");
		Statement zcptStat = null;
		//Connection conn = DataSourceUtil.getConnection("zsdataSource");
		Connection conn = DataSourceUtil.getConnection("zcptdataSource");
		Statement stat = null;
		try {
			zcptStat = zcptconn.createStatement();
			stat = conn.createStatement();
			int pageNum = 1;
			List<Map> orgList =new ArrayList();
			while (true) {
				orgList = InitData.getZsUserList(stat, 1000, pageNum);
				if(orgList.size()==0){
					System.out.println("结束");
					break;//最后一页
				}
				/*for(Map m:orgList){
					System.out.println("id:"+ m.get("user_id")+"//logname:"+m.get("user_logname")+"//user_name:"+m.get("user_name")+"//user_mphone:"+m.get("user_mphone"));
				}*/
				/*if(true)
				//break;*/
				int i = 1;
				for (Map map : orgList) {
					String user_id = map.get("user_id").toString();
					//System.out.println(user_id +"++++");
					if(map.get("user_logname")==null){
						System.out.println("登录名null");
						continue;
					}
					String user_logname = map.get("user_logname").toString();
					String user_old_logname = map.get("user_logname").toString();
					String user_name = map.get("user_name").toString();
					String org_id = map.get("org_id").toString();
					String user_mail = null;
					String user_mphone = null;
					String user_address = null;
					String user_phone = null;
					String school_age = null;
					String user_title = null;
					if (map.get("user_title") != null
							&& !map.get("user_title").toString().equals("")) {
						user_title = titleA[Integer.valueOf(map.get("user_title").toString())];
					}
					if (map.get("school_age") != null
							&& !map.get("school_age").toString().equals("")) {
						school_age = schoolAge[Integer.valueOf(map.get("school_age").toString())];
					}
					if (map.get("user_mail") != null
							&& !map.get("user_mail").toString().equals("")) {
						user_mail = map.get("user_mail").toString();
					}
					if (map.get("user_mphone") != null
							&& !map.get("user_mphone").toString().equals("")) {
						user_mphone = map.get("user_mphone").toString();
					}
					if (map.get("user_address") != null
							&& !map.get("user_address").toString().equals("")) {
						user_address = map.get("user_address").toString();
					}
					if (map.get("user_phone") != null
							&& !map.get("user_phone").toString().equals("")) {
						user_phone = map.get("user_phone").toString();
					}
					java.sql.Date birthday = null;
					if(map.get("birthday")!=null){
						birthday = (java.sql.Date)map.get("birthday");
					}
					//System.out.println(i++);
					String insertSql = " insert into t_user_account(code,email,enabled,name,password,org_id,loginname,mobile,account_expired,locked,password_expired,synpassword,origin_id,create_date,create_user,bizphone_no,address,gender,user_type,system_id,title,school_age,old_loginname,birthday)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
					PreparedStatement pstmt = zcptconn
							.prepareStatement(insertSql);
					String uuid = "";//UUIDUtil.getUUID();
					pstmt.setString(1, uuid);
					pstmt.setString(2, user_mail);
					byte enabled = new Byte("1");
					pstmt.setByte(3, enabled);
					pstmt.setString(4, user_name);
					ShaPasswordEncoder sha = new ShaPasswordEncoder();
					sha.setEncodeHashAsBase64(false);
					String password = "123456";
					String encodePassword = sha.encodePassword(password, null);
					String encryptPassword ="";// util.SimpleCrypto.encrypt(
						//"zcpt@123456", password);//16DE4C69B590A05DAEFDFFF451DAABF6
					pstmt.setString(5, encodePassword);
					String orgSql = "select id,code from t_org where origin_id='"
							+ org_id + "' and system_id='追溯系统'";
					ResultSet orgrs = zcptStat.executeQuery(orgSql);
					long orgid = 0l;
					String orgcode="";
					if (orgrs.next()) {
						 orgid = orgrs.getLong("id");
						 orgcode = orgrs.getString("code");
						pstmt.setLong(6, orgid);
					} else {
						System.out.println("用户组织不存在:" + user_id + "---"
								+ user_name);
						zcptStat.execute("insert into zs_err (type,id,msg,orgid) values('user','"+user_id+"','用户组织不存在','"+org_id+"')");
						continue;
					}
					user_logname = orgcode +""  ;
					String loginnameSql = " select count(*) as sum from t_user_account where loginname like '"
							+ orgcode + "%'";
					ResultSet loginnamers =  zcptStat.executeQuery(loginnameSql);
					if (loginnamers.next()) {
						int sum = loginnamers.getInt("sum");
							/*System.out.println("用户登录名重复，在此修改用户登录名为:"
									+ user_logname + "_dwyb");
							user_logname = user_logname + "_dwyb";*/
							String s = sum+1+"";
							int len = s.length();
							String count0 ="";
							if(len == 1){
								count0 ="00";
							}
							if(len == 2){
								count0 ="0";
							}
							
							user_logname = user_logname+count0+s;
					} else {
						user_logname = user_logname+"001";
					}
					pstmt.setString(7, user_logname);
					pstmt.setString(8, user_mphone);
					byte account_expired = new Byte("0");
					pstmt.setByte(9, account_expired);
					byte locked = new Byte("0");
					pstmt.setByte(10, locked);
					byte password_expired = new Byte("0");
					pstmt.setByte(11, password_expired);
					pstmt.setString(12, encryptPassword);
					pstmt.setString(13, user_id);
					String time = TimeUtil
							.getTheDateOfToday("yyyy-MM-dd HH:mm:ss");
					pstmt.setString(14, time);
					pstmt.setString(15, "管理员");
					pstmt.setString(16, user_phone);
					pstmt.setString(17, user_address);
					pstmt.setString(18, "0");
					pstmt.setString(19, "0");
					pstmt.setString(20, "追溯系统");
					pstmt.setString(21, user_title);
					pstmt.setString(22, school_age);
					pstmt.setString(23, user_old_logname);
					pstmt.setDate(24, birthday);
					//pstmt.setDate(24, null);
					int update = pstmt.executeUpdate();
					if (update > 0) {
						String updateSql = "update tblaccountsuser set caid='"
								+ uuid + "' where id =" + user_id;
						stat.executeUpdate(updateSql);
						String initRoleSql = " insert into t_user_account_role(user_code,role_code)values('"
								+ uuid + "','1457057645272')";
						zcptStat.executeUpdate(initRoleSql);
						String synSql = " insert into syn_user(id,app_id,user_id,syn_time)values(?,?,?,?)";
						PreparedStatement statement = zcptconn
								.prepareStatement(synSql);
						statement.setString(1, "");
						statement.setString(2,
								"402881e854e6aca40154e6ca00f50006");
						statement.setString(3, uuid);
						statement.setString(4, time);
						statement.executeUpdate();
						statement.close();
					}else{
						System.out.println("插入失败");
						zcptStat.execute("insert into zs_err (type,id,msg,orgid) values('user','"+user_id+"','插入失败','"+org_id+"')");
					}
					pstmt.close();
					//System.out.println(user_id +"----------");
				}
				pageNum++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DataSourceUtil.closeStmt(stat);
			DataSourceUtil.closeStmt(zcptStat);
			DataSourceUtil.closeConn(conn);
			DataSourceUtil.closeConn(zcptconn);
		}

	}
}
