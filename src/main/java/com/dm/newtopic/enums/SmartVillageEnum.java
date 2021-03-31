package com.dm.newtopic.enums;

/**
 * @author Luotuan
 *
 */
public enum SmartVillageEnum {
	/**
	 * 720全景
	 */
    PANORAMA_720("720"),

	/**
	 * 经典案例
	 */
    CLASSIC_CASE("classic"),

	/**
	 * 网站查询
	 */
    WEBSITE("web"),

	/**
	 * 公众号
	 */
    GONG_ZHONG("weixin"),

	/**
	 * 公众号
	 */
    ONLINE_SHOP("shop"),

	/**
	 * null类型
	 */
	NULL("null");


	/**
     * code
     */
    private final String code;

    SmartVillageEnum(String code) {
    	this.code = code;
    }
    
    public String code() {
        return this.code;
    }
    
    /*
     * 匹配
     * */
     public static SmartVillageEnum matchOpCode(String param) {
         for (SmartVillageEnum opCode : SmartVillageEnum.values()) {
             if (opCode.code().equalsIgnoreCase(param)) {
                 return opCode;
             }
         }
         return SmartVillageEnum.NULL;
     }
}
