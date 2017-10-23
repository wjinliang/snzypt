package initDivition.init;

import initDivition.util.DataSourceUtil;

import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.QueryOperators;
import com.mongodb.WriteResult;

public class init {
	public final static String ID = "ID";
	public final static String FULLNAME = "FULLNAME";
	public final static String NAME = "NAME";
	public final static String PARENT_ID = "PARENT_ID";
	public final static String TYPE = "TYPE";
	public final static String CODE = "CODE";
	public final static String level = "level";
	public final static String OBJECTID = "OBJECTID";
	public static int nullcount = 0;
	public static int bucunzai = 0;

	/*public static void main(String[] args) throws SQLException {
		//action();
		initseq();
	}*/
	private static void initseq() {
		Connection zcptconn = DataSourceUtil.getConnection("sndataSource");
		Statement zcptStat = null;
		try {
			zcptStat = zcptconn.createStatement();
			ResultSet result = zcptStat.executeQuery("SELECT * FROM `at_field_config` where a_seq is null ORDER BY table_id");
			List<Map> list= new ArrayList();
			while (result.next()) {
				Map map = new HashMap();
				map.put("id", result.getString("id"));
				map.put("table_id", result.getString("table_id"));
				list.add(map);
			}
			String table = null;
			int i = 5;
			int s = 1;
			for(Map m:list){
				System.out.println(i+"--"+s);
				String t = (String)m.get("table_id");
				String id = (String)m.get("id");
				if(table==null||!table.equals(t)){
					i=6;
					table = t;
				}
				s++;
				i++;
				zcptStat.executeUpdate("update at_field_config set a_seq="+i+" where id='"+id+"'");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}

	}

	public static void action() throws SQLException {
		DB db = getDB();
		Connection zcptconn = DataSourceUtil.getConnection("sndataSource");
		Statement zcptStat = null;
		try {
			zcptStat = zcptconn.createStatement();
			// List<Map> quxianList = getQuxianList(zcptStat);
			/*
			 * // updateCounty(db,quxianList);//初始化区划
			 */		
			// updateTableCode("h_TB_BaseInfo","BaseInfo_Address","BaseInfo_ID",3,db);//更新实用人才
			//updateTableCode("m_ZYDP_NCJJ_NCLDLNLFB","JG_MC","ID",3,db);//2.43.6劳动力资料【农村劳动力年龄分布
			//updateTableCode("m_ZYDP_NCJJ_JQNYRKXB","JG_MC","ID",3,db);//人口资料;
			//updateTableCode("m_ZYDP_NCJJ_JQLDLWHSZ","JG_MC","ID",3,db);//2.43.5劳动力资料【郊区已就业劳动力文化素质】
			//updateTableCode("m_ZYDP_NCJJ_JQLDLJYCY","JG_MC","ID",3,db);//2.43.4劳动力资料【郊区已就业劳动力就业产业】
		//	updateTableCode("m_ZYDP_NCJJ_JQNHLDL","JG_MC","ID",3,db);// 2.43.1劳动力资料【郊农业户籍劳动力】 
			//updateTableCode("m_ZYDP_NCJJ_JQLDLJYCY","JG_MC","ID",3,db);// 2.43.2劳动力资料【郊区劳动力就业】 
			//updateTableCode("m_ZYDP_NCJJ_NCLDLWHCD","JG_MC","ID",3,db);// 2.43.7劳动力资料【农村劳动力文化程度】 
			//updateTableCode("m_ZYDP_NCJJ_NCSLLDLXB","JG_MC","ID",3,db);//2.43.8劳动力资料【农村适龄劳动力性别及比重】 
			
			updateTableCode1("m_ZYDP_NCJJ_NRJKZPJSR",db);//2.41.5家庭资料【年人均可支配净收入】
			updateTableCode1("m_ZYDP_NCJJ_KZPSRJG",db);//2.41.4家庭资料【可支配收入结构】 
			updateTableCode1("m_ZYDP_NCJJ_JSRJG",db);//2.41.3家庭资料【净收入结构】
			updateTableCode1("m_ZYDP_NCJJ_HJKZPSR",db);//2.41.2家庭资料【户均可支配收入】 	
			updateTableCode1("m_ZYDP_NCJJ_JTFB",db);//2.41.1家庭资料【农民家庭分布】 
			
			// 村CODE
			// updateTableCode2("m_ZH_NJFWZZ_JBXX","QX_MC","XZ_MC","XZC_MC","ID",3,db);//农机服务组织
			// updateTableCode2("m_LY_MP_JBXX","QX_MC","XZ_MC","XZC_MC","ID",3,db);//苗圃
			//updateTableCode2("m_LY_GY_JBXX", "SZ_QX", "SZ_XZ", "SZ_XZC", "ID",3, db);// 果园
			//updateTableCode2("m_ZYDP_LY_GGGY_JBXX", "SZ_QX", "SZ_XZ", "SZ_XZC", "ID",3, db);// 观光果园
			//updateTableCode2("m_ZYDP_YZ_XQLZC_JBXX", "SZ_QX", "SZ_XZ", "SZ_XZC", "ID",3, db);// 
			//updateTableCode2("m_SCDP_CGXPT_CS_JBXX", "SZ_QX", "SZ_XZ", "SZ_XZC", "ID",3, db);// 超市
			//updateTableCode2("m_SCDP_CGXPT_NFSC_JBXX", "SZ_QX", "SZ_XZ", "SZ_XZC", "ID",3, db);// 农副市场
			//updateTableCode2("m_KJSF_WLWSDJS_JBXX", "SZ_QX", "SZ_XZ", "SZ_XZC", "ID",3, db);//物联网示范
			
			//updateTableCode2("m_LY_HHJD_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 花卉
			//updateTableCode2("m_ZH_SNQY_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 涉农企业
			//updateTableCode2("m_YZ_DANJI_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 鸡蛋养殖
			//updateTableCode2("m_YZ_NAINIU_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 奶牛养殖
		//	updateTableCode2("m_YZ_ROUJI_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 肉鸡
			//updateTableCode2("m_YZ_SCYZC_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 水产养殖
			//updateTableCode2("m_YZ_TZQY_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 屠宰企业
			//updateTableCode2("m_SCDP_JYSC_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 经营市场
			//updateTableCode2("m_KJ_KJSFH_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 科技示范户
			//	updateTableCode2("m_KJ_KJSFYQ_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 科技示范园
			//	updateTableCode2("m_KJ_NYJSTGZ_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 农业推广
			
			
			
			System.out.println(nullcount);
			System.out.println(bucunzai);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			zcptStat.close();

		}

	}

	private static void updateTableCode1(String table, DB db) {
		DBCollection regColl = db.getCollection("m_ZYDP_NCJJ_JQNYRKXB");
		DBCollection tableColl = db.getCollection(table);
		int limit = 2000;
		int pagenum = 0;
		boolean flag = true;
		String r ="SZ_XZC_CODE";
		BasicDBObject b = new BasicDBObject().append(r,
				new BasicDBObject().append(QueryOperators.EXISTS, false));
		while (flag) {
			DBCursor cursor = getrecode(pagenum, limit, r, b, tableColl);
			flag = false;
			while (cursor.hasNext()) {
				flag = true;
				DBObject obj = cursor.next();
				String JGCODE = obj.get("JG_BH")== null ? null : obj
						.get("JG_BH").toString();
				if (JGCODE == null) {
					nullcount++;
					continue;
				}
				String name = JGCODE;
				DBObject rec = regColl.findOne(new BasicDBObject().append(
						"JG_BH",name));
				if (rec == null) {
					System.out.println(name+":"+obj.get(ID).toString());
					bucunzai++;
					continue;
				}
				String code = (String) rec.get(r);
				if(code.equals("null")){
					System.out.println(name+":"+obj.get(ID).toString());
					bucunzai++;
					continue;
				}
				DBObject query = new BasicDBObject();
				query.put(ID, obj.get(ID));
				obj.put(r, code);
				tableColl.update(query, obj);

			}

			pagenum++;
		}
		
	}

	private static void updateTableCode(String table, String filed,
			String idFiled, int level, DB db) {
		DBCollection regColl = null;
		String r = "REG";
		if (level == 1) {
			regColl = db.getCollection("m_ST_REG_COUNTY");
			r = "SZ_QX_CODE";
		}
		if (level == 2) {
			regColl = db.getCollection("m_ST_REG_TOWN");
			r = "SZ_XZ_CODE";
		}
		if (level == 3) {
			regColl = db.getCollection("m_ST_REG_VILLAGE");
			r = "SZ_XZC_CODE";
		}
		DBCollection tableColl = db.getCollection(table);
		int limit = 2000;
		int pagenum = 0;
		boolean flag = true;
		BasicDBObject b = new BasicDBObject().append(r,
				new BasicDBObject().append(QueryOperators.EXISTS, false));
		while (flag) {
			DBCursor cursor = getrecode(pagenum, limit, filed, b, tableColl);
			flag = false;
			while (cursor.hasNext()) {
				flag = true;
				DBObject obj = cursor.next();
				StringBuffer fullName = null;
				fullName = obj.get(filed) == null ? null : new StringBuffer(obj
						.get(filed).toString());
				if (fullName == null) {
					nullcount++;
					continue;
				}
				String name = fullName.toString();
				DBObject rec = regColl.findOne(new BasicDBObject().append(
						"FULLNAME",
						new BasicDBObject().append("$regex",
								".*" + name + ".*")));
				if(rec ==null){
					String n =name;
					if(name.indexOf("北京市")!=-1){
						name.substring(name.indexOf("北京市")).trim();
					}
					n= n.replaceAll("乡|镇|地区|村|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会", ".*");
					 rec = regColl.findOne(new BasicDBObject().append(
							"FULLNAME",
							new BasicDBObject().append("$regex",
									".*" + n + ".*")));
				}
				if (rec == null) {
					System.out.println(name+":"+obj.get(idFiled).toString());
					bucunzai++;
					continue;
				}
				String code = (String) rec.get(CODE);
				DBObject query = new BasicDBObject();
				query.put(idFiled, obj.get(idFiled));
				obj.put(r, code);
				tableColl.update(query, obj);

			}

			pagenum++;
		}

	}

	private static void updateTableCode2(String table, String qx, String xz,
			String c, String idFiled, int level, DB db) {
		// DBCollection countyColl = db.getCollection("m_ST_REG_COUNTY");
		// DBCollection townColl = db.getCollection("m_ST_REG_TOWN");
		DBCollection villageColl = db.getCollection("m_ST_REG_VILLAGE");
		System.out.println(table);
		DBCollection tableColl = db.getCollection(table);
		int limit = 2000;;
		int pagenum = 0;
		boolean flag = true;
		BasicDBObject b = new BasicDBObject().append("XZC_CODE",
				new BasicDBObject().append(QueryOperators.EXISTS, false));
		while (flag) {
			DBCursor cursor = getrecode(pagenum, limit, c, b, tableColl);
			flag = false;
			while (cursor.hasNext()) {
				flag = true;
				DBObject obj = cursor.next();
				String cun = obj.get(c) == null ? null : obj.get(c).toString()
						.trim();
				if (cun == null) {
					nullcount++;
					continue;
				}
				String xiangzhen = obj.get(xz) == null ? null : obj.get(xz)
						.toString().trim();
				if (xiangzhen == null) {
					nullcount++;
					continue;
				}
				String quxian = obj.get(c) == null ? null : obj.get(qx)
						.toString().trim();
				if (quxian == null) {
					nullcount++;
					continue;
				}
				DBObject rec = villageColl.findOne(new BasicDBObject()
						.append("SZ_QX", quxian).append("SZ_XZ", xiangzhen)
						.append("SZ_XZC", cun));
				if (rec == null) {
					String cunstr = cun.replace("村", "");
					rec = villageColl.findOne(new BasicDBObject()
							.append("SZ_QX", quxian).append("SZ_XZ", xiangzhen)
							.append("SZ_XZC", cunstr));
				}
				if (rec == null) {
					rec = villageColl.findOne(new BasicDBObject()
							.append("SZ_QX",
									new BasicDBObject().append("$regex", ".*"
											+ quxian + ".*"))
							.append("SZ_XZ",
									new BasicDBObject().append("$regex", ".*"
											+ xiangzhen + ".*"))
							.append("SZ_XZC",
									new BasicDBObject().append("$regex", ".*"
											+ cun + ".*")));
				}
				if (rec == null) {
					spdoaction1(villageColl, rec, quxian, xiangzhen, cun);
				}
				if (rec == null) {
					spdoaction(villageColl, rec, quxian, xiangzhen, cun);
				}
				if (rec == null) {
					bucunzai++;
					System.out.println(quxian + ":" + xiangzhen + ":" + cun
							+ ":" + obj.get(idFiled));
					continue;
				}
				String code = (String) rec.get(CODE);
				DBObject query = new BasicDBObject();
				query.put(idFiled, obj.get(idFiled));
				obj.put("XZC_CODE", code);
				tableColl.update(query, obj);

			}

			pagenum++;
		}

	}
	private static void spdoaction1(DBCollection villageColl, DBObject rec,
			String quxian, String xiangzhen, String cun) {
		String xiangzhen1 = xiangzhen;
		String quxian1 = quxian;
		String cun1 = cun;
		xiangzhen1 = xiangzhen.replace("办事处", "");
		rec = villageColl.findOne(new BasicDBObject().append("SZ_QX", quxian1)
				.append("SZ_XZ", xiangzhen1).append("SZ_XZC", cun1));
	}
	private static void spdoaction(DBCollection villageColl, DBObject rec,
			String quxian, String xiangzhen, String cun) {

		if (xiangzhen.equals("黄村镇")) {
			xiangzhen = "黄村地区";
		}
		if (xiangzhen.equals("雁栖")) {
			xiangzhen = "雁栖地区";
		}
		if (xiangzhen.equals("沙河地区办事处")) {
			xiangzhen = "沙河地区";
		}
		if (xiangzhen.equals("沙河办事处")) {
			xiangzhen = "沙河地区";
		}
		if (xiangzhen.equals("琉璃河办事处")) {
			xiangzhen = "琉璃河地区";
		}
		if (xiangzhen.equals("于家务乡")) {
			xiangzhen = "于家务回族乡";
		}
		if (xiangzhen.equals("庙城")) {
			xiangzhen = "庙城地区";
		}
		if (xiangzhen.equals("庙城村")) {
			xiangzhen = "庙城地区";
		}
		if (xiangzhen.equals("长子营")) {
			xiangzhen = "长子营镇";
		}
		if (xiangzhen.equals("礼贤")) {
			xiangzhen = "礼贤镇";
		}
		if (xiangzhen.equals("采育")) {
			xiangzhen = "采育镇";
		}
		if (cun.equals("孙营村")) {
			cun = "孙家营村";
		}
		if (cun.equals("七里渠村")) {
			cun = "七里渠北村";
		}
		if (cun.equals("上东郭村")) {
			cun = "上东廓村";
		}
		if (cun.equals("沁水营")) {
			cun = "沁水营村";
		}
		if (cun.equals("黄垡村")) {
			cun = "东黄垡村";
		}
		if (cun.equals("小牛房村")) {
			cun = "小牛坊村";
		}
		if (cun.equals("大牛房村")) {
			cun = "大牛坊村";
		}
		rec = villageColl.findOne(new BasicDBObject().append("SZ_QX", quxian)
				.append("SZ_XZ", xiangzhen).append("SZ_XZC", cun));
	}

	private static DBCursor getrecode(int pagenum, int limit, String filed,
			BasicDBObject where, DBCollection tableColl) {
		if (where == null) {
			where = new BasicDBObject();
		}
		return tableColl.find(where).sort(new BasicDBObject().append(filed, 1))
				.skip(pagenum * 2000).limit(limit);
	}

	private static void updateCounty(DB db, List<Map> quxianList) {

		DBCollection countyColl = db.getCollection("m_ST_REG_COUNTY");
		DBCollection townColl = db.getCollection("m_ST_REG_TOWN");
		DBCollection villageColl = db.getCollection("m_ST_REG_VILLAGE");
		for (Map<String, String> map : quxianList) {
			String name = map.get(NAME);
			// 区县
			BasicDBObject query = new BasicDBObject();
			query.append("MC", name);
			DBObject county = countyColl.findOne(query);
			if (county == null) {
				continue;
			}
			String code = map.get(CODE);
			county.put(CODE, code);
			county.put(FULLNAME, "北京市" + name);
			countyColl.update(query, county);// 更新区县
			// 乡镇
			BasicDBObject queryt = new BasicDBObject();
			queryt.append("SZ_QX", name);
			DBCursor xiangzhens = townColl.find(queryt);
			String codex = "001";
			while (xiangzhens.hasNext()) {
				DBObject xiang = xiangzhens.next();
				DBObject que = new BasicDBObject();
				que.put(ID, xiang.get(ID));
				xiang.put("SZ_QX_CODE", code);
				xiang.put(CODE, code + codex);
				xiang.put(FULLNAME, "北京市" + name + xiang.get("MC"));
				townColl.update(que, xiang);
				// 村
				BasicDBObject queryv = new BasicDBObject();
				queryv.append("SZ_QX", name);
				queryv.append("SZ_XZ", xiang.get("MC"));
				DBCursor cun = villageColl.find(queryv);
				String codec = "001";
				while (cun.hasNext()) {
					DBObject c = cun.next();
					DBObject que1 = new BasicDBObject();
					que1.put(OBJECTID, c.get(OBJECTID));
					c.put("SZ_QX_CODE", code);
					c.put("SZ_XZ_CODE", code + codex);
					c.put(CODE, code + codex + codec);
					c.put(FULLNAME,
							"北京市" + name + xiang.get("MC") + c.get("MC"));
					WriteResult r = villageColl.update(que1, c);
					System.out.println(c.get("SZ_QX") + "--" + c.get("SZ_XZ")
							+ "--" + c.get("MC") + "--" + r.getN());
					codec = code(codec);
				}
				codex = code(codex);
			}

		}

	}

	private static String code(String code) {
		code = "00" + (Integer.parseInt(code) + 1);
		return code.substring(code.length() - 3);
	}

	private static List<Map> getQuxianList(Statement zcptStat) {
		List<Map> list = new ArrayList<Map>();
		try {
			String seq = "SELECT " + " `ID`," + " `FULLNAME`," + " `NAME`,"
					+ " `PARENT_ID`," + " `CODE`," + " `TYPE`," + " `level`"
					+ " FROM `t_division` WHERE"
					+ " `FULLNAME` LIKE '%北京市%' AND"
					+ " `level`= '2'  ORDER BY `FULLNAME`";
			ResultSet result = zcptStat.executeQuery(seq);
			while (result.next()) {
				Map map = new HashMap();
				map.put(ID, result.getInt(ID));
				map.put(FULLNAME, result.getString(FULLNAME));
				map.put(CODE, result.getString(CODE));
				map.put(NAME, result.getString(NAME));
				map.put(TYPE, result.getString(TYPE));
				map.put(PARENT_ID, result.getString(PARENT_ID));
				map.put(level, result.getString(level));
				list.add(map);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

		
	private static DB getDB() {
		Mongo mongo;
		try {
			mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("datamanage");
			return db;
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) {
		DB db = getDB();
		DBObject obj = db.getCollection("h_TA_Hukou").findOne();
		for(String key : obj.keySet()){
			Object o = obj.get(key);
			if(o!=null)
			System.out.println(key +":"+o.getClass());
			else
				System.out.println(key +":  java.lang.String");
		}
		
	}
	
	

}
