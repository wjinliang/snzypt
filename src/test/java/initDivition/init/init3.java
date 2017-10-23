package initDivition.init;

import java.net.UnknownHostException;
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

public class init3 {
	public final static String ID = "ID";
	public final static String FULLNAME = "FULLNAME";
	public final static String NAME = "NAME";
	public final static String PARENT_ID = "PARENT_ID";
	public final static String TYPE = "TYPE";
	public final static String CODE = "CODE";
	public final static String level = "level";
	public final static String OBJECTID = "OBJECTID";
	public final static String doflag = "doflag";
	public static int nullcount = 0;
	public static int bucunzai = 0;

	public static void main(String[] args) throws SQLException {
		action();
		//initAreaFullName();
	}
	public static void action() throws SQLException {
		DB db = getDB();
//		Connection zcptconn = DataSourceUtil.getConnection("zcptdataSource");
//		Statement zcptStat = null;
		try {
//		zcptStat = zcptconn.createStatement();
//			List<Map> quxianList = getQuxianList(zcptStat);
//			 updateCounty(db,quxianList);//初始化区划
				
			// updateTableCode("h_TB_BaseInfo","BaseInfo_Address","BaseInfo_ID",3,db);//更新实用人才
//			updateTableCode("m_ZYDP_NCJJ_NCLDLNLFB","JG_MC","ID",3,db);//2.43.6劳动力资料【农村劳动力年龄分布
//			updateTableCode("m_ZYDP_NCJJ_JQNYRKXB","JG_MC","ID",3,db);//人口资料;
//			updateTableCode("m_ZYDP_NCJJ_JQLDLWHSZ","JG_MC","ID",3,db);//2.43.5劳动力资料【郊区已就业劳动力文化素质】
//			updateTableCode("m_ZYDP_NCJJ_JQLDLJYCY","JG_MC","ID",3,db);//2.43.4劳动力资料【郊区已就业劳动力就业产业】
//			updateTableCode("m_ZYDP_NCJJ_JQNHLDL","JG_MC","ID",3,db);// 2.43.1劳动力资料【郊农业户籍劳动力】 
//			updateTableCode("m_ZYDP_NCJJ_JQLDLJYCY","JG_MC","ID",3,db);// 2.43.2劳动力资料【郊区劳动力就业】 
//			updateTableCode("m_ZYDP_NCJJ_NCLDLWHCD","JG_MC","ID",3,db);// 2.43.7劳动力资料【农村劳动力文化程度】 
//			updateTableCode("m_ZYDP_NCJJ_NCSLLDLXB","JG_MC","ID",3,db);//2.43.8劳动力资料【农村适龄劳动力性别及比重】 
			
//			updateTableCode1("m_ZYDP_NCJJ_NRJKZPJSR",db);//2.41.5家庭资料【年人均可支配净收入】
//			updateTableCode1("m_ZYDP_NCJJ_KZPSRJG",db);//2.41.4家庭资料【可支配收入结构】 
//			updateTableCode1("m_ZYDP_NCJJ_JSRJG",db);//2.41.3家庭资料【净收入结构】
//			updateTableCode1("m_ZYDP_NCJJ_HJKZPSR",db);//2.41.2家庭资料【户均可支配收入】 	
//			updateTableCode1("m_ZYDP_NCJJ_JTFB",db);//2.41.1家庭资料【农民家庭分布】 
		updateTableCode2("m_ZZ_ZWSC","SZ_QX","SZ_XZ","SZ_XZC","ID",3,db);//m_ZZ_ZWSC//
			 updateTableCode3("m_ZZ_ZWSC","SZ_QX","SZ_XZ","SZ_XZC","ID",3,db);//m_ZZ_ZWSC//
			// updateTableCode4("h_TB_BaseInfo","Area_QXID","Area_XzID","Area_CjID","BaseInfo_ID",3,db);//更新实用人才
			// 村CODE
			// updateTableCode2("m_ZH_NJFWZZ_JBXX","QX_MC","XZ_MC","XZC_MC","ID",3,db);//农机服务组织
			  //updateTableCode2("m_ZZ_ZWSC","SZ_QX","SZ_XZ","SZ_XZC","ID",3,db);//m_ZZ_ZWSC//
			  //updateTableCode2("m_LY_MP_JBXX","QX_MC","XZ_MC","XZC_MC","ID",3,db);//苗圃
			  //updateTableCode2("m_LY_GY_JBXX", "SZ_QX", "SZ_XZ", "SZ_XZC", "ID",3, db);// 果园
			updateTableCode3("m_KJ_XNCJS", "QX_MC", "XZ_MC", "XZC_MC", "ID",3, db);// 新农村
			/*updateTableCode2("m_ZYDP_LY_GGGY_JBXX", "SZ_QX", "SZ_XZ", "SZ_XZC", "ID",3, db);// 观光果园
			updateTableCode2("m_ZYDP_YZ_XQLZC_JBXX", "SZ_QX", "SZ_XZ", "SZ_XZC", "ID",3, db);// 
			updateTableCode2("m_SCDP_CGXPT_CS_JBXX", "SZ_QX", "SZ_XZ", "SZ_XZC", "ID",3, db);// 超市
			updateTableCode2("m_SCDP_CGXPT_NFSC_JBXX", "SZ_QX", "SZ_XZ", "SZ_XZC", "ID",3, db);// 农副市场
			updateTableCode2("m_KJSF_WLWSDJS_JBXX", "SZ_QX", "SZ_XZ", "SZ_XZC", "ID",3, db);//物联网示范
			
			updateTableCode2("m_LY_HHJD_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 花卉
			updateTableCode2("m_ZH_SNQY_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 涉农企业
			updateTableCode2("m_YZ_DANJI_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 鸡蛋养殖
			updateTableCode2("m_YZ_NAINIU_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 奶牛养殖
			updateTableCode2("m_YZ_ROUJI_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 肉鸡
			updateTableCode2("m_YZ_SCYZC_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 水产养殖
			updateTableCode2("m_YZ_TZQY_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 屠宰企业
			updateTableCode2("m_SCDP_JYSC_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 经营市场
			updateTableCode2("m_KJ_KJSFH_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 科技示范户
				updateTableCode2("m_KJ_KJSFYQ_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 科技示范园
				updateTableCode2("m_KJ_NYJSTGZ_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);// 农业推广
			 
			 updateTableCode2("m_YZ_YANG_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);//养羊
			 updateTableCode2("m_YZ_YA_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);//养鸭
			 updateTableCode2("m_ZYDP_YZ_SCZSQY_JBXX", "SZ_QX","SZ_XZ","SZ_XZC", "ID",3, db);//水产追溯
			 updateTableCode2("m_ZYDP_YZ_SLQY_JBXX", "SZ_QX","SZ_XZ","SZ_XZC", "ID",3, db);//13饲料企业
			 updateTableCode2("m_ZYDP_XMJG_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);//7畜牧相关机构
			 updateTableCode2("m_YZ_DWWSFYS_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);//动物卫生防疫所
			 updateTableCode2("m_YZ_DWZLDW_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);//1动物诊疗单位
			 updateTableCode2("m_KJZC_KJFW_ANYZ_JBXX", "SZ_QX","SZ_XZ","SZ_XZC", "ID",3, db);//爱农驿站
			 updateTableCode2("m_KJZC_KJFW_YCJY_JBXX", "SZ_QX","SZ_XZ","SZ_XZC", "ID",3, db);//远程教育站点
			 updateTableCode2("m_KJZC_KJFW_KJXTY_JBXX", "SZ_QX","SZ_XZ","SZ_XZC", "ID",3, db);//科技协调员
			 updateTableCode2("m_KJZC_KJFW_NCSZJY_JBXX", "SZ_QX","SZ_XZ","SZ_XZC", "ID",3, db);//数字家园【基本信息】
			 updateTableCode2("m_KJZC_KJFW_TJXX_JBXX", "QX_MC","XZ_MC","XZC_MC", "ID",3, db);//田间学校【基本信息表】
			 updateTableCode2("m_KJZC_KJFW_XTYGZZ_JBXX", "SZ_QX","SZ_XZ","SZ_XZC", "ID",3, db);//协调员工作站
			 
			 updateTableCode2("m_ZYDP_ST_ZZ_TRYF", "SZ_QX","SZ_XZ","SZ_XZC", "ID",3, db);//土壤资源
			 updateTableCode2("m_ZZ_ST_AGRILAND", "SZ_QX","SZ_XZ","SZ_XZC", "ID",3, db);//农用地块【空间数据表】
*/			 
			
			
			System.out.println(nullcount);
			System.out.println(bucunzai);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//zcptStat.close();

		}

	}
	private static void updateTableCode4(String table, String qx, String xz,
			String c, String idFiled, int level, DB db) {
		DBCollection villageColl = db.getCollection("m_ST_REG_VILLAGE");
		DBCollection area = db.getCollection("h_TA_Area");
		System.out.println(table);
		DBCollection tableColl = db.getCollection(table);
		int limit = 2000;
		int pagenum = 0;
		int counts = 0;
		boolean flag = true;
		BasicDBObject b = new BasicDBObject().append(doflag,
				new BasicDBObject().append(QueryOperators.EXISTS, false));
		while (flag) {
			DBCursor cursor = getrecode(0, limit, c, b, tableColl);
			flag = false;

			List<DBObject> list = new ArrayList<DBObject>();
			while (cursor.hasNext()) {
				System.out.println(counts++);
				flag = true;
				DBObject obj = cursor.next();
				list.add(obj);
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
//					DBObject query = new BasicDBObject();
//					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, "0");
//					tableColl.update(query, obj);
					nullcount++;
					continue;
				}
				quxian = area.findOne(new BasicDBObject().append("Area_ID", quxian)).get("Area_Name").toString();
				xiangzhen = area.findOne(new BasicDBObject().append("Area_ID", xiangzhen)).get("Area_Name").toString();
				DBObject o = area.findOne(new BasicDBObject().append("Area_ID", cun));
				if(o==null){
//					DBObject query = new BasicDBObject();
//					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, "0");
//					tableColl.update(query, obj);
					nullcount++;
					continue;
				}
				cun = o.get("Area_Name").toString();
				
				DBObject rec = villageColl.findOne(new BasicDBObject()
						.append("SZ_QX", quxian).append("SZ_XZ", xiangzhen)
						.append("SZ_XZC", cun));
				if (rec == null) {
					String cunstr= cun.replaceAll("乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					String qustr = quxian.replaceAll("乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					String xiangstr =xiangzhen.replaceAll("乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					//String cunstr = cun.replaceAll("村", "");
					rec = villageColl.findOne(new BasicDBObject()
							.append("SZ_QX", new BasicDBObject().append("$regex", ".*"
									+ qustr + ".*")).append("SZ_XZ", new BasicDBObject().append("$regex", ".*"
											+ xiangstr + ".*"))
							.append("SZ_XZC", new BasicDBObject().append("$regex", ".*"
									+ cunstr + ".*")));
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
//					DBObject query = new BasicDBObject();
//					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, "0");
//					tableColl.update(query, obj);
					System.out.println(quxian + ":" + xiangzhen + ":" + cun
							+ ":" + obj.get(idFiled));
					continue;
				}
				String code = (String) rec.get(CODE);
//				DBObject query = new BasicDBObject();
//				query.put(idFiled, obj.get(idFiled));
				obj.put("XZC_CODE", code);
				obj.put(doflag, "1");
//				tableColl.update(query, obj);
			}

			tableColl.insert(list);
			pagenum++;
		}

	}
	
	
	/*public void bulkWriteUpdate(List<Document> documents){  
	    List<WriteModel<Document>> requests = new ArrayList<WriteModel<Document>>();  
	    for (Document document : documents) {  
	        //更新条件  
	        Document queryDocument = new Document("_id",document.get("_id"));  
	        //更新内容，改下书的价格  
	        Document updateDocument = new Document("$set",new Document("price","30.6"));  
	        //构造更新单个文档的操作模型  
	        UpdateOneModel<Document> uom = new UpdateOneModel<Document>(queryDocument,updateDocument,new UpdateOptions().upsert(false));  
	        //UpdateOptions代表批量更新操作未匹配到查询条件时的动作，默认false，什么都不干，true时表示将一个新的Document插入数据库，他是查询部分和更新部分的结合  
	        requests.add(uom);  
	    }  
	    BulkWriteResult bulkWriteResult = collection.bulkWrite(requests);  
	    System.out.println(bulkWriteResult.toString());  
	}  */
	private static void updateTableCode3(String table, String qx, String xz,
			String c, String idFiled, int level, DB db) {
		DBCollection villageColl = db.getCollection("m_ST_REG_VILLAGE");
		System.out.println(table);
		DBCollection tableColl = db.getCollection(table);
		int limit = 2000;
		int pagenum = 0;
		int counts = 0;
		boolean flag = true;
		BasicDBObject b = new BasicDBObject().append(doflag,
				new BasicDBObject().append(QueryOperators.EXISTS, false));
		while (flag) {
			DBCursor cursor = getrecode(0, limit, c, b, tableColl);
			flag = false;

			List<DBObject> list = new ArrayList<DBObject>();
			
			while (cursor.hasNext()) {
				System.out.println(counts++);
				flag = true;
				DBObject obj = cursor.next();
				list.add(obj);
				String cun = obj.get(c) == null ? null : obj.get(c).toString()
						.trim();
				if (cun == null) {
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, "0");
					tableColl.update(query, obj);
					nullcount++;
					continue;
				}
				String xiangzhen = obj.get(xz) == null ? null : obj.get(xz)
						.toString().trim();
				if (xiangzhen == null) {
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, "0");
					tableColl.update(query, obj);
					nullcount++;
					continue;
				}
				String quxian = obj.get(c) == null ? null : obj.get(qx)
						.toString().trim();
				if (quxian == null) {
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, "0");
					tableColl.update(query, obj);
					nullcount++;
					continue;
				}
				DBObject rec = villageColl.findOne(new BasicDBObject()
						.append("SZ_QX", quxian).append("SZ_XZ", xiangzhen)
						.append("SZ_XZC", cun));
				if (rec == null) {
					String cunstr= cun.replaceAll("乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					String qustr = quxian.replaceAll("乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					String xiangstr =xiangzhen.replaceAll("乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					//String cunstr = cun.replaceAll("村", "");
					rec = villageColl.findOne(new BasicDBObject()
							.append("SZ_QX", new BasicDBObject().append("$regex", ".*"
									+ qustr + ".*")).append("SZ_XZ", new BasicDBObject().append("$regex", ".*"
											+ xiangstr + ".*"))
							.append("SZ_XZC", new BasicDBObject().append("$regex", ".*"
									+ cunstr + ".*")));
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
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, "0");
					tableColl.update(query, obj);
					System.out.println(quxian + ":" + xiangzhen + ":" + cun
							+ ":" + obj.get(idFiled));
					continue;
				}
				String code = (String) rec.get(CODE);
				DBObject query = new BasicDBObject();
				query.put(idFiled, obj.get(idFiled));
				obj.put("XZC_CODE", code);
				obj.put(doflag, "1");
				tableColl.update(query, obj);

			}
//tableColl.insert(list);
			pagenum++;
		}

	}
		
	
	private static void updateTableCode1(String table, DB db) {
		DBCollection regColl = db.getCollection("m_ZYDP_NCJJ_JQNYRKXB");
		DBCollection tableColl = db.getCollection(table);
		int limit = 2000;
		int pagenum = 0;
		boolean flag = true;
		String r ="XZC_CODE";
		BasicDBObject b = new BasicDBObject().append(doflag,
				new BasicDBObject().append(QueryOperators.EXISTS, false));
		while (flag) {
			DBCursor cursor = getrecode(0, limit, r, b, tableColl);
			flag = false;
			List<DBObject> list = new ArrayList<DBObject>();
			while (cursor.hasNext()) {
				flag = true;
				DBObject obj = cursor.next();
				list.add(obj);
				String JGCODE = obj.get("JG_BH")== null ? null : obj
						.get("JG_BH").toString();
				if (JGCODE == null) {
//					DBObject query = new BasicDBObject();
//					query.put(ID, obj.get(ID));
					obj.put(doflag, "0");
//					tableColl.update(query, obj);
					nullcount++;
					continue;
				}
				String name = JGCODE;
				DBObject rec = regColl.findOne(new BasicDBObject().append(
						"JG_BH",name));
				if (rec == null) {
					System.out.println(name+":"+obj.get(ID).toString());
//					DBObject query = new BasicDBObject();
//					query.put(ID, obj.get(ID));
					obj.put(doflag, "0");
//					tableColl.update(query, obj);
					bucunzai++;
					continue;
				}
				String code = (String) rec.get(r);
				if(code==null){
					System.out.println(name+":"+obj.get(ID).toString());
//					DBObject query = new BasicDBObject();
//					query.put(ID, obj.get(ID));
					obj.put(doflag, "0");
//					tableColl.update(query, obj);
					bucunzai++;
					continue;
				}
//				DBObject query = new BasicDBObject();
//				query.put(ID, obj.get(ID));
				obj.put(r, code);
				obj.put(doflag, "0");
//				tableColl.update(query, obj);

			}
tableColl.insert(list);
			pagenum++;
		}
		
	}

	private static void updateTableCode(String table, String filed,
			String idFiled, int level, DB db) {
		int i=0;
		DBCollection regColl = null;
		String r = "REG";
		if (level == 1) {
			regColl = db.getCollection("m_ST_REG_COUNTY");
			r = "QX_CODE";
		}
		if (level == 2) {
			regColl = db.getCollection("m_ST_REG_TOWN");
			r = "XZ_CODE";
		}
		if (level == 3) {
			regColl = db.getCollection("m_ST_REG_VILLAGE");
			r = "XZC_CODE";
		}
		DBCollection tableColl = db.getCollection(table);
		int limit = 2000;
		int pagenum = 0;
		boolean flag = true;
		
		BasicDBObject b = new BasicDBObject().append(doflag,
				new BasicDBObject().append(QueryOperators.EXISTS, false));
		while (flag) {
			System.out.println("pagenum:"+pagenum);
			DBCursor cursor = getrecode(0, limit, filed, b, tableColl);
			//DBCursor cursor = tableColl.find(new BasicDBObject().append("JG_BH", "D11022720905"));
			flag = false;
			List<DBObject> list = new ArrayList<DBObject>();
			while (cursor.hasNext()) {
				System.out.println(table+"====="+(i++));
				flag = true;
				DBObject obj = cursor.next();
				list.add(obj);
				StringBuffer fullName = null;
				fullName = obj.get(filed) == null ? null : new StringBuffer(obj
						.get(filed).toString());
				if (fullName == null||fullName.toString().trim().equals("")) {
					nullcount++;
					System.out.println("null");
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, "0");
					tableColl.update(query, obj);
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
					n= n.replaceAll("乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					
					 rec = regColl.findOne(new BasicDBObject().append(
							"FULLNAME",
							new BasicDBObject().append("$regex",
									".*" + n + ".*")));
					 if(rec == null){
						 if(n.indexOf("东翁各庄")!=-1){
							 n = n.replace("东翁各庄", "东瓮各庄");
						 }
						 if(n.indexOf("马驹桥柴务")!=-1){
							 n = n.replace("马驹桥柴务", "马驹桥.*柴务");
						 }
						 if(n.indexOf("羊坊")!=-1){
							 n = n.replace("羊坊", "羊房");
						 }
						 rec = regColl.findOne(new BasicDBObject().append(
									"FULLNAME",
									new BasicDBObject().append("$regex",
											".*" + n + ".*")));
					 }
				}
				
				if (rec == null) {
					System.out.println(name+":"+obj.get(idFiled).toString());
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, "0");
					tableColl.update(query, obj);
					bucunzai++;
					continue;
				}
				String code = (String) rec.get(CODE);
				DBObject query = new BasicDBObject();
				query.put(idFiled, obj.get(idFiled));
				obj.put(doflag, "1");
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
		int limit = 50;
		int pagenum = 0;
		int counts = 0;
		boolean flag = true;
		BasicDBObject b = new BasicDBObject();//.append(doflag,
			//	new BasicDBObject().append(QueryOperators.EXISTS, false));//.append("NF", "2011");
		while (flag) {
			DBCursor cursor = getrecode(0, limit, c, b, tableColl);
			flag = false;
			List<DBObject> list = new ArrayList<DBObject>();
			while (cursor.hasNext()) {
				System.out.println(counts++);
				flag = true;
				DBObject obj = cursor.next();
				list.add(obj);
				String cun = obj.get(c) == null ? null : obj.get(c).toString()
						.trim();
				if (cun == null) {
					nullcount++;
					obj.put(doflag,"0");
//					DBObject query = new BasicDBObject();
//					query.put(idFiled, obj.get(idFiled));
//					tableColl.update(query, obj);
					continue;
				}
				String xiangzhen = obj.get(xz) == null ? null : obj.get(xz)
						.toString().trim();
				if (xiangzhen == null) {
					nullcount++;
					obj.put(doflag,"0");
//					DBObject query = new BasicDBObject();
//					query.put(idFiled, obj.get(idFiled));
//					tableColl.update(query, obj);
					continue;
				}
				String quxian = obj.get(c) == null ? null : obj.get(qx)
						.toString().trim();
				if (quxian == null) {
					nullcount++;
					obj.put(doflag,"0");
//					DBObject query = new BasicDBObject();
//					query.put(idFiled, obj.get(idFiled));
//					tableColl.update(query, obj);
					continue;
				}
				DBObject rec = villageColl.findOne(new BasicDBObject()
						.append("SZ_QX", quxian).append("SZ_XZ", xiangzhen)
						.append("SZ_XZC", cun));
				if (rec == null) {
					String cunstr= cun.replaceAll("乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					String qustr = quxian.replaceAll("乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					String xiangstr =xiangzhen.replaceAll("乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					//String cunstr = cun.replaceAll("村", "");
					rec = villageColl.findOne(new BasicDBObject()
							.append("SZ_QX", new BasicDBObject().append("$regex", ".*"
									+ qustr + ".*")).append("SZ_XZ", new BasicDBObject().append("$regex", ".*"
											+ xiangstr + ".*"))
							.append("SZ_XZC", new BasicDBObject().append("$regex", ".*"
									+ cunstr + ".*")));
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
					obj.put(doflag,"0");
//					DBObject query = new BasicDBObject();
//					query.put(idFiled, obj.get(idFiled));
//					tableColl.update(query, obj);
					System.out.println(quxian + ":" + xiangzhen + ":" + cun
							+ ":" + obj.get(idFiled));
					continue;
				}
				String code = (String) rec.get(CODE);
//				DBObject query = new BasicDBObject();
//				query.put(idFiled, obj.get(idFiled));
				obj.put("XZC_CODE", code);
				obj.put(doflag,"1");
//				tableColl.update(query, obj);

			}
			//tableColl.r
			tableColl.insert(list);
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

	private static void initAreaFullName(){
		DB c = getDB();
		DBCollection coll = c.getCollection("h_TA_Area");
		int count = 0;
		int pageNum=-1;
		do{
			pageNum++;
		}while(updateFullName(pageNum,coll));
	}
	
	private static boolean updateFullName(int pageNum,DBCollection coll) {
		int batchSize = 200;
		int numToSkip = batchSize*pageNum;
		DBCursor list = coll.find().sort(new BasicDBObject().append("Area_ID", 1))
				.skip(numToSkip).limit(batchSize);
		boolean b = false;
		while(list.hasNext()){
			b=true;
			DBObject o = list.next();
			String AreaID = (String)o.get("Area_ID");
			String Area_Name = (String)o.get("Area_Name");
			String Area_FatherID = (String)o.get("Area_FatherID");
			Area area = new init3().new Area().setFullName(Area_Name);
			getPName(Area_FatherID,coll,area);
			o.put("Area_FullName", area.getFullName());
			o.put("level", area.getLevel());
			System.out.println(area.getFullName());
			coll.update(new BasicDBObject().append("Area_ID", AreaID), o);
		}
		return b;
	}
	public class Area{
		private String fullName="";
		private int level=0;
		public String getFullName() {
			return fullName;
		}
		public Area setFullName(String fullName) {
			this.fullName = fullName;
			return this;
		}
		public int getLevel() {
			return level;
		}
		public void setLevel(int level) {
			this.level = level;
		}
		
	}



	private static String getPName(String area_FatherID,DBCollection coll,Area area) {
		if(!area_FatherID.equals("0")){
			DBObject o = coll.findOne(new BasicDBObject().append("Area_ID",area_FatherID));
			if(o==null){
				return "";
			}
			String AreaID = (String)o.get("Area_ID");
			String Area_Name = (String)o.get("Area_Name");
			String Area_FatherID = (String)o.get("Area_FatherID");
			area.setFullName(Area_Name+area.getFullName());
			area.setLevel(area.getLevel()+1);
			 getPName(Area_FatherID,coll,area);
			
		}
		return "";
		
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
			county.put(doflag, "1");
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
				//xiang.put("SZ_QX_CODE", code);
				xiang.put(CODE, code + codex);
				xiang.put(FULLNAME, "北京市" + name + xiang.get("MC"));
				xiang.put(doflag, "1");
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
					//c.put("SZ_QX_CODE", code);
					//c.put("SZ_XZ_CODE", code + codex);
					c.put(CODE, code + codex + codec);
					c.put(FULLNAME,
							"北京市" + name + xiang.get("MC") + c.get("MC"));
					c.put(doflag, "1");
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
			//mongo = new Mongo("192.168.102.131", 27017);
			mongo = new Mongo("127.0.0.1", 27017);
			DB db = mongo.getDB("datamanage");
			return db;
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
