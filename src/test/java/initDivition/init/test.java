package initDivition.init;

import net.sf.json.JSONArray;

public class test {
	public static void main(String[] args) {
		System.out.println("北京市海淀区西马坊镇西马坊村".replaceAll("乡|镇|地区|村", ".*"));
		
		JSONArray arr = JSONArray.fromObject("[1,2,3]");
		System.out.println(arr);
	}
}
