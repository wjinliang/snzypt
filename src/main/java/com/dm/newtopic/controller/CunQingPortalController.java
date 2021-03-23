package com.dm.newtopic.controller;

import com.dm.atform.service.AtFieldService;
import com.dm.atform.service.AtTableService;
import com.dm.atform.service.MongoService;
import com.dm.atform.service.NongqingService;
import com.dm.cms.service.CmsSiteService;
import com.dm.newtopic.service.CunQingService;
import com.dm.platform.service.LogService;
import com.dm.platform.util.ResponseUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Luotuan
 */
@Controller
@RequestMapping("/portal")
public class CunQingPortalController {

    @Autowired
    private CunQingService cunQingService;

    /**
     * 获取经典案例
     * @param cunName 村名
     * @return 结果
     */
    @RequestMapping("/cunQing/newestDynamic")
    @ResponseBody
    public Object newestDynamic(String cunName, String countyName) {

        return cunQingService.getNewestDynamic(cunName, countyName);
    }
    /**
     * 区县查询
     * @param searchVal ignore
     * @return 结果
     */
    @RequestMapping(value = "/cunQing/getCountyName", method = {RequestMethod.GET})
    @ResponseBody
    public Object getCountyName(String searchVal) {

        return cunQingService.getCountyName(searchVal);
    }

    /**
     * 获取村名
     * @param cunName ignore
     * @param countyName 区县名称
     * @return 结果
     */
    @RequestMapping(value = "/cunQing/getCunName", method = {RequestMethod.GET})
    @ResponseBody
    public Object getCunName(String cunName, String countyName) {

        return cunQingService.getCunName(cunName, countyName);
    }
}