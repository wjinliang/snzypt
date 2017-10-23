package initDivition.init;

import java.lang.reflect.InvocationTargetException;
import java.net.UnknownHostException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.Field; 

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBObject;
import com.mongodb.Mongo;

public class getEntity {
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
	public static void main(String[] args) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		DB db=getDB();
		DBObject dbc=db.getCollection("m_YZ_SCYZC_JYQK").findOne();
		for(String key:dbc.keySet()){
			Object o =dbc.get(key);
			if(o!=null){
				if(!key.equals("_id")&&!key.equals("exchange_time")){
					System.out.println("@Field(\""+key+"\")");
					String a="private " +o.getClass()+" "+getCamel(key)+";";
					if(a.contains("java")){
						a.substring(8,16);
					}
					
					System.out.println(a);
				}
				
			} else{
				System.out.println("@Field(\""+key+"\")");
				System.out.println("private String "+getCamel(key)+";");
			}
		}
	}


	public static String getCamel(String underline) {
		Pattern pattern = Pattern.compile("[_]\\w");
        String camel = underline.toLowerCase();
        Matcher matcher = pattern.matcher(camel);
        while(matcher.find()){
            String w = matcher.group().trim();
            camel = camel.replace(w,w.toUpperCase().replace("_", ""));
        }
		return camel;
	}
	
	public static <T> T dbObject2Bean(DBObject dbObject, T bean)
			throws IllegalAccessException, InvocationTargetException,
			NoSuchMethodException {
		if (bean == null) {
			return null;
		}
		Field[] fields = bean.getClass().getDeclaredFields();
		for (Field field : fields) {
			String varName = field.getName();
			Object object = dbObject.get(varName);
			if (object != null) {
				BeanUtils.setProperty(bean, varName, object);
			}
		}
		return bean;
	}
}
