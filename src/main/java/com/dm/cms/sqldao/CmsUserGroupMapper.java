package com.dm.cms.sqldao;

import java.util.List;
import java.util.Map;

import com.dm.cms.model.CmsUserGroup;

public interface CmsUserGroupMapper {
	int deleteByPrimaryKey(String id);

	int insert(CmsUserGroup record);

	int insertSelective(CmsUserGroup record);

	CmsUserGroup selectByPrimaryKey(String id);

	int updateByPrimaryKeySelective(CmsUserGroup record);

	int updateByPrimaryKey(CmsUserGroup record);

	List<CmsUserGroup> selectRecordsByArgMap(Map map);

	/**
	 * 批量删除用户组
	 * 
	 * @param list
	 * @return
	 */
	int deleteByIds(List<String> list);

	/**
	 * 查询关联的用户
	 */
	List<String> selectUsersByGroupId(String groupId);

	/**
	 * 插入用户关联
	 * 
	 * @param map
	 * @return
	 */
	int insertGroupUser(List<Map> map);

	/**
	 * 批量删除用户关联
	 * 
	 * @param map
	 *            [{userIds:[1,2,3]},{groupId:1}]
	 * @return
	 */
	int deleteGroupUser(Map map);
	/**
	 * 批量删除用户关联 
	 * @param groupIds
	 * @return
	 */
	int deleteGroupUserByGroupIds(List<String> list);
	
	int insertGroupSite(List<Map> map);
	int deleteGroupSite(Map map);
	int deleteGroupSiteByGroupIds(List<String> list);
	
	int insertGroupChannel(List<Map> map);
	int deleteGroupChannel(Map map);
	int deleteGroupChannelByGroupIds(List<String> list);

	List<String> selectSitesByGroupId(String groupId);

	List<String> selectChannelByGroupId(String groupId);
	List<String> selectCurrentUserGroupId(String userId);
}