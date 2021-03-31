package com.dm.newtopic.service;

/**
 * 类的说明
 *
 * @author luotuan - Luotuan
 * @version v1.0
 * @date 2021/3/5
 * @since v1.0
 */
public interface CunQingService {
    /**
     * 获取最新动态，form 经典案例表
     * @return 数据
     * @param cunName 村名
     * @param countyName 区名
     */
    Object getNewestDynamic(String cunName, String countyName);

    /**
     * 搜索区名
     * @param searchVal 关键词
     * @return 结果集
     */
    Object getCountyName(String searchVal);

    /**
     * 获取村名
     * @param cunName 村名关键词
     * @param countyName 区县
     * @return 结果
     */
    Object getCunName(String cunName, String countyName);

    Object getCunNameNew(String zhenName, String quName);

    Object getZhenName(String searchVal);
}
