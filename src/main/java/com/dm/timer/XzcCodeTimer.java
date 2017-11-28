package com.dm.timer;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.mongodb.core.MongoTemplate;

import com.dm.platform.util.DmDateUtil;
import com.dm.timer.dto.Area;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.QueryOperators;
import com.mongodb.WriteResult;

public class XzcCodeTimer {

	public final static String ID = "ID";
	public final static String FULLNAME = "FULLNAME";
	public final static String NAME = "NAME";
	public final static String PARENT_ID = "PARENT_ID";
	public final static String TYPE = "TYPE";
	public final static String CODE = "CODE";
	public final static String level = "level";
	public final static String OBJECTID = "OBJECTID";
	public final static String doflag = "doflag";
	public final static String doflagFALSE = "0";
	public final static String doflagTRUE = "2";
	public static int nullcount = 0;
	public static int bucunzai = 0;

	@Autowired
	private MongoTemplate mongo;
	

	public void setMongo(MongoTemplate mongo) {
		this.mongo = mongo;
	}

	@Value("${spring.task.XzcCode.isRun}")
	private boolean isRun;

	public void doAction() {
		if (!isRun) {
			return;
		}
		System.out.println(XzcCodeTimer.class+":"+DmDateUtil.Current());
		DBCollection coll = mongo.getCollection("conf_detail");// 获取要更新的表;
		// 整理的 2016 对应221 对应村庄规划
		BasicDBObject query = new BasicDBObject().append("type", "5");
		DBCursor cur = coll.find(query);
		if (cur.hasNext()) {
			//DBObject o = cur.next();
			xzqh2016();
			// updateTableCode221reg(collectionName, id221);
			// updateTableCodeCZGH(collectionName, idczgh);
		}
		query.append("type", "2");
		cur = coll.find(query);
		while (cur.hasNext()) {
			DBObject o = cur.next();
			String collectionName = o.get("coll").toString();
			String qx = o.get("qx").toString();
			String xz = o.get("xz").toString();
			String xzc = o.get("xzc").toString();
			String id = o.get("id").toString();
			updateTableCode2(collectionName, qx, xz, xzc, id);
		}
		query.append("type", "3");
		cur = coll.find(query);
		while (cur.hasNext()) {
			DBObject o = cur.next();
			String collectionName = o.get("coll").toString();
			String qx = o.get("qx").toString();
			String xz = o.get("xz").toString();
			String xzc = o.get("xzc").toString();
			String id = o.get("id").toString();
			updateTableCode3(collectionName, qx, xz, xzc, id);
		}
		query.append("type", "0");
		cur = coll.find(query);
		while (cur.hasNext()) {
			DBObject o = cur.next();
			String collectionName = o.get("coll").toString();
			String jg = o.get("jg").toString();
			String id = o.get("id").toString();
			updateTableCode(collectionName, jg, id);
		}
		query.append("type", "1");
		cur = coll.find(query);
		while (cur.hasNext()) {
			DBObject o = cur.next();
			String collectionName = o.get("coll").toString();
			updateTableCode1(collectionName);
		}
		query.append("type", "4");
		cur = coll.find(query);
		while (cur.hasNext()) {
			DBObject o = cur.next();
			String collectionName = o.get("coll").toString();
			String qx = o.get("qx").toString();
			String xz = o.get("xz").toString();
			String xzc = o.get("xzc").toString();
			String id = o.get("id").toString();
			updateTableCode4(collectionName, qx, xz, xzc, id);
		}
		query.append("type", "6");
		cur = coll.find(query);
		while (cur.hasNext()) {
			DBObject o = cur.next();
			String collectionName = o.get("coll").toString();
			String title = o.get("title").toString();
			String content = o.get("content").toString();
			String id = o.get("id").toString();
			updateTableCode6(collectionName, title, content, id);
		}
		System.out.println(XzcCodeTimer.class+"结束:"+DmDateUtil.Current());
	}
	//在title 中获取村名  在content 中获取更详细的信息 区县乡镇村
	public void updateTableCode6(String collectionName, String title,
			String content, String id) {
		int i = 0;
		DBCollection regColl = null;
		regColl = mongo.getCollection("m_ST_REG_VILLAGE");
		// }
		DBCollection tableColl = mongo.getCollection(collectionName);
		int limit = 2000;
		int pagenum = 0;
		boolean flag = true;

		BasicDBObject q = new BasicDBObject().append(QueryOperators.OR, new BasicDBObject[]{new  BasicDBObject().append(doflag,
				new BasicDBObject().append(QueryOperators.EXISTS, false)),new BasicDBObject().append(doflag, "1")});
		while (flag) {
			DBCursor cursor = getrecode(0, limit, "_id", q, tableColl);
			// DBCursor cursor = tableColl.find(new
			// BasicDBObject().append("JG_BH", "D11022720905"));
			flag = false;
			List<DBObject> list = new ArrayList<DBObject>();
			while (cursor.hasNext()) {
				flag = true;
				System.out.println(collectionName + "=====" + (i++));
				DBObject cur = cursor.next();
				String curid = cur.get(id).toString();
				String curContent = cur.get(content).toString();
				String curTitle = cur.get(title).toString();
				DBObject curq = new BasicDBObject().append(id, curid);
				int level = 0;
				boolean f = true;
				String cunming ="";
				do{
					cunming = getCun(curTitle,level++);
					if(cunming!=null){
						DBCursor regcur = regColl.find(new BasicDBObject().append("MC", cunming));
						while(regcur.hasNext()){
							f = false;
							DBObject regObj = regcur.next();
							//TODO 处理内容中的地址 匹配更精确
							String xiangxicunming = getVillage(curContent);
							cur.put("CODE", regObj.get("CODE"));
							cur.put(doflag,doflagTRUE);
							tableColl.update(curq, cur);
							break;
						}
					}
				}while(cunming!=null &&f);
				if(f){
					cur.put(doflag,doflagFALSE);
					tableColl.update(curq, cur);
				}
					
//				}else{
//					cur.put(doflag,doflagFALSE);
//				}
				
			}
		}
		
		
	}

	public String getCun(String title,int level) {
		int index = title.indexOf("村");
		if(index>0){
			if(level<index)
				return title.substring(level,index+1);
		}
		return null;
	}
	// 整理 221 与 村庄规划 2016年区划对应关系
	public void xzqh2016() {
		DBCollection villageColl = mongo.getCollection("m_ST_REG_VILLAGE");
		DBCollection townColl = mongo.getCollection("m_ST_REG_TOWN");
		DBCollection contryColl = mongo.getCollection("m_ST_REG_COUNTY");
		DBCollection im_bjsqhdm2016Coll = mongo.getCollection("im_bjsqhdm2016");
		DBCollection b_CountryPicColl = mongo.getCollection("b_CountryPic");
		int limit = 2000;
		int pagenum = 0;
		int counts = 0;
		boolean flag = true;
		BasicDBObject b = new BasicDBObject().append(doflag,
				new BasicDBObject().append(QueryOperators.EXISTS, false));
		while (flag) {
			DBCursor cursor = getrecode(0, limit, "tjyqhdm", b,
					im_bjsqhdm2016Coll);
			flag = false;

			List<DBObject> list = new ArrayList<DBObject>();
			while (cursor.hasNext()) {
				flag = true;
				DBObject obj = cursor.next();
				list.add(obj);
				String cunzhuangCODE = obj.get("dyczghxtzdm") == null ? null
						: obj.get("dyczghxtzdm").toString();
				String code = obj.get("tjyqhdm") == null ? null : obj.get(
						"tjyqhdm").toString();
				String n221CODE = obj.get("dyxxptzID") == null ? null : obj
						.get("dyxxptzID").toString();
				if (n221CODE != null && !n221CODE.equals("")) {
					DBObject q = new BasicDBObject().append("ID", Integer.valueOf(n221CODE));
					DBObject village = villageColl.findOne(q);
					if (village != null) {
						String oldCode = village.get("CODE").toString();
						village.put("CODE", code);
						village.put("SZ_XZ_CODE", code.substring(0,9));
						village.put("SZ_QX_CODE", code.substring(0,6));
						village.put(doflag, doflagTRUE);
						System.out.println(village.toString());
						villageColl.update(q, village);
						DBObject qt = new BasicDBObject().append("CODE", oldCode.substring(0,9));
						DBObject town = townColl.findOne(qt);
						if(town!=null){
							town.put("CODE", code.substring(0,9));
							town.put(doflag, doflagTRUE);
							townColl.update(qt, town);
							String qxcode=town.get(CODE).toString().substring(0, 6);
							if(!code.substring(0,6).equals(qxcode)){
								DBObject qxq = new BasicDBObject().append(CODE, qxcode);
								DBObject qx = contryColl.findOne(qxq);
								if(qx!=null){
									qx.put(CODE, code.subSequence(0, 6));
									qx.put(doflag, doflagTRUE);
									contryColl.update(qxq, qx);
								}
							}
						}
					}
				}
				if (cunzhuangCODE != null && !cunzhuangCODE.equals("")) {
					DBObject q = new BasicDBObject().append("COUNTRYID",
							cunzhuangCODE);
					DBCursor picCursor = b_CountryPicColl.find(q);
					while(picCursor.hasNext()){
						DBObject pic = picCursor.next();
						if (pic != null) {
							pic.put("CODE", code);
							pic.put(doflag, doflagTRUE);
							b_CountryPicColl.update(q, pic);
						}
					}
				}
				DBObject q2016 = new BasicDBObject().append("id", obj.get("id"));
				obj.put(doflag, doflagTRUE);
				im_bjsqhdm2016Coll.update(q2016, obj);
			}
		}

	}

	private String getVillage(String line) {
		String pattern = "(.{2}市)?.{2,4}[区,县].{1,5}[镇,乡,街道].{1,5}[村委会,村]";
		Pattern r = Pattern.compile(pattern);

		// 现在创建 matcher 对象
		Matcher m = r.matcher(line);
		if (m.find())
			return m.group();
		return null;

	}

	public void updateTableCode4(String table, String qx, String xz, String c,
			String idFiled) {
		DBCollection villageColl = mongo.getCollection("m_ST_REG_VILLAGE");
		DBCollection area = mongo.getCollection("h_TA_Area");
		System.out.println(table);
		DBCollection tableColl = mongo.getCollection(table);
		int limit = 2000;
		int pagenum = 0;
		int counts = 0;
		boolean flag = true;
		BasicDBObject q = new BasicDBObject().append(QueryOperators.OR, new BasicDBObject[]{new  BasicDBObject().append(doflag,
				new BasicDBObject().append(QueryOperators.EXISTS, false)),new BasicDBObject().append(doflag, "1")});
		while (flag) {
			DBCursor cursor = getrecode(0, limit, c, q, tableColl);
			flag = false;

			List<DBObject> list = new ArrayList<DBObject>();
			while (cursor.hasNext()) {
				System.out.println(table + "==" + counts++);
				flag = true;
				DBObject obj = cursor.next();
				list.add(obj);
				String cun = obj.get(c) == null ? null : obj.get(c).toString()
						.trim();
				if (cun == null) {
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, doflagFALSE);
					tableColl.update(query, obj);
					nullcount++;
					continue;
				}
				String xiangzhen = obj.get(xz) == null ? null : obj.get(xz)
						.toString().trim();
				if (xiangzhen == null) {
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, doflagFALSE);
					tableColl.update(query, obj);
					nullcount++;
					continue;
				}
				String quxian = obj.get(c) == null ? null : obj.get(qx)
						.toString().trim();
				if (quxian == null) {
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, doflagFALSE);
					tableColl.update(query, obj);
					nullcount++;
					continue;
				}
				quxian = area
						.findOne(new BasicDBObject().append("Area_ID", quxian))
						.get("Area_Name").toString();
				xiangzhen = area
						.findOne(
								new BasicDBObject()
										.append("Area_ID", xiangzhen))
						.get("Area_Name").toString();
				DBObject o = area.findOne(new BasicDBObject().append("Area_ID",
						cun));
				if (o == null) {
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, doflagFALSE);
					tableColl.update(query, obj);
					nullcount++;
					continue;
				}
				cun = o.get("Area_Name").toString();

				DBObject rec = villageColl.findOne(new BasicDBObject()
						.append("SZ_QX", quxian).append("SZ_XZ", xiangzhen)
						.append("SZ_XZC", cun));
				if (rec == null) {
					String cunstr = cun.replaceAll(
							"乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					String qustr = quxian.replaceAll(
							"乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					String xiangstr = xiangzhen.replaceAll(
							"乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					// String cunstr = cun.replaceAll("村", "");
					rec = villageColl.findOne(new BasicDBObject()
							.append("SZ_QX",
									new BasicDBObject().append("$regex", ".*"
											+ qustr + ".*"))
							.append("SZ_XZ",
									new BasicDBObject().append("$regex", ".*"
											+ xiangstr + ".*"))
							.append("SZ_XZC",
									new BasicDBObject().append("$regex", ".*"
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
					obj.put(doflag, doflagFALSE);
					tableColl.update(query, obj);
					System.out.println(quxian + ":" + xiangzhen + ":" + cun
							+ ":" + obj.get(idFiled));
					continue;
				}
				String code = (String) rec.get(CODE);
				DBObject query = new BasicDBObject();
				query.put(idFiled, obj.get(idFiled));
				obj.put("XZC_CODE", code);
				obj.put(doflag, doflagTRUE);
				tableColl.update(query, obj);
			}

			// tableColl.insert(list);
			pagenum++;
		}

	}

	/*
	 * public void bulkWriteUpdate(List<Document> documents){
	 * List<WriteModel<Document>> requests = new
	 * ArrayList<WriteModel<Document>>(); for (Document document : documents) {
	 * //更新条件 Document queryDocument = new Document("_id",document.get("_id"));
	 * //更新内容，改下书的价格 Document updateDocument = new Document("$set",new
	 * Document("price","30.6")); //构造更新单个文档的操作模型 UpdateOneModel<Document> uom =
	 * new UpdateOneModel<Document>(queryDocument,updateDocument,new
	 * UpdateOptions().upsert(false));
	 * //UpdateOptions代表批量更新操作未匹配到查询条件时的动作，默认false
	 * ，什么都不干，true时表示将一个新的Document插入数据库，他是查询部分和更新部分的结合 requests.add(uom); }
	 * BulkWriteResult bulkWriteResult = collection.bulkWrite(requests);
	 * System.out.println(bulkWriteResult.toString()); }
	 */
	public void updateTableCode3(String table, String qx, String xz, String c,
			String idFiled) {
		DBCollection villageColl = mongo.getCollection("m_ST_REG_VILLAGE");
		System.out.println(table);
		DBCollection tableColl = mongo.getCollection(table);
		int limit = 2000;
		int pagenum = 0;
		int counts = 0;
		boolean flag = true;
		BasicDBObject q = new BasicDBObject().append(QueryOperators.OR, new BasicDBObject[]{new  BasicDBObject().append(doflag,
				new BasicDBObject().append(QueryOperators.EXISTS, false)),new BasicDBObject().append(doflag, "1")})
				.append("NF", "2012");
		while (flag) {
			DBCursor cursor = getrecode(0, limit, c, q, tableColl);
			flag = false;

			// List<DBObject> list = new ArrayList<DBObject>();
			while (cursor.hasNext()) {
				System.out.println(table + "==" + counts++);
				flag = true;
				DBObject obj = cursor.next();
				// list.add(obj);
				String cun = obj.get(c) == null ? null : obj.get(c).toString()
						.trim();
				if (cun == null) {
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, doflagFALSE);
					tableColl.update(query, obj);
					nullcount++;
					continue;
				}
				String xiangzhen = obj.get(xz) == null ? null : obj.get(xz)
						.toString().trim();
				if (xiangzhen == null) {
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, doflagFALSE);
					tableColl.update(query, obj);
					nullcount++;
					continue;
				}
				String quxian = obj.get(c) == null ? null : obj.get(qx)
						.toString().trim();
				if (quxian == null) {
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, doflagFALSE);
					tableColl.update(query, obj);
					nullcount++;
					continue;
				}
				DBObject rec = villageColl.findOne(new BasicDBObject()
						.append("SZ_QX", quxian).append("SZ_XZ", xiangzhen)
						.append("SZ_XZC", cun));
				if (rec == null) {
					String cunstr = cun.replaceAll(
							"乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					String qustr = quxian.replaceAll(
							"乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					String xiangstr = xiangzhen.replaceAll(
							"乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					// String cunstr = cun.replaceAll("村", "");
					rec = villageColl.findOne(new BasicDBObject()
							.append("SZ_QX",
									new BasicDBObject().append("$regex", ".*"
											+ qustr + ".*"))
							.append("SZ_XZ",
									new BasicDBObject().append("$regex", ".*"
											+ xiangstr + ".*"))
							.append("SZ_XZC",
									new BasicDBObject().append("$regex", ".*"
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
					obj.put(doflag, doflagFALSE);
					tableColl.update(query, obj);
					System.out.println(quxian + ":" + xiangzhen + ":" + cun
							+ ":" + obj.get(idFiled));
					continue;
				}
				String code = (String) rec.get(CODE);
				DBObject query = new BasicDBObject();
				query.put(idFiled, obj.get(idFiled));
				obj.put("XZC_CODE", code);
				obj.put(doflag, doflagTRUE);
				tableColl.update(query, obj);

			}
			// //tableColl.insert(list);
			pagenum++;
		}

	}

	public void updateTableCode1(String table) {
		DBCollection regColl = mongo.getCollection("m_ZYDP_NCJJ_JQNYRKXB");
		DBCollection tableColl = mongo.getCollection(table);
		int limit = 2000;
		int pagenum = 0;
		boolean flag = true;
		String r = "XZC_CODE";
		BasicDBObject q = new BasicDBObject().append(QueryOperators.OR, new BasicDBObject[]{new  BasicDBObject().append(doflag,
				new BasicDBObject().append(QueryOperators.EXISTS, false)),new BasicDBObject().append(doflag, "1")});
		System.out.println(table);
		while (flag) {
			DBCursor cursor = getrecode(0, limit, r, q, tableColl);
			flag = false;
			// List<DBObject> list = new ArrayList<DBObject>();
			while (cursor.hasNext()) {
				flag = true;
				DBObject obj = cursor.next();
				// list.add(obj);
				String JGCODE = obj.get("JG_BH") == null ? null : obj.get(
						"JG_BH").toString();
				if (JGCODE == null) {
					DBObject query = new BasicDBObject();
					query.put(ID, obj.get(ID));
					obj.put(doflag, doflagFALSE);
					tableColl.update(query, obj);
					nullcount++;
					continue;
				}
				String name = JGCODE;
				DBObject rec = regColl.findOne(new BasicDBObject().append(
						"JG_BH", name));
				if (rec == null) {
					System.out.println(name + ":" + obj.get(ID).toString());
					DBObject query = new BasicDBObject();
					query.put(ID, obj.get(ID));
					obj.put(doflag, doflagFALSE);
					tableColl.update(query, obj);
					bucunzai++;
					continue;
				}
				String code = (String) rec.get(r);
				if (code == null) {
					System.out.println(name + ":" + obj.get(ID).toString());
					DBObject query = new BasicDBObject();
					query.put(ID, obj.get(ID));
					obj.put(doflag, doflagFALSE);
					tableColl.update(query, obj);
					bucunzai++;
					continue;
				}
				DBObject query = new BasicDBObject();
				query.put(ID, obj.get(ID));
				obj.put(r, code);
				obj.put(doflag, doflagFALSE);
				tableColl.update(query, obj);

			}
			// tableColl.insert(list);
			pagenum++;
		}

	}

	public void updateTableCode(String table, String filed, String idFiled) {
		int i = 0;
		DBCollection regColl = null;
		String r = "REG";
		// if (level == 1) {
		// regColl = mongo.getCollection("m_ST_REG_COUNTY");
		// r = "QX_CODE";
		// }
		// if (level == 2) {
		// regColl = mongo.getCollection("m_ST_REG_TOWN");
		// r = "XZ_CODE";
		// }
		// if (level == 3) {
		regColl = mongo.getCollection("m_ST_REG_VILLAGE");
		r = "XZC_CODE";
		// }
		DBCollection tableColl = mongo.getCollection(table);
		int limit = 2000;
		int pagenum = 0;
		boolean flag = true;

		BasicDBObject q = new BasicDBObject().append(QueryOperators.OR, new BasicDBObject[]{new  BasicDBObject().append(doflag,
				new BasicDBObject().append(QueryOperators.EXISTS, false)),new BasicDBObject().append(doflag, "1")});
		while (flag) {
			DBCursor cursor = getrecode(0, limit, filed, q, tableColl);
			// DBCursor cursor = tableColl.find(new
			// BasicDBObject().append("JG_BH", "D11022720905"));
			flag = false;
			List<DBObject> list = new ArrayList<DBObject>();
			while (cursor.hasNext()) {
				System.out.println(table + "=====" + (i++));
				flag = true;
				DBObject obj = cursor.next();
				list.add(obj);
				StringBuffer fullName = null;
				fullName = obj.get(filed) == null ? null : new StringBuffer(obj
						.get(filed).toString());
				if (fullName == null || fullName.toString().trim().equals("")) {
					nullcount++;
					System.out.println("null");
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, doflagFALSE);
					tableColl.update(query, obj);
					continue;
				}
				String name = fullName.toString();
				DBObject rec = regColl.findOne(new BasicDBObject().append(
						"FULLNAME", new BasicDBObject().append("$regex", ".*"
								+ name + ".*")));
				if (rec == null) {
					String n = name;
					if (name.indexOf("北京市") != -1) {
						name.substring(name.indexOf("北京市")).trim();
					}
					n = n.replaceAll("乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村",
							".*");

					rec = regColl.findOne(new BasicDBObject().append(
							"FULLNAME",
							new BasicDBObject().append("$regex", ".*" + n
									+ ".*")));
					if (rec == null) {
						if (n.indexOf("东翁各庄") != -1) {
							n = n.replace("东翁各庄", "东瓮各庄");
						}
						if (n.indexOf("马驹桥柴务") != -1) {
							n = n.replace("马驹桥柴务", "马驹桥.*柴务");
						}
						if (n.indexOf("羊坊") != -1) {
							n = n.replace("羊坊", "羊房");
						}
						rec = regColl.findOne(new BasicDBObject().append(
								"FULLNAME",
								new BasicDBObject().append("$regex", ".*" + n
										+ ".*")));
					}
				}

				if (rec == null) {
					System.out
							.println(name + ":" + obj.get(idFiled).toString());
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					obj.put(doflag, doflagFALSE);
					tableColl.update(query, obj);
					bucunzai++;
					continue;
				}
				String code = (String) rec.get(CODE);
				DBObject query = new BasicDBObject();
				query.put(idFiled, obj.get(idFiled));
				obj.put(doflag, doflagTRUE);
				obj.put(r, code);
				tableColl.update(query, obj);

			}

			pagenum++;
		}

	}

	public void updateTableCode2(String table, String qx, String xz, String c,
			String idFiled) {
		// DBCollection countyColl = mongo.getCollection("m_ST_REG_COUNTY");
		// DBCollection townColl = mongo.getCollection("m_ST_REG_TOWN");
		DBCollection villageColl = mongo.getCollection("m_ST_REG_VILLAGE");
		System.out.println(table);
		DBCollection tableColl = mongo.getCollection(table);
		BasicDBObject q = new BasicDBObject().append(QueryOperators.OR, new BasicDBObject[]{new  BasicDBObject().append(doflag,
				new BasicDBObject().append(QueryOperators.EXISTS, false)),new BasicDBObject().append(doflag, "1")});
		int limit = 50;
		int pagenum = 0;
		int counts = 0;
		boolean flag = true;
		while (flag) {
			DBCursor cursor = getrecode(0, limit, c, q, tableColl);
			flag = false;
			// List<DBObject> list = new ArrayList<DBObject>();
			while (cursor.hasNext()) {
				flag = true;
				DBObject obj = cursor.next();
				// list.add(obj);
				String cun = obj.get(c) == null ? null : obj.get(c).toString()
						.trim();
				if (cun == null) {
					nullcount++;
					obj.put(doflag, doflagFALSE);
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					tableColl.update(query, obj);
					continue;
				}
				String xiangzhen = obj.get(xz) == null ? null : obj.get(xz)
						.toString().trim();
				if (xiangzhen == null) {
					nullcount++;
					obj.put(doflag, doflagFALSE);
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					tableColl.update(query, obj);
					continue;
				}
				String quxian = obj.get(c) == null ? null : obj.get(qx)
						.toString().trim();
				if (quxian == null) {
					nullcount++;
					obj.put(doflag, doflagFALSE);
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					tableColl.update(query, obj);
					continue;
				}
				DBObject rec = villageColl.findOne(new BasicDBObject()
						.append("SZ_QX", quxian).append("SZ_XZ", xiangzhen)
						.append("SZ_XZC", cun));
				if (rec == null) {
					String cunstr = cun.replaceAll(
							"乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					String qustr = quxian.replaceAll(
							"乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					String xiangstr = xiangzhen.replaceAll(
							"乡|镇|区县|办事处|街道|（村委会）|(村委会)|村委会|委员会|地区|村", ".*");
					// String cunstr = cun.replaceAll("村", "");
					rec = villageColl.findOne(new BasicDBObject()
							.append("SZ_QX",
									new BasicDBObject().append("$regex", ".*"
											+ qustr + ".*"))
							.append("SZ_XZ",
									new BasicDBObject().append("$regex", ".*"
											+ xiangstr + ".*"))
							.append("SZ_XZC",
									new BasicDBObject().append("$regex", ".*"
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
					obj.put(doflag, doflagFALSE);
					DBObject query = new BasicDBObject();
					query.put(idFiled, obj.get(idFiled));
					tableColl.update(query, obj);
					System.out.println(quxian + ":" + xiangzhen + ":" + cun
							+ ":" + obj.get(idFiled));
					continue;
				}
				String code = (String) rec.get(CODE);
				DBObject query = new BasicDBObject();
				query.put(idFiled, obj.get(idFiled));
				obj.put("XZC_CODE", code);
				obj.put(doflag, doflagTRUE);
				tableColl.update(query, obj);

			}
			// tableColl.r
			// tableColl.insert(list);
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

	private void initAreaFullName() {
		DBCollection coll = mongo.getCollection("h_TA_Area");
		int count = 0;
		int pageNum = -1;
		do {
			pageNum++;
		} while (updateFullName(pageNum, coll));
	}

	private boolean updateFullName(int pageNum, DBCollection coll) {
		int batchSize = 200;
		int numToSkip = batchSize * pageNum;
		DBCursor list = coll.find()
				.sort(new BasicDBObject().append("Area_ID", 1)).skip(numToSkip)
				.limit(batchSize);
		boolean b = false;
		while (list.hasNext()) {
			b = true;
			DBObject o = list.next();
			String AreaID = (String) o.get("Area_ID");
			String Area_Name = (String) o.get("Area_Name");
			String Area_FatherID = (String) o.get("Area_FatherID");
			Area area = new Area().setFullName(Area_Name);
			getPName(Area_FatherID, coll, area);
			o.put("Area_FullName", area.getFullName());
			o.put("level", area.getLevel());
			System.out.println(area.getFullName());
			coll.update(new BasicDBObject().append("Area_ID", AreaID), o);
		}
		return b;
	}

	private String getPName(String area_FatherID, DBCollection coll, Area area) {
		if (!area_FatherID.equals(doflagFALSE)) {
			DBObject o = coll.findOne(new BasicDBObject().append("Area_ID",
					area_FatherID));
			if (o == null) {
				return "";
			}
			String AreaID = (String) o.get("Area_ID");
			String Area_Name = (String) o.get("Area_Name");
			String Area_FatherID = (String) o.get("Area_FatherID");
			area.setFullName(Area_Name + area.getFullName());
			area.setLevel(area.getLevel() + 1);
			getPName(Area_FatherID, coll, area);

		}
		return "";

	}

	private void updateCounty(DB db, List<Map> quxianList) {

		DBCollection countyColl = mongo.getCollection("m_ST_REG_COUNTY");
		DBCollection townColl = mongo.getCollection("m_ST_REG_TOWN");
		DBCollection villageColl = mongo.getCollection("m_ST_REG_VILLAGE");
		for (Map<String, String> map : quxianList) {
			String name = map.get(NAME);
			// 区县
			BasicDBObject query = new BasicDBObject();
			query.append("MC", name);
			DBObject county = countyColl.findOne(query);
			if (county == null) {
				county.put(doflag, doflagFALSE);
				countyColl.update(query, county);
				continue;
			}
			String code = map.get(CODE);
			county.put(CODE, code);
			county.put(FULLNAME, "北京市" + name);
			county.put(doflag, doflagTRUE);
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
				// xiang.put("SZ_QX_CODE", code);
				xiang.put(CODE, code + codex);
				xiang.put(FULLNAME, "北京市" + name + xiang.get("MC"));
				xiang.put(doflag, doflagTRUE);
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
					// c.put("SZ_QX_CODE", code);
					// c.put("SZ_XZ_CODE", code + codex);
					c.put(CODE, code + codex + codec);
					c.put(FULLNAME,
							"北京市" + name + xiang.get("MC") + c.get("MC"));
					c.put(doflag, doflagTRUE);
					WriteResult r = villageColl.update(que1, c);
					System.out.println(c.get("SZ_QX") + "--" + c.get("SZ_XZ")
							+ "--" + c.get("MC") + "--" + r.getN());
					codec = code(codec);
				}
				codex = code(codex);
			}

		}

	}

	private String code(String code) {
		code = "00" + (Integer.parseInt(code) + 1);
		return code.substring(code.length() - 3);
	}

	private List<Map> getQuxianList(Statement zcptStat) {
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

}
