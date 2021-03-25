package com.dm.newtopic.service.impl;

import com.dm.atform.enumpack.NongQingResEnum;
import com.dm.newtopic.enums.XiuXianNongYeResEnum;
import com.dm.newtopic.service.XiuXianNongYeService;
import com.dm.platform.util.ResponseUtil;
import com.mongodb.DBObject;
import com.mongodb.MongoException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.mongodb.core.DocumentCallbackHandler;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * XiuXianNongYeService impl
 *
 * @author luotuan - Luotuan
 * @version v1.0
 * @date 2021/3/23
 * @since v1.0
 */
@Service
public class XiuXianNongYeServiceImpl implements XiuXianNongYeService {

    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public Object getResultFormMongo(String areaCode, String searchParam, String year, String searchType) {
        // 结果
        HashMap<String, Object> resMap = new HashMap<>(16);
        switch (XiuXianNongYeResEnum.matchOpCode(searchType)) {
            case SEARCH_TYPE_NAME:
                // 带 keyword 查询
                if (StringUtils.isBlank(searchParam)) {
                    resMap.put("error", "关键词为空。");
                    return ResponseUtil.error("关键词不能为空");
                }
                handleAreaSearch(areaCode, resMap, searchParam);
                break;
            case SEARCH_TYPE_AREA:
                // 位置区域查询 查询
                handleAreaSearch(areaCode, resMap, "");
                break;
            default:
                System.out.println(NongQingResEnum.matchOpCode(searchType));
                break;
        }

        return ResponseUtil.success(resMap);
    }

    /**
     * 进行数据库查询
     * @param areaCode 地区
     * @param resMap 结果集
     * @param key 关键词
     */
    private void handleAreaSearch(String areaCode, HashMap<String, Object> resMap, String key) {
        // 格式化words
        areaCode = areaCode.replace("区", "");
        areaCode = areaCode.replace("县", "");
        key = key.replace("村", "");
        key = key.replace("屯", "");
        key = key.replace("庄", "");

        System.out.println(areaCode);
        final HashMap<String, DBObject> areaEnterprises = new HashMap<>();

        Query query = new Query(Criteria.where("area").is(areaCode));
        mongoTemplate.executeQuery(query, "im_nqqyfb", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                // 统计公司数量
                areaEnterprises.put((String) dbObject.get("enterperiseId"), dbObject);
            }
        });

        final Map<String, DBObject> tunInfos = new HashMap<>(16);
        // 分区
        final Map<String, DBObject> parInfos = new HashMap<>(16);
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
        double totalLandArea = 0;
        // 实际种植作物种类id
        for (final String tunId : tunInfos.keySet()) {
            totalLandArea += Double.parseDouble((String) tunInfos.get(tunId).get("tunMu"));
        }
        // 涉农用地
        resMap.put("totalLandArea", Math.ceil(totalLandArea));
        // 农业用地块数量
        resMap.put("agriculturalLandCount", tunInfos.keySet().size());
        resMap.put("enterpriseCount", areaEnterprises.keySet().size());

        // s_mlxc_zmxc 最美乡村
        final ArrayList<DBObject> zmxcArr = new ArrayList<>();
        Criteria name = Criteria.where("name").regex(areaCode);
        if (StringUtils.isNotBlank(key)) {
            name.orOperator(Criteria.where("name").regex(key));
        }
        Query queryZmxc = new Query(name);
        mongoTemplate.executeQuery(queryZmxc, "s_mlxc_zmxc", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                zmxcArr.add(dbObject);
            }
        });
        resMap.put("zmxc", zmxcArr.size());

        // 民俗村 im_qsmslycplbzsjcjb
        final List<DBObject> mscArr = new ArrayList<>();
        Criteria regexMsc = Criteria.where("qxtown").regex(areaCode);
        if (StringUtils.isNotBlank(key)) {
            regexMsc.and("shmcpoi_name").regex(key);
        }
        Query queryMsc = new Query(regexMsc);
        mongoTemplate.executeQuery(queryMsc, "im_qsmslycplbzsjcjb", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                mscArr.add(dbObject);
            }
        });
        resMap.put("msc", mscArr.size());

        // 民俗户 im_bjsmslyhplbzsjcjb
        final List<DBObject> mshArr = new ArrayList<>();
        Criteria regexMsh = Criteria.where("qxtown").regex(areaCode);
        if (StringUtils.isNotBlank(key)) {
            regexMsc.and("shmcpoi_name").regex(key);
        }
        Query queryMsh = new Query(regexMsh);
        mongoTemplate.executeQuery(queryMsh, "im_bjsmslyhplbzsjcjb", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                mshArr.add(dbObject);
            }
        });
        resMap.put("msh", mshArr.size());

        // 星级园区 cms_hi_xingjiyuanqu
        final List<DBObject> xjyqArr = new ArrayList<>();
        Query queryXjyq = new Query(Criteria.where("title").regex(areaCode).
                orOperator(Criteria.where("content").regex(areaCode), Criteria.where("content_html").regex(areaCode)));
        mongoTemplate.executeQuery(queryXjyq, "cms_hi_xingjiyuanqu", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                xjyqArr.add(dbObject);
            }
        });
        resMap.put("xjyq", xjyqArr.size());

        // 精品民宿 im_t_baijia
        final List<DBObject> baijiaArr = new ArrayList<>();
        Query queryBaijia = new Query(Criteria.where("quxian").regex(areaCode));
        mongoTemplate.executeQuery(queryBaijia, "cms_hi_xingjiyuanqu", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                baijiaArr.add(dbObject);
            }
        });
        resMap.put("bjms", baijiaArr.size());
    }
}
