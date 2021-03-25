/**
 * 
 */
package com.dm.newtopic.enums;

/**
 * @author Luotuan
 *
 */
public enum XiuXianNongYeResEnum {
	/**
	 * 企业名称
	 */
	SEARCH_TYPE_NAME("name"),

	/**
	 * 按地区搜索
	 */
	SEARCH_TYPE_AREA("area"),

	/**
	 * null类型
	 */
	NULL("null");


	/**
     * code
     */
    private final String code;

    XiuXianNongYeResEnum(String code) {
    	this.code = code;
    }
    
    public String code() {
        return this.code;
    }
    
    /*
     * 匹配
     * */
     public static XiuXianNongYeResEnum matchOpCode(String param) {
         for (XiuXianNongYeResEnum opCode : XiuXianNongYeResEnum.values()) {
             if (opCode.code().equalsIgnoreCase(param)) {
                 return opCode;
             }
         }
         return XiuXianNongYeResEnum.NULL;
     }
}
