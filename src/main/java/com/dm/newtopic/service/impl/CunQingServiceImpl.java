package com.dm.newtopic.service.impl;

import com.dm.newtopic.service.CunQingService;
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
import java.util.Map;

/**
 * 类的说明
 *
 * @author luotuan - Luotuan
 * @version v1.0
 * @date 2021/3/5
 * @since v1.0
 */
@Service
public class CunQingServiceImpl implements CunQingService {

    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public Object getNewestDynamic(String cunName, String countyName) {
        countyName = countyName.replace("区", "");
        countyName = countyName.replace("县", "");
        cunName = cunName.replace("村", "");
        cunName = cunName.replace("屯", "");
        cunName = cunName.replace("庄", "");

        final HashMap<String, Object> resMap = new HashMap<>(4);
        // 获取 im_zhxc_jdal 获取随即一条经典案例
        final ArrayList<DBObject> newestDynamics = new ArrayList<>(16);
        mongoTemplate.executeQuery(new Query(Criteria.where("dyxc").regex("" + cunName)), "im_zhxc_jdal", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                newestDynamics.add(dbObject);
            }
        });
        // 如果村名的信息没有关联到 以区县名称再次搜索。
        if (newestDynamics.size() < 1) {
            mongoTemplate.executeQuery(new Query(Criteria.where("dyxc").regex("" + countyName)), "im_zhxc_jdal", new DocumentCallbackHandler() {
                @Override
                public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                    newestDynamics.add(dbObject);
                }
            });
        }
        // 如果还是没得任何经典案例
        resMap.put("newestDynamics", newestDynamics);

        // 航拍数据 也就是视频 w_aerialPhotographyInfos
        final Map<String, DBObject> areaEnterprises = new HashMap<>(16);
        Query query = new Query(Criteria.where("area").is(countyName));
        mongoTemplate.executeQuery(query, "im_nqqyfb", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                // 统计公司数量
                areaEnterprises.put((String) dbObject.get("enterperiseId"), dbObject);
            }
        });
        final ArrayList<DBObject> aerialPhotographyInfos = new ArrayList<>();
        mongoTemplate.executeQuery(new Query(Criteria.where("enterpriseId").in(areaEnterprises.keySet())), "w_aerialPhotographyInfos", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                aerialPhotographyInfos.add(dbObject);
            }
        });
        resMap.put("aerialPhotographyInfos", aerialPhotographyInfos);

        // 全景图信息  db: im_zhxc_qj720
        final ArrayList<DBObject> quanJingPhotos = new ArrayList<>();
        Query queryQuanJing = new Query(Criteria.where("szq").is(countyName).orOperator(Criteria.where("szcm").regex(cunName), Criteria.where("szz").regex(cunName)));
        mongoTemplate.executeQuery(queryQuanJing, "im_zhxc_qj720", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                quanJingPhotos.add(dbObject);
            }
        });
        /*
        Query: { "szq" : "密云" , "szcm" : { "$regex" : "西田各"} , "$or" : [ { "szz" : { "$regex" : "西田各"}}]}, Fields: null, Sort: null
         */
        resMap.put("quanJingPhotos", quanJingPhotos);

        // 乡村基本信息 im_zhxc_xcjbxx 最美乡村
        final ArrayList<DBObject> villageBaseInfos = new ArrayList<>();
        // Criteria.where("cmyqm").is(cunName)
        Query cmyqm = new Query(Criteria.where("dz").regex(cunName).orOperator(Criteria.where("cmyqm").regex(cunName)));
        mongoTemplate.executeQuery(cmyqm, "im_zhxc_xcjbxx", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                villageBaseInfos.add(dbObject);
            }
        });
        resMap.put("villageBaseInfos", villageBaseInfos);

        // 休闲农业： 民俗旅游m_ZH_MSLY_JBXX、观光农业m_ZH_GGNYSFY_JBXX、休闲农业园区im_qsxxnyyqplbzsjcjb、星级园区cms_hi_xingjiyuanqu
        // 1\民俗旅游 im_qsmslyccjb im_bjsmslyhplbzsjcjb im_qsmslycplbzsjcjb
        final ArrayList<DBObject> minSu = new ArrayList<>();
//        mongoTemplate.executeQuery(new Query(Criteria.where("qxtown").regex(countyName).and("shmcpoi_name").regex(cunName)), "im_qsmslyccjb", new DocumentCallbackHandler() {
//            @Override
//            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
//                minSu.add(dbObject);
//            }
//        });

        mongoTemplate.executeQuery(new Query(Criteria.where("qxtown").regex(countyName).and("xxdzpoi_address").regex(cunName)), "im_bjsmslyhplbzsjcjb", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                minSu.add(dbObject);
            }
        });
        resMap.put("xiuXianNongYe_MinSu", minSu);
        // 2、观光农业 m_ZH_GGNYSFY_JBXX
        mongoTemplate.executeQuery(new Query(Criteria.where("QX_MC").regex(countyName).and("DZ").regex(cunName)), "m_ZH_GGNYSFY_JBXX", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                resMap.put("xiuXianNongYe_GGNY", dbObject);
            }
        });

        // 特色产业：特产s_ycyp_tc、特产乡村s_ycyp_xc、乡村美食cms_ycyp_shier、百家精品特色民宿im_t_baijia
        return ResponseUtil.success(resMap);
    }

    @Override
    public Object getCountyName(String searchVal) {
        final ArrayList<Object> res = new ArrayList<>();
        mongoTemplate.executeQuery(new Query(Criteria.where("SZ_QX").regex("" + searchVal)), "m_ST_REG_COUNTY", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                res.add(dbObject);
            }
        });
        return ResponseUtil.success(res);
    }

    @Override
    public Object getCunName(String cunName, String countyName) {
        final ArrayList<Object> res = new ArrayList<>();
        mongoTemplate.executeQuery(new Query(Criteria.where("SZ_XZC").regex("" + cunName).and("SZ_QX").regex(countyName)), "m_ST_REG_VILLAGE", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                res.add(dbObject);
            }
        });
        return ResponseUtil.success(res);
    }

    @Override
    public Object getCunNameNew(String zhenName, String quName) {
        quName = quName.replace("区", "");
        quName = quName.replace("县", "");
        final ArrayList<Object> res = new ArrayList<>();
        Query query = new Query(Criteria.where("SZ_XZ").regex(zhenName).and("SZ_QX").regex(quName));
        mongoTemplate.executeQuery(query, "m_ST_REG_VILLAGE", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                res.add(dbObject);
            }
        });
        return ResponseUtil.success(res);
    }

    @Override
    public Object getZhenName(String searchVal) {
        searchVal = searchVal.replace("区", "");
        searchVal = searchVal.replace("县", "");
        final ArrayList<Object> res = new ArrayList<>();
        mongoTemplate.executeQuery(new Query(Criteria.where("SZ_QX").regex(searchVal)), "m_ST_REG_TOWN", new DocumentCallbackHandler() {
            @Override
            public void processDocument(DBObject dbObject) throws MongoException, DataAccessException {
                res.add(dbObject);
            }
        });
        return ResponseUtil.success(res);
    }
}
