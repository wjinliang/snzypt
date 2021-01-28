/**
 * 
 */
package com.dm.atform.enumpack;

/**
 * @author Luotuan
 *
 */
public enum NongQingResEnum {
	/**
	 * 企业名称
	 */
	SEARCH_TYPE_ENTERPRISE_NAME("name"),
	
	/**
	 * 企业地址
	 */
	SEARCH_TYPE_ENTERPRISE_ADDR("addr"),
	
	/**
	 * 基地名称
	 */
	SEARCH_TYPE_BASE_NAME("base"),
	
	/**
	 * 农作物类型
	 */
	SEARCH_TYPE_PLANT_TYPE("plant"),
	
	/**
	 * null类型
	 */
	NULL("null"),
	
	/**
	 * 地块总面积
	 */
	TUN_MU("tunMu"),
	/**
	 * 农场总数
	 */
	FARM_TOTAL("farmTotal");
	
	/**
     * code
     */
    private final String code;
    
    NongQingResEnum(String code) {
    	this.code = code;
    }
    
    public String code() {
        return this.code;
    }
    
    /*
     * 匹配
     * */
     public static NongQingResEnum matchOpCode(String param) {
         for (NongQingResEnum opCode : NongQingResEnum.values()) {
             if (opCode.code().equalsIgnoreCase(param)) {
                 return opCode;
             }
         }
         return NongQingResEnum.NULL;
     }
}
