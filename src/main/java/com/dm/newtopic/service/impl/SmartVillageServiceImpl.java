package com.dm.newtopic.service.impl;

import com.dm.newtopic.enums.SmartVillageEnum;
import com.dm.newtopic.service.SmartVillageService;
import com.dm.platform.util.ResponseUtil;
import com.mongodb.DBObject;
import com.mongodb.MongoException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.mongodb.core.DocumentCallbackHandler;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * ignore
 *
 * @author luotuan - Luotuan
 * @version v1.0
 * @date 2021/3/31
 * @since v1.0
 */
@Service
public class SmartVillageServiceImpl implements SmartVillageService {
    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public Object initSearch(String searchType, String countyName, String townName, String villageName, String searchTime) {
        countyName = countyName.replace("区", "");
        countyName = countyName.replace("县", "");
        // 结果
        HashMap<String, Object> resMap = new HashMap<>(16);
        switch (SmartVillageEnum.matchOpCode(searchType)) {
            case WEBSITE:
                handleWebSiteSearch(countyName, townName, villageName, resMap);
                break;
            case GONG_ZHONG:
                handleWeChatSearch(countyName, townName, villageName, resMap);
                break;
            case ONLINE_SHOP:
                handleOnlineShopSearch(countyName, townName, villageName, resMap);
                break;
            case CLASSIC_CASE:
                handleClassicCaseSearch(countyName, townName, villageName, resMap);
                break;
            case PANORAMA_720:
                handlePanoramaSearch(countyName, townName, villageName, resMap);
                break;
            default:
                System.out.println(SmartVillageEnum.matchOpCode(searchType));
                break;
        }

        return ResponseUtil.success(resMap);
    }

    /**
     * 全景图搜索
     * @param countyName 区县
     * @param townName 镇
     * @param villageName 村
     * @param resMap 结果map
     */
    private void handlePanoramaSearch(String countyName, String townName, String villageName, HashMap<String, Object> resMap) {
        townName = townName.replace("乡", "");
        townName = townName.replace("镇", "");
        villageName = villageName.replace("屯", "");
        villageName = villageName.replace("庄", "");
        villageName = villageName.replace("村", "");
        // 全景图信息  db: im_zhxc_qj720
        final ArrayList<DBObject> panoramaPhotos = new ArrayList<>();
        Query queryPanoramaPhotos = new Query(Criteria.where("szq").regex(countyName).and("szz").regex(townName).and("szcm").regex(villageName));
        mongoTemplate.executeQuery(queryPanoramaPhotos, "im_zhxc_qj720", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                panoramaPhotos.add(dbObject);
            }
        });
        resMap.put("panoramaPhotos", panoramaPhotos);
    }

    /**
     * 经典案例
     * @param countyName 区县
     * @param townName 镇
     * @param villageName 村
     * @param resMap 结果map
     */
    private void handleClassicCaseSearch(String countyName, String townName, String villageName, HashMap<String, Object> resMap) {
        final ArrayList<DBObject> classicCases = new ArrayList<>(16);
        Query query = new Query(Criteria.where("dyxc").regex(villageName).andOperator(Criteria.where("dyxc").regex(countyName), Criteria.where("dyxc").regex(townName)));
        mongoTemplate.executeQuery(query, "im_zhxc_jdal", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                classicCases.add(dbObject);
            }
        });
        resMap.put("classicCases", classicCases);
    }

    /**
     * 网店
     * @param countyName 区县
     * @param townName 镇
     * @param villageName 村
     * @param resMap 结果map
     */
    private void handleOnlineShopSearch(String countyName, String townName, String villageName, HashMap<String, Object> resMap) {
    }

    /**
     * 公众号查询
     * @param countyName 区县
     * @param townName 镇
     * @param villageName 村
     * @param resMap 结果map
     */
    private void handleWeChatSearch(String countyName, String townName, String villageName, HashMap<String, Object> resMap) {

    }

    /**
     * 网站查询
     * @param countyName 区县
     * @param townName 镇
     * @param villageName 村
     * @param resMap 结果map
     */
    private void handleWebSiteSearch(String countyName, String townName, String villageName, HashMap<String, Object> resMap) {
        final ArrayList<DBObject> webSite = new ArrayList<>(16);
        mongoTemplate.executeQuery(new Query(Criteria.where("q").regex(countyName).and("z").regex(townName).and("c").regex(villageName)), "im_zhxc_wz", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                webSite.add(dbObject);
            }
        });
        resMap.put("webSite", webSite);
    }
}
