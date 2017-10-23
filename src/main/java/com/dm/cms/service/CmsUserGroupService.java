package com.dm.cms.service;

import java.util.List;

import com.dm.cms.model.CmsUserGroup;
import com.dm.cms.model.TreeNode;
import com.github.pagehelper.PageInfo;


/**
 * 
 * @project com.dm.cms.service.UserGroupService.java
 * @author wjl
 * @createdate 2015年12月7日 下午12:55:17
 */
public interface CmsUserGroupService {
	
	PageInfo<?> findUserGroupByPage(Integer pageNum, Integer pageSize,
			CmsUserGroup userGroup);
	/**
	 * 返回所有用户
	 * @return
	 */
	List<TreeNode> findAllUserTreeNode();
	/**
	 * 返回所有站点频道
	 * @return
	 */
	List<com.dm.platform.dto.TreeNode> findAllSiteChannelTreeNode();
	/**
	 * 返回用户组信息  
	 * @param groupId
	 * @return
	 */
	Object findOneById(String groupId);
	/**
	 * 更新
	 * @param userGroup
	 */
	void updateUserGroup(CmsUserGroup userGroup);
	/**
	 * 插入
	 * @param userGroup
	 */
	void insertUserGroup(CmsUserGroup userGroup);
	/**
	 * 批量删除
	 * @param ids 1 或者1,2,3字符串
	 * @return
	 */
	int delete(String ids);

}
