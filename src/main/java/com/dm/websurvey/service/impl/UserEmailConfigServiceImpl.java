package com.dm.websurvey.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dm.platform.util.UUIDUtils;
import com.dm.websurvey.model.UserEmailConfig;
import com.dm.websurvey.service.UserEmailConfigService;

@Service
public class UserEmailConfigServiceImpl implements UserEmailConfigService{

	@Autowired
	com.dm.websurvey.sqldao.UserEmailConfigMapper userEmailConfigMapper;
	 
	@Override
	public void addOrUpdate(String userId, String leadIds, String orgIds,String isShowIp) {
		// TODO Auto-generated method stub
		List<UserEmailConfig> config =  userEmailConfigMapper.findByUserId(userId);
        if(config.size()>0)
        {
          UserEmailConfig userEmailConfig = config.get(0);
          userEmailConfig.setLeaderId(leadIds);
          userEmailConfig.setOrgId(orgIds);
          userEmailConfig.setIsShowIp(isShowIp);
          if(StringUtils.isEmpty(leadIds) && StringUtils.isEmpty(orgIds))
          {
        	  userEmailConfigMapper.deleteByPrimaryKey(config.get(0).getId());
          }
          else{
        	  userEmailConfigMapper.updateByPrimaryKey(userEmailConfig);
          }
        }
        else
        {
		UserEmailConfig userEmailConfig = new UserEmailConfig();
		userEmailConfig.setId(UUIDUtils.getUUID16());
		userEmailConfig.setLeaderId(leadIds);
		userEmailConfig.setOrgId(orgIds);
		userEmailConfig.setUserId(userId);
		userEmailConfigMapper.insert(userEmailConfig);
        }
	}

	@Override
	public UserEmailConfig findByUserId(String userId) {
		// TODO Auto-generated method stub
		
		List<UserEmailConfig> userEmailConfigs = userEmailConfigMapper.findByUserId(userId);
		if(userEmailConfigs.size()>0)
		{
			return userEmailConfigs.get(0);
		}
		UserEmailConfig config =  new UserEmailConfig();
		config.setUserId(userId);
		return config;
	}

}
