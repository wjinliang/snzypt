package com.dm.newtopic.controller;

import com.dm.newtopic.service.XiuXianNongYeService;
import com.dm.platform.util.ResponseUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * new 休闲农业
 *
 * @author luotuan - Luotuan
 * @version v1.0
 * @date 2021/3/23
 * @since v1.0
 */
@Controller
@RequestMapping("/portal")
public class XiuXianNongYeController {

    @Autowired
    private XiuXianNongYeService service;

    @RequestMapping("/xiuxiannongye/search")
    @ResponseBody
    public Object searchXXNY(@RequestParam(required = false) String areaCode, @RequestParam(required = false) String year,
                                @RequestParam(required = false) String searchType, @RequestParam(required = false) String searchParam) {
        if (StringUtils.isBlank(areaCode) && StringUtils.isBlank(searchParam)
                && StringUtils.isBlank(year) && StringUtils.isBlank(searchType)) {
            return ResponseUtil.error("请至少约束一个筛选条件。");
        }

        return service.getResultFormMongo(areaCode, searchParam, year, searchType);

    }
}
