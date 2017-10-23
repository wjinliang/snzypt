package initDivition.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class InitData {

	

	public static List getNoxOrgList(Statement stat) throws SQLException {
		List<Map> orglist = new ArrayList<Map>();
		String sql = "select org_id,org_name,org_parent,org_bm from u_org where org_id not in(0,1) and org_code is null order by org_level";
		ResultSet rs = stat.executeQuery(sql);
		while (rs.next()) {
			Map org = new HashMap();
			String org_id = rs.getString("org_id");
			String org_name = rs.getString("org_name");
			String org_parent = rs.getString("org_parent");
			String org_bm = rs.getString("org_bm");
			int row = rs.getRow();
			System.out.println("当前行数：" + row);
			org.put("org_id", org_id);
			org.put("org_name", org_name);
			org.put("org_parent", org_parent);
			org.put("org_bm", org_bm);
			orglist.add(org);
		}
		return orglist;
	}

	public static List getNoxUserList(Statement stat) throws SQLException {
		List<Map> orglist = new ArrayList<Map>();
		String sql = "select user_id,user_logname,user_name,user_mail,org_id,user_mphone,user_address,user_phone from u_user where  user_logname <> 'admin' and user_uuid is null";
		ResultSet rs = stat.executeQuery(sql);
		while (rs.next()) {
			Map org = new HashMap();
			String user_id = rs.getString("user_id");
			String user_logname = rs.getString("user_logname");
			String user_name = rs.getString("user_name");
			String user_mail = rs.getString("user_mail");
			String org_id = rs.getString("org_id");
			String user_mphone = rs.getString("user_mphone");
			String user_address = rs.getString("user_address");
			String user_phone = rs.getString("user_phone");
			int row = rs.getRow();
			System.out.println("当前行数：" + row);
			org.put("user_id", user_id);
			org.put("user_logname", user_logname);
			org.put("user_name", user_name);
			org.put("user_mail", user_mail);
			org.put("org_id", org_id);
			org.put("user_mphone", user_mphone);
			org.put("user_address", user_address);
			org.put("user_phone", user_phone);
			orglist.add(org);
		}
		return orglist;
	}

	public static List getDwybOrgList(Statement stat) throws SQLException {
		List<Map> orglist = new ArrayList<Map>();
		String sql = "select org_id,org_name,org_parent,org_bm from u_org where org_id not in(0,1) and org_code is null order by org_level";
		ResultSet rs = stat.executeQuery(sql);
		while (rs.next()) {
			Map org = new HashMap();
			String org_id = rs.getString("org_id");
			String org_name = rs.getString("org_name");
			String org_parent = rs.getString("org_parent");
			String org_bm = rs.getString("org_bm");
			int row = rs.getRow();
			System.out.println("当前行数：" + row);
			org.put("org_id", org_id);
			org.put("org_name", org_name);
			org.put("org_parent", org_parent);
			org.put("org_bm", org_bm);
			orglist.add(org);
		}
		return orglist;
	}

	public static List getDwybUserList(Statement stat) throws SQLException {
		List<Map> orglist = new ArrayList<Map>();
		String sql = "select user_id,user_logname,user_name,user_mail,org_id,user_mphone,user_address,user_phone from u_user where  user_logname <> 'admin' and user_uuid is null";
		ResultSet rs = stat.executeQuery(sql);
		while (rs.next()) {
			Map org = new HashMap();
			String user_id = rs.getString("user_id");
			String user_logname = rs.getString("user_logname");
			String user_name = rs.getString("user_name");
			String user_mail = rs.getString("user_mail");
			String org_id = rs.getString("org_id");
			String user_mphone = rs.getString("user_mphone");
			String user_address = rs.getString("user_address");
			String user_phone = rs.getString("user_phone");
			int row = rs.getRow();
			System.out.println("当前行数：" + row);
			org.put("user_id", user_id);
			org.put("user_logname", user_logname);
			org.put("user_name", user_name);
			org.put("user_mail", user_mail);
			org.put("org_id", org_id);
			org.put("user_mphone", user_mphone);
			org.put("user_address", user_address);
			org.put("user_phone", user_phone);
			orglist.add(org);
		}
		return orglist;
	}

	public static List getZsOrgList(Statement stat, int pageSize, int pageNum)
			throws SQLException {
		// SELECT * FROM (Select 字段1,字段2,字段3,rownumber() over(ORDER BY 排序用的列名
		// ASC) AS rn from 表名) AS a1 WHERE a1.rn BETWEEN 10 AND 20
		List<Map> orglist = new ArrayList<Map>();
		// String sql =
		// "select org_id,org_name,org_parent,org_bm from u_org where org_id not in(0,1) and org_code is null order by org_level";
		String sql = "SELECT t0.id org_id,OUNAME org_name,LEADNAME,LINKMAN,POSTALCODE,POSTALADDRESS,FAXNO,PHONENO,t1.REGIONCODE  org_bm ,t1.id regionid "
				+ "FROM ou t0 LEFT JOIN tblregion t1 ON t0.REGIONID = t1.ID "
				+ " ORDER BY t0.id "
				+ " "
				+ " limit "
				+ (pageNum - 1)
				* pageSize + "," + pageSize + "";
		ResultSet rs = stat.executeQuery(sql);
		while (rs.next()) {
			Map org = new HashMap();
			String org_id = rs.getString("org_id");
			String org_name = rs.getString("org_name");
			// String org_parent = rs.getString("org_parent");
			String org_bm = rs.getString("org_bm");
			String org_bm_id = rs.getString("regionid");
			String LEADNAME = rs.getString("LEADNAME");
			String LINKMAN = rs.getString("LINKMAN");
			String POSTALCODE = rs.getString("POSTALCODE");
			String POSTALADDRESS = rs.getString("POSTALADDRESS");
			String FAXNO = rs.getString("FAXNO");
			String PHONENO = rs.getString("PHONENO");
			// int row = rs.getRow();
			// System.out.println("当前行数：" + row);
			org.put("org_id", org_id);
			org.put("org_name", org_name);
			org.put("org_bm_id", org_bm_id);
			org.put("org_bm", org_bm);
			org.put("LEADNAME", LEADNAME);
			org.put("LINKMAN", LINKMAN);
			org.put("POSTALCODE", POSTALCODE);
			org.put("POSTALADDRESS", POSTALADDRESS);
			org.put("FAXNO", FAXNO);
			org.put("PHONENO", PHONENO);
			orglist.add(org);
		}
		return orglist;
	}

	public static List getZsUserList(Statement stat, int pageSize, int pageNum)
			throws SQLException {
		List<Map> orglist = new ArrayList<Map>();
		/*
		 * String sql =
		 * "select row_number() over (order by id desc ) as row_number,  " +
		 * "id as user_id, loginid as user_logname, name as user_name," +
		 * " userorgroup, password, schoolage, title, speciality," +
		 * " createdate, createuser, bizphoneno, mobile user_phone," +
		 * " faxno, address user_address, idno, duty, dutyid, ouid org_id, birthday,"
		 * + " sortid, isdelete, gender, clientrole," +
		 * " latestlogindate, nextlogindate, worktype," + " caid " +
		 * "from  tracing.tblaccountsuser where  loginid <> 'admin' and caid is null"
		 * ; //sql =
		 * "select * from ("+sql+" )  a where a.   row_number > "+(pageNum
		 * -1)*pageSize+"   fetch first "+ pageSize+" rows only";
		 */
		String sql = "select"
				+ " id as user_id, loginid as user_logname, name as user_name,"
				+ " userorgroup, password, schoolage, title, speciality,"
				+ " createdate, createuser, bizphoneno, mobile user_phone,"
				+ " faxno, address user_address, idno, duty, dutyid, ouid org_id, birthday,"
				+ " sortid, isdelete, gender, clientrole,"
				+ " latestlogindate, nextlogindate, worktype," + " caid "
				+ " from  tblaccountsuser where id>=493148  order by id "
				+ " limit " + (pageNum - 1) * pageSize + "," + pageSize + "";
		System.out.println(pageNum + "页数");
		// System.out.println(sql);
		ResultSet rs = stat.executeQuery(sql);
		while (rs.next()) {
			Map org = new HashMap();
			String user_id = rs.getString("user_id");
			String user_logname = rs.getString("user_logname");
			String user_name = rs.getString("user_name");
			// String user_mail = rs.getString("user_mail");
			String org_id = rs.getString("org_id");
			// String user_mphone = rs.getString("user_mphone");
			String user_address = rs.getString("user_address");
			String user_phone = rs.getString("user_phone");
			java.sql.Date birthday = rs.getDate("birthday");
			String title = rs.getString("title");
			String schoolage = rs.getString("schoolage");
			int row = rs.getRow();
			// System.out.println("当前行数：" + row);
			org.put("user_id", user_id);
			org.put("user_logname", user_logname);
			org.put("user_name", user_name);
			org.put("birthday", birthday);
			org.put("user_title", title);
			org.put("school_age", schoolage);
			// org.put("user_mail", user_mail);
			org.put("org_id", org_id);
			// org.put("user_mphone", user_mphone);
			org.put("user_address", user_address);
			org.put("user_phone", user_phone);
			orglist.add(org);
		}
		return orglist;
	}

	public static List getZsOrigionList(Statement stat, int pageSize,
			int pageNum) throws SQLException {
		List<Map> orglist = new ArrayList<Map>();
		/*
		 * String sql =
		 * "select row_number() over (order by id desc ) as row_number,  " +
		 * "id as user_id, loginid as user_logname, name as user_name," +
		 * " userorgroup, password, schoolage, title, speciality," +
		 * " createdate, createuser, bizphoneno, mobile user_phone," +
		 * " faxno, address user_address, idno, duty, dutyid, ouid org_id, birthday,"
		 * + " sortid, isdelete, gender, clientrole," +
		 * " latestlogindate, nextlogindate, worktype," + " caid " +
		 * "from  tracing.tblaccountsuser where  loginid <> 'admin' and caid is null"
		 * ; //sql =
		 * "select * from ("+sql+" )  a where a.   row_number > "+(pageNum
		 * -1)*pageSize+"   fetch first "+ pageSize+" rows only";
		 */
		String sql = "SELECT ID id,FULLNAME fullname,SHORTNAME name,PARENTID pid,"
				+ "REGIONCODE code,REGIONTYPE type FROM tblregion "
				// + "WHERE LENGTH(REGIONCODE)>6 and ID>294975"
				+ " ORDER BY ID"
				+ " limit "
				+ (pageNum - 1)
				* pageSize
				+ ","
				+ pageSize + "";
		ResultSet rs = stat.executeQuery(sql);
		while (rs.next()) {
			Map org = new HashMap();
			String id = rs.getString("id");
			String code = rs.getString("code");
			String name = rs.getString("name");
			String parentId = rs.getString("pid");
			// String user_mail = rs.getString("user_mail");
			String fullname = rs.getString("fullname");
			String type = rs.getString("type");
			// int row = rs.getRow();
			// System.out.println("当前行数：" + row);
			org.put("id", id);
			org.put("code", code);
			org.put("name", name);
			org.put("fullname", fullname);
			org.put("parentId", parentId);
			org.put("type", type);
			orglist.add(org);
		}
		rs.close();
		return orglist;
	}

	public static List<Map> getDwybFKUserList(Statement stat)
			throws SQLException {
		List<Map> orglist = new ArrayList<Map>();
		String sql = "SELECT u.* FROM `m_userinfo` u  WHERE 用户名 <> 'cadc系统管理员'";
		ResultSet rs = stat.executeQuery(sql);
		while (rs.next()) {
			Map org = new HashMap();
			String user_id = rs.getString("ID");
			String user_logname = rs.getString("用户名");
			String user_name = rs.getString("本人姓名");
			String org_id = rs.getString("orgId");
			String user_mphone = rs.getString("电话");
			String user_phone = rs.getString("手机");
			String sex = rs.getString("性别");
			String zw = rs.getString("职务");
			String no = rs.getString("传真");
			int row = rs.getRow();
			System.out.println("当前行数：" + row);
			org.put("user_id", user_id);
			org.put("user_logname", user_logname);
			org.put("user_name", user_name);
			org.put("org_id", org_id);
			org.put("user_mphone", user_mphone);
			org.put("sex", sex);
			org.put("zw", zw);
			org.put("no", no);
			org.put("user_phone", user_phone);
			orglist.add(org);
		}
		return orglist;
	}

	public static List getchongfujigou(Statement stat) throws SQLException {
		List<Map> orglist = new ArrayList<Map>();
		String sql = "SELECT t.id,t.`CODE`,t.`NAME`,t.division_id "
				+ " from t_org t where t.`CODE` in("
				+ " SELECT `code` from t_org t1 GROUP BY t1.`code`  HAVING COUNT(t1.`CODE`)>1 " 
				+ ") ORDER BY t.`code`";
		// System.out.println(sql);
		ResultSet rs = stat.executeQuery(sql);
		while (rs.next()) {
			Map org = new HashMap();
			String user_id = rs.getString("id");
			String user_logname = rs.getString("CODE");
			String user_name = rs.getString("NAME");
			// String user_mail = rs.getString("user_mail");
			String org_id = rs.getString("division_id");
			/*// String user_mphone = rs.getString("user_mphone");
			String user_address = rs.getString("user_address");
			String user_phone = rs.getString("user_phone");
			java.sql.Date birthday = rs.getDate("birthday");
			String title = rs.getString("title");
			String schoolage = rs.getString("schoolage");
			int row = rs.getRow();*/
			// System.out.println("当前行数：" + row);
			org.put("org_id", user_id);
			org.put("org_code", user_logname);
			org.put("org_name", user_name);
			// org.put("user_mail", user_mail);
			org.put("division_id", org_id);
			// org.put("user_mphone", user_mphone);
			orglist.add(org);
		}
		return orglist;
	}
	/**
	 * 用户编码 不统一机构编码的
	 * @param stat
	 * @return
	 * @throws SQLException
	 */
	public static List getEQOrgUser(Statement stat) throws SQLException {
		List<Map> orglist = new ArrayList<Map>();
		String sql = "SELECT t.org_id id,t.`CODE` user_mphone,t.`NAME`,o.division_id "
				+ ", t.LOGINNAME user_mail,o.`CODE` from t_user_account t LEFT JOIN t_org o ON t.org_id=o.id "
				+ " where substr(t.LOGINNAME,1,9) != o.`CODE` and t.`CODE`!=1";
		// System.out.println(sql);
		ResultSet rs = stat.executeQuery(sql);
		while (rs.next()) {
			Map org = new HashMap();
			String user_id = rs.getString("id");
			String user_logname = rs.getString("CODE");
			String user_name = rs.getString("NAME");
			 String user_mail = rs.getString("user_mail");
			String org_id = rs.getString("division_id");
			 String user_mphone = rs.getString("user_mphone");
			/*String user_address = rs.getString("user_address");
			String user_phone = rs.getString("user_phone");
			java.sql.Date birthday = rs.getDate("birthday");
			String title = rs.getString("title");
			String schoolage = rs.getString("schoolage");
			int row = rs.getRow();*/
			// System.out.println("当前行数：" + row);
			org.put("org_id", user_id);
			org.put("org_code", user_logname);
			org.put("org_name", user_name);
			org.put("division_id", org_id);
			org.put("org_loginname", user_mail);
			 org.put("code", user_mphone);
			orglist.add(org);
		}
		return orglist;
	}

	public static List<Map> getorgcodeToolong(Statement stat) throws SQLException {
		List<Map> orglist = new ArrayList<Map>();
		String sql = "SELECT t.id,t.`CODE`,t.`NAME`,t.division_id "
				+ " from t_org t where LENGTH(t.`CODE`)>9";
		// System.out.println(sql);
		ResultSet rs = stat.executeQuery(sql);
		while (rs.next()) {
			Map org = new HashMap();
			String user_id = rs.getString("id");
			String user_logname = rs.getString("CODE");
			String user_name = rs.getString("NAME");
			// String user_mail = rs.getString("user_mail");
			String org_id = rs.getString("division_id");
			/*// String user_mphone = rs.getString("user_mphone");
			String user_address = rs.getString("user_address");
			String user_phone = rs.getString("user_phone");
			java.sql.Date birthday = rs.getDate("birthday");
			String title = rs.getString("title");
			String schoolage = rs.getString("schoolage");
			int row = rs.getRow();*/
			// System.out.println("当前行数：" + row);
			org.put("org_id", user_id);
			org.put("org_code", user_logname);
			org.put("org_name", user_name);
			// org.put("user_mail", user_mail);
			org.put("division_id", org_id);
			// org.put("user_mphone", user_mphone);
			orglist.add(org);
		}
		return orglist;
	}
	
	
	/**
	 * 用户编码重复的用户
	 * @param stat
	 * @return
	 * @throws SQLException
	 */
	public static List getChongfuUser(Statement stat) throws SQLException {
		List<Map> orglist = new ArrayList<Map>();
		String sql = "SELECT t.org_id id,t.`CODE` user_mphone,t.`NAME`"
				+ ", t.LOGINNAME user_mail from t_user_account t where `LOGINNAME`"
				+ " in (SELECT `loginname` from t_user_account GROUP BY LOGINNAME HAVING count(LOGINNAME)>1) order by LOGINNAME";
		// System.out.println(sql);
		ResultSet rs = stat.executeQuery(sql);
		while (rs.next()) {
			Map org = new HashMap();
			String user_id = rs.getString("id");
			String user_name = rs.getString("NAME");
			 String user_mail = rs.getString("user_mail");
			 String user_mphone = rs.getString("user_mphone");
			/*String user_address = rs.getString("user_address");
			String user_phone = rs.getString("user_phone");
			java.sql.Date birthday = rs.getDate("birthday");
			String title = rs.getString("title");
			String schoolage = rs.getString("schoolage");
			int row = rs.getRow();*/
			// System.out.println("当前行数：" + row);
			org.put("org_id", user_id);
			org.put("org_name", user_name);
			org.put("org_loginname", user_mail);
			 org.put("code", user_mphone);
			orglist.add(org);
		}
		return orglist;
	}
}
