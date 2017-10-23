package com.dm.atform.util;

import org.apache.commons.lang.StringUtils;

public class CODEUtil {
	/**
	 * 
	 * @param pcode 父级编码  可以为null
	 * @param lastCode 同级最大编码 可以为null
	 * @return
	 */
	public static String nextCode(String pcode,String lastCode){
		if(StringUtils.isBlank(pcode)){
			try{
			return next(lastCode);
			}catch(Exception e){
				return "01";
			}
		}
		if(Character.isDigit(pcode.charAt(0))){
			return pcode+"01";
		}
		return pcode+"AA";
	}
	
	
	private static String next(String code){
		String next="00";
		char[] chararr = code.toCharArray();
		if(Character.isDigit(chararr[0])){//是数字
			char ch1 = chararr[chararr.length-2];
			char ch2 = chararr[chararr.length-1];
			next = next+(Integer.valueOf(""+ch1+ch2)+1);
			return code.substring(0,chararr.length-2)+next.substring(next.length()-2,next.length());
		}
		char ch1 = chararr[chararr.length-2];
		char ch2 = chararr[chararr.length-1];
		if(ch2=='Z'){
			chararr[chararr.length-1]='A';
			chararr[chararr.length-2]=(char)(ch1+1);
			return new String(chararr);
		}
		chararr[chararr.length-1]=(char)(ch2+1);
		return new String(chararr);
	}

}
