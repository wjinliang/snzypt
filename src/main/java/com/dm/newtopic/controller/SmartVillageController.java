package com.dm.newtopic.controller;

import com.dm.app.util.judge.StringUtils;
import com.dm.newtopic.service.SmartVillageService;
import com.dm.platform.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 类的说明
 *
 * @author luotuan - Luotuan
 * @version v1.0
 * @date 2021/3/30
 * @since v1.0
 */
@Controller
@RequestMapping("/portal")
public class SmartVillageController {
    @Autowired
    private SmartVillageService service;

    /**
     * 智慧乡村查询接口
     *
     * @param searchType Enum
     * @param countyName qu名
     * @param townName zhen名
     * @param villageName 村名
     * @param searchTime 2017 - 2020
     * @return 结果
     */
    @RequestMapping("/smartVillage/doSearch")
    @ResponseBody
    public Object initSearch(String searchType, String countyName, String townName, String villageName, String searchTime) {
        if (StringUtils.isBlank(searchType) || StringUtils.isBlank(villageName)) {
            return ResponseUtil.error("查询类型和村名必须选择");
        }
        return service.initSearch(searchType, countyName, townName, villageName, searchTime);
    }
}
