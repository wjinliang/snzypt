package com.dm.cms.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.dm.cms.model.TreeNode;
import com.dm.cms.model.CmsUserGroup;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsSiteService;
import com.dm.cms.service.CmsUserGroupService;
import com.dm.cms.sqldao.CmsUserGroupMapper;
import com.dm.platform.model.UserAccount;
import com.dm.platform.service.UserAccountService;
import com.dm.platform.util.UUIDUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class CmsUserGroupServiceImp implements CmsUserGroupService {
	@Autowired
	CmsUserGroupMapper userGroupMapper;
	@Autowired
	UserAccountService userAccountService;
	@Autowired
	CmsChannelService channelService;
	@Autowired
	CmsSiteService siteService;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public PageInfo<?> findUserGroupByPage(Integer pageNum, Integer pageSize,
			CmsUserGroup userGroup) {
		Map map = new HashMap();
		map.put("model", userGroup);
		PageHelper.startPage(pageNum, pageSize);
		List<CmsUserGroup> list = userGroupMapper.selectRecordsByArgMap(map);
		PageInfo<CmsUserGroup> page = new PageInfo<CmsUserGroup>(list);
		return page;
	}

	@Override
	public List<TreeNode> findAllUserTreeNode() {
		List<TreeNode> userNodes = new ArrayList<TreeNode>();
		List<UserAccount> userList = this.userAccountService.listAllUser();
		for (UserAccount user : userList) {
			TreeNode n = new TreeNode(user);
			userNodes.add(n);
		}
		return userNodes;
	}

	@SuppressWarnings("unused")
	@Override
	public List<com.dm.platform.dto.TreeNode> findAllSiteChannelTreeNode() {
		List<TreeNode> siteNodes = new ArrayList<TreeNode>();
		List<TreeNode> channelNodes = new ArrayList<TreeNode>();
		List<com.dm.platform.dto.TreeNode> channels = this.channelService
				.findCmsChannelTreeNodeWithSiteNode();
		return channels;
	}

	@Override
	public CmsUserGroup findOneById(String groupId) {
		CmsUserGroup userGroup = this.userGroupMapper.selectByPrimaryKey(groupId);
		if (userGroup == null) {
			return null;
		}
		List<String> userIds = userGroupMapper.selectUsersByGroupId(groupId);
		String uids = list2str(userIds);
		List<String> siteIds = userGroupMapper.selectSitesByGroupId(groupId);
		String sids = list2str(siteIds, "-");
		List<String> channelIds = userGroupMapper
				.selectChannelByGroupId(groupId);
		String cids = list2str(channelIds);
		sids = sids.length() > 0 ? (cids.length() > 0 ? sids + "," + cids
				: sids) : cids;
		userGroup.setUserIds(uids);
		userGroup.setSiteIds(sids);
		return userGroup;
	}

	private String list2str(List<String> userIds) {
		StringBuffer ids = new StringBuffer("");
		for (String s : userIds) {
			ids.append("," + s);
		}
		if (ids.length() > 1) {
			return ids.substring(1);
		}
		return "";
	}

	private String list2str(List<String> userIds, String str) {
		StringBuffer ids = new StringBuffer("");
		for (String s : userIds) {
			ids.append("," + str + s);
		}
		if (ids.length() > 1) {
			return ids.substring(1);
		}
		return "";
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void updateUserGroup(CmsUserGroup userGroup) {
		String groupId = userGroup.getId();
		CmsUserGroup oldUserGroup = this.userGroupMapper
				.selectByPrimaryKey(groupId);
		if (oldUserGroup == null) {
			return;
		}
		List<String> userIds = userGroupMapper.selectUsersByGroupId(groupId);
		String uids = list2str(userIds);
		List<String> siteIds = userGroupMapper.selectSitesByGroupId(groupId);
		String sids = list2str(siteIds);
		List<String> channelIds = userGroupMapper
				.selectChannelByGroupId(groupId);
		String cids = list2str(channelIds);
		this.userGroupMapper.updateByPrimaryKey(userGroup);
		/* 维护用户关联 */
		this.updateGroup(groupId, uids, userGroup.getUserIds(), "userId");
		/* 维护站点关系 */
		Map map = SiteAndChannels(userGroup.getSiteIds());
		this.updateGroup(groupId, sids, list2str((List) map.get("slist")),
				"siteId");
		/* 维护频道关系 */
		this.updateGroup(groupId, cids, list2str((List) map.get("clist")),
				"channelId");

	}

	/* 维护用户关联 */
	private void updateGroup(String groupId, String oldIds, String newIds,
			String key) {
		List<String> olist = this.array2List(oldIds.split(","));
		List<String> nlist = this.array2List(newIds.split(","));
		List<String> nlist1 = this.array2List(newIds.split(","));
		nlist.removeAll(olist);
		olist.removeAll(nlist1);
		/* 删除取消的关联 */
		deleteIds(groupId, olist, key);
		/* 添加与用户的关联 */
		addIds(groupId, nlist, key);

	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	private List<String> array2List(String[] arr) {
		List list = new ArrayList();
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] != null && !arr[i].trim().equals(""))
				list.add(arr[i]);
		}
		return list;
	}

	/**
	 * 删除取消的关联
	 * 
	 * @param id
	 * @param olist
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void deleteIds(String id, List<String> list, String key) {
		if (list.size() > 0) {
			Map map = new HashMap();
			map.put(key, list);
			map.put("groupId", id);
			switch (key) {
			case "userId":
				this.userGroupMapper.deleteGroupUser(map);
				break;
			case "siteId":
				this.userGroupMapper.deleteGroupSite(map);
				break;
			case "channelId":
				this.userGroupMapper.deleteGroupChannel(map);
				break;
			default:
				break;
			}
		}

	}

	/**
	 * 添加与的关联
	 * 
	 * @param id
	 * @param userGroup
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void addIds(String groupId, List<String> ids, String key) {
		if (ids.size() > 0) {
			List maps = new ArrayList<Map<String, String>>();
			for (String uid : ids) {
				Map map = new HashMap<String, String>();
				map.put("groupId", groupId);
				map.put(key, uid);
				maps.add(map);
			}
			switch (key) {
			case "userId":
				this.userGroupMapper.insertGroupUser(maps);
				break;
			case "siteId":
				this.userGroupMapper.insertGroupSite(maps);
				break;
			case "channelId":
				this.userGroupMapper.insertGroupChannel(maps);
				break;
			default:
				break;
			}
		}
	}

	@Override
	public void insertUserGroup(CmsUserGroup userGroup) {
		userGroup.setId(UUIDUtils.getUUID16());
		this.userGroupMapper.insert(userGroup);
		/* 添加与用户的关联 */
		List<String> uids = this.array2List(userGroup.getUserIds().split(","));
		addIds(userGroup.getId(), uids, "userId");
		/* 获取站点频道的关联 */
		Map<String, List<String>> map = SiteAndChannels(userGroup.getSiteIds());
		/* 添加站点关联 */
		addIds(userGroup.getId(), map.get("slist"), "siteId");
		/* 添加频道关联 */
		addIds(userGroup.getId(), map.get("clist"), "channelId");
	}

	/**
	 * 分开前台传来的SiteAndChannels
	 * 
	 * @param siteIds
	 * @return map.put("slist", slist); map.put("clist",clist);
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private Map<String, List<String>> SiteAndChannels(String siteIds) {
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		List slist = new ArrayList();
		List clist = new ArrayList();
		if (siteIds != null && !siteIds.trim().equals("")) {
			String[] ids = siteIds.split(",");
			for (int i = 0; i < ids.length; i++) {
				if (ids[i] != null && !ids[i].trim().equals("")) {
					if (ids[i].startsWith("-")) {
						slist.add(ids[i].substring(1));
					} else {
						clist.add(ids[i]);
					}
				}
			}
		}
		map.put("clist", clist);
		map.put("slist", slist);
		return map;
	}

	@Override
	public int delete(String ids) {
		if (StringUtils.hasText(ids)) {
			List<String> list = this.array2List(ids.split(","));
			/* 删除与用户的关联 */
			this.userGroupMapper.deleteGroupUserByGroupIds(list);
			this.userGroupMapper.deleteGroupSiteByGroupIds(list);
			this.userGroupMapper.deleteGroupChannelByGroupIds(list);
			return this.userGroupMapper.deleteByIds(list);
		}
		return 0;
	}

}
