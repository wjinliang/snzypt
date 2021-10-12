package com.dm.atform.controller;

import com.dm.atform.service.GlobalSearchService;
import com.dm.platform.util.ResponseUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 类的说明
 *
 * @author ASUS - Luotuan
 * @version v1.0
 * @date 2021/10/11
 * @since v1.0
 */
@Controller
@RequestMapping("/portal")
public class GlobalSearchController {
    @Autowired
    private GlobalSearchService searchService;

    @RequestMapping(value = "/search/globalSearch", method = {RequestMethod.GET})
    @ResponseBody
    public Object getZhenName(String param) {
        if (StringUtils.isBlank(param)) {
            return ResponseUtil.error("搜索内容不可为空");
        }
        return searchService.doSearch(param);
    }
}
