package com.dm.importmanage.utils;

public class StringUtils {
	//对应导入的字段fields
	public static String[] getStrings(String fields){
		String[] strings = fields.split(",");
		return strings;
		
	}
	//对应的是列的标号indexs
	public static int[] getInts(String index) {
		 String[] strings = index.split(",");
		 int[] indexs = new int[strings.length]; 
		 for(int i = 0;i<strings.length;i++){  
			 indexs[i] = Integer.parseInt(strings[i]);  
		 }  
		 return indexs; 
	} 
	public static void main(String[] args) {
		String string="1,2,5,6,7";
		System.out.println(string);
		String[] strings = getStrings(string);
		for (int i = 0; i < strings.length; i++) {
			System.out.println(strings[i]+"哈哈");
			
		}
		int[] ints = getInts("1,2,3");
		for (int i = 0; i < ints.length; i++) {
			System.out.println(ints[i]);
		}
		
	}

}
