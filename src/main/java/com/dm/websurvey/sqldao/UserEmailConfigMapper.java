package com.dm.websurvey.sqldao;

import java.util.List;

import com.dm.websurvey.model.UserEmailConfig;

public interface UserEmailConfigMapper {
    int deleteByPrimaryKey(String id);

    int insert(UserEmailConfig record);

    int insertSelective(UserEmailConfig record);

    UserEmailConfig selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserEmailConfig record);

    int updateByPrimaryKey(UserEmailConfig record);
    
    List<UserEmailConfig> findByUserId(String userId);
    
    void deleteByUserId(String userId);
}