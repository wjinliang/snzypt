package initDivition.util;

import java.net.UnknownHostException;
import java.util.HashSet;
import java.util.Set;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.Mongo;

public class TestRunShell {
	public static void main(String[] args) throws Exception {
		DB db = getDB();

		Set<String> set = db.getCollectionNames();
		set = new HashSet<String>();
		set.add("t_APPLOG");
		set.add("t_BJNC_FZGC_JBQKNBFOUR");
		set.add("t_BJNC_FZGC_JBQKNBONE");
		set.add("t_BJNC_FZGC_JBQKNBTHREE");
		set.add("t_BJNC_FZGC_JBQKNBTWO");
		set.add("t_BJNC_GCDJB");
		set.add("t_BJNC_XXCJ_CPXSJG");
		set.add("t_BJNC_XXCJ_CPXSJGSUB");
		set.add("t_BJNC_XXCJ_SCTRJG");
		set.add("t_BJNC_XXCJ_SCTRJGSUB");
		set.add("t_CHINESENEWYEAR");
		set.add("t_CUNGUANDIAOCHA");
		set.add("t_CUNZHUANGCJ");
		set.add("t_EFORM_ATTACH");
		set.add("t_EFORM_ROLEACTION");
		set.add("t_EFORM_ROLEMODULE");
		set.add("t_EFORM_SYSTEMROLE");
		set.add("t_GCD_USER");
		set.add("t_HUJISHOURULAIYUAN");
		set.add("t_JIBENQINGKYUSHOURULAIYUAN");
		set.add("t_KEYTABLE");
		set.add("t_LG_WENJUAN");
		set.add("t_NBBFIVE");
		set.add("t_NBBFOUR");
		set.add("t_NBBTHREE");
		set.add("t_NBBTWO");
		set.add("t_NH_JTXX");
		set.add("t_NONGCUN");
		set.add("t_NYHJRYWJ");
		set.add("t_NZJRYDCWJ");
		set.add("t_OA_DICTIONARY_QZC");
		set.add("t_OA_GROUPSLIP");
		set.add("t_OA_YGZ_TYPES");
		set.add("t_OU_DEPARTMENT");
		set.add("t_OU_FORM");
		set.add("t_OU_FORMPERM");
		set.add("t_OU_MODPERM");
		set.add("t_OU_MODULE");
		set.add("t_OU_ONLINEPERSON");
		set.add("t_OU_ORGANIZE");
		set.add("t_OU_PERSON");
		set.add("t_OU_ROLE");
		set.add("t_OU_SUBSYSTEM");
		set.add("t_OU_USER");
		set.add("t_OU_USERROLE");
		set.add("t_PORTAL_TEMPLET");
		set.add("t_WEB_ACCESSLOG");
		set.add("t_WEB_CATALOG");
		set.add("t_WEB_REPOSITORY");
		set.add("t_WEB_SITE");
		set.add("t_WEB_SITEFILE");
		set.add("t_ZT_ZAIJIDIWENJU");
		set.add("t_chunjie_diaocha");
		for (String tableName : set) {

			if (tableName.startsWith("t_")) {
				String fileds = "";
				DBCollection co = db.getCollection(tableName);
				DBObject o = co.findOne();

				if (o != null) {
					for (String s : o.keySet()) {
						if (s.equals("_id"))
							continue;
						fileds += "," + s;
					}
				}
				if (fileds.length() > 1) {
					fileds = fileds.substring(1);
					String comad = "C:\\\"Program Files\"\\MongoDB\\Server\\3.2\\bin\\mongoexport -d datamanage -c "
							+ tableName
							+ "  -f "
							+ fileds
							+ " --type=csv -o d:\\mongodatabak\\guanchadian\\"
							+ tableName + ".csv";

					Process p = Runtime.getRuntime().exec(
							"cmd /c start " + comad);
					p.waitFor();
					System.out.println(p.toString());
				}
			}
		}
	}

	private static DB getDB() {
		Mongo mongo;
		try {
			// mongo = new Mongo("192.168.102.131", 27017);
			mongo = new Mongo("localhost", 27017);
			DB db = mongo.getDB("datamanage");
			return db;
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}