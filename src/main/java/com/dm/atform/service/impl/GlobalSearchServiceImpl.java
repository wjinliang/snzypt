package com.dm.atform.service.impl;

import com.dm.atform.model.AtTable;
import com.dm.atform.service.GlobalSearchService;
import com.dm.atform.sqldao.GlobalSearchMapper;
import com.dm.platform.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 实现类
 *
 * @author ASUS - Luotuan
 * @version v1.0
 * @date 2021/10/11
 * @since v1.0
 */
@Service
public class GlobalSearchServiceImpl implements GlobalSearchService {
    @Autowired
    private GlobalSearchMapper mapper;

    @Override
    public Object doSearch(String param) {
        List<AtTable> atTables = mapper.globalSearch(param);
        return atTables.size() > 0 ? ResponseUtil.success(atTables) : ResponseUtil.error("暂无数据");
    }
}
