package com.dm.newtopic.service;

/**
 * SmartVillage service
 *
 * @author luotuan - Luotuan
 * @version v1.0
 * @date 2021/3/31
 * @since v1.0
 */
public interface SmartVillageService {
    /**
     * ignore
     * @param searchType Enum
     * @param countyName qu名
     * @param townName zhen名
     * @param villageName 村名
     * @param searchTime 2017 - 2020
     * @return ignore
     */
    Object initSearch(String searchType, String countyName, String townName, String villageName, String searchTime);
}
