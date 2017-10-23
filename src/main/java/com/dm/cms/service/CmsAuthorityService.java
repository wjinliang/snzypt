package com.dm.cms.service;

import java.util.List;

/**
 * Created by cgj on 2015/12/7.
 */
public interface CmsAuthorityService {

    void insertUserAuthOfCmsSite(String userLoginName, Integer cmsSiteId);

    void deleteUserAuthOfCmsSite(String userLoginName, Integer cmsSiteId);

    boolean hasUserAuthOfCmsSite(String userLoginName, Integer cmsSiteId);

    void updateUserAuthOfCmsSite(String userLoginName, List<Integer> cmsSiteIds);

    void insertUserAuthOfCmsChannel(String userLoginName, Integer cmsChannelId);

    void deleteUserAuthOfCmsChannel(String userLoginName, Integer cmsChannelId);

    boolean hasUserAuthOfCmsChannel(String userLoginName, Integer cmsChannelId);

    void updateUserAuthOfCmsChannel(String userLoginName, List<Integer> cmsChannelId);

}
