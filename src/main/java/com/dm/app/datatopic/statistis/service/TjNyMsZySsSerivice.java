package com.dm.app.datatopic.statistis.service;

import java.util.List;

import com.dm.app.datatopic.model.portaltopic.TjNyMsZySs;

/**
 * @description 10-15  农业观光园、民俗旅游、种业和设施农业(2010-2014年)
 * @author huoge
 */
public interface TjNyMsZySsSerivice {
    public List findAll(Class entityClass);
   public TjNyMsZySs findByProperty(String property,String value);
}
