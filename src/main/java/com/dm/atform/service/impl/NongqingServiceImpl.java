package com.dm.atform.service.impl;

import java.util.*;

import com.dm.platform.util.ResponseUtil;
import com.mongodb.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.mongodb.core.DocumentCallbackHandler;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.dm.atform.enumpack.NongQingResEnum;
import com.dm.atform.service.MongoService;
import com.dm.atform.service.NongqingService;

@Service
public class NongqingServiceImpl implements NongqingService {

    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public Object getResultFormMongo(String areaCode, String searchParam, String year, String searchType) {
        System.out.println("param:areaCode=" + areaCode + ";searchParam=" + searchParam + ";year=" + year + ";searchType=" + searchType);
        // 结果体。用Map作为VO
        HashMap<String, Object> resMap = new HashMap<>(16);
        // 农场数量
        // 搜索框搜索类型约束了公司名或者公司地址且搜索框不为空
        if (
                (searchType.equals(NongQingResEnum.SEARCH_TYPE_ENTERPRISE_NAME.code())
                        || searchType.equals(NongQingResEnum.SEARCH_TYPE_ENTERPRISE_ADDR.code())
                        || searchType.equals(NongQingResEnum.SEARCH_TYPE_AREA.code())
                )
                        && StringUtils.isNotBlank(searchParam)) {
            switch (NongQingResEnum.matchOpCode(searchType)) {
                case SEARCH_TYPE_ENTERPRISE_NAME:
                    // 企业名称 查询
                    if (StringUtils.isBlank(searchParam)) {
                        resMap.put("error", "企业名称为空。");
                        return ResponseUtil.error("企业名称不能为空");
                    }
                    handleEnterpriseNameSearchType(searchParam, resMap);
                    break;
                case SEARCH_TYPE_AREA:
                    // 位置区域查询 查询
                    handleAreaSearchTypeMethodTwo(searchParam, resMap);
                    break;
                default:
                    System.out.println(NongQingResEnum.matchOpCode(searchType));
                    break;
            }
        } else {
            return ResponseUtil.error("搜索内容为空");
        }
        return ResponseUtil.success(resMap);
    }

    /**
     * 企业名称模糊查询
     * @param searchParam 名称
     * @param resMap 结果集
     */
    private void handleEnterpriseNameSearchType(String searchParam, HashMap<String, Object> resMap) {
        // w_enterprises like
        final HashMap<String, DBObject> enterprises = new HashMap<>(16);
        mongoTemplate.executeQuery(new Query(Criteria.where("enterpriseName").regex(""+searchParam+"")), "w_enterprises", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                enterprises.put((String) dbObject.get("enterpriseId"), dbObject);
            }
        });
        searchResult(resMap, enterprises);
    }

    /**
     * 优化的查询方法，使用in查询速度更快 大约130ms左右 is 则类似多次连接数据库操作，需要70000+ms
     * @param searchParam 入参
     * @param resMap 结果集
     */
    private void handleAreaSearchTypeMethodTwo(String searchParam, HashMap<String, Object> resMap) {
        // "area", searchParam.replace("区", "")
        // 企业表
        final HashMap<String, DBObject> areaEnterprises = new HashMap<>();

        Query query = new Query(Criteria.where("area").is(searchParam.replace("区", "")));
        mongoTemplate.executeQuery(query, "im_nqqyfb", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                // 统计公司数量
                areaEnterprises.put((String)dbObject.get("enterperiseId"), dbObject);
            }
        });
        searchResult(resMap, areaEnterprises);
    }

    private void searchResult(HashMap<String, Object> resMap, HashMap<String, DBObject> areaEnterprises) {
        final HashMap<String, DBObject> baseInfos = new HashMap<>(16);
        // 摄像头
        final HashSet<DBObject> sensorInfos = new HashSet<>();
        // 气象站
        final HashSet<DBObject> weatherStationInfos = new HashSet<>();
        // 分区
        final Map<String, DBObject> parInfos = new HashMap<>(16);
        // 地块
        final Map<String, DBObject> tunInfos = new HashMap<>(16);
        mongoTemplate.executeQuery(new Query(Criteria.where("enterpriseId").in(areaEnterprises.keySet())), "w_baseInfo", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                String baseId = (String) dbObject.get("baseId");
                baseInfos.put(baseId, dbObject);
            }
        });
        // 统计摄像头数量
        mongoTemplate.executeQuery(new Query(Criteria.where("baseId").in(baseInfos.keySet())), "w_baseSensorInfo", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                sensorInfos.add(dbObject);
            }
        });
        // 气象站数量
        mongoTemplate.executeQuery(new Query(Criteria.where("baseId").in(baseInfos.keySet())), "w_baseWeatherStationInfo", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                weatherStationInfos.add(dbObject);
            }
        });
        // 分区信息
        mongoTemplate.executeQuery(new Query(Criteria.where("enterpriseId").in(areaEnterprises.keySet())), "w_baseParInfo", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                String parId = (String) dbObject.get("parId");
                parInfos.put(parId, dbObject);
            }
        });
        // 分区下的地块
        mongoTemplate.executeQuery(new Query(Criteria.where("parId").in(parInfos.keySet())), "w_baseTunInfo", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                tunInfos.put((String) dbObject.get("tunId"), dbObject);
            }
        });
        // 该区域涉农企业总数
        resMap.put("enterprisesTotalCount", areaEnterprises.size());
        // 总土地面积
        double totalLandArea = 0;
        // 实际种植作物种类id
        final HashSet<String> realPlants = new HashSet<>();
        final HashSet<String> realPlantsTunId = new HashSet<>();
        for (final String tunId : tunInfos.keySet()) {
            totalLandArea += Double.parseDouble((String) tunInfos.get(tunId).get("tunMu"));
        }
        mongoTemplate.executeQuery(new Query(Criteria.where("tunId").in(tunInfos.keySet())), "w_realPlantInfoo", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                realPlants.add((String) dbObject.get("realPlantId"));
                realPlantsTunId.add((String) dbObject.get("tunId"));
            }
        });
        System.out.println(realPlants.size());
        System.out.println(realPlantsTunId.size());
        // 涉农用地
        resMap.put("totalLandArea", Math.ceil(totalLandArea));
        // 农业用地块数量
        resMap.put("agriculturalLandCount", tunInfos.keySet().size());
        double parAllMu = 0;
        for (String parId : parInfos.keySet()) {
            parAllMu += Double.parseDouble((String) parInfos.get(parId).get("parMu"));
        }
        resMap.put("parAllMu", Math.ceil(parAllMu));
        // 农场数量
        resMap.put("farmsCount", baseInfos.size());
        // 当前种植面积
        double newestPlantMu = 0;
        for (String tunId : realPlantsTunId) {
            newestPlantMu += Double.parseDouble((String) tunInfos.get(tunId).get("tunMu"));
        }
        resMap.put("newestPlantMu", Math.ceil(newestPlantMu));
        // 可种植面积
        resMap.put("plantMuAvailable", Math.floor(totalLandArea - newestPlantMu));
        // 地块数量
        resMap.put("tunCount", tunInfos.size());
        // 传感器数量
        resMap.put("sensorsCount", sensorInfos.size());
        // 气象站数量
        resMap.put("weatherStationsCount", weatherStationInfos.size());
        // 种植种类数量
        resMap.put("plantKinds", realPlants.size());
    }
}
