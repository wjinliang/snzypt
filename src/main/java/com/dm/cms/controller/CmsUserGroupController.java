package com.dm.cms.controller;

import com.dm.cms.model.CmsUserGroup;
import com.dm.cms.service.CmsUserGroupService;
import com.dm.cms.model.TreeNode;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 
 * @project com.dm.cms.controller.UserGroupController.java
 * @author wjl
 * @createdate 2015年12月7日 下午12:51:18
 */
@Controller
@RequestMapping("/cms/usergroup")
public class CmsUserGroupController {
	@Autowired
	CmsUserGroupService userGroupService;

	@RequestMapping("/page")
	public String page(Model model) {
		return "/cms/usergroup/page";
	}

	@RequestMapping("/loaduser")
	public @ResponseBody
	Object loaduser() {
		List<TreeNode> treeNodes = userGroupService.findAllUserTreeNode();
		return treeNodes;
	}
	@RequestMapping("/loadsite")
	public @ResponseBody
	Object loadsite() {
		return userGroupService.findAllSiteChannelTreeNode();
	}
	@RequestMapping("/list")
	public @ResponseBody
	Object list(
			@RequestParam(value = "pageNum", required = false) Integer pageNum,
			@RequestParam(value = "pageSize", required = false) Integer pageSize,
			CmsUserGroup userGroup) {
		return PageConvertUtil.grid(userGroupService.findUserGroupByPage(
				pageNum, pageSize, userGroup));
	}

	@RequestMapping("/load")
	public @ResponseBody
	Object load(@RequestParam(value = "groupId", required = true) String groupId) {
		return userGroupService.findOneById(groupId);
	}

	@RequestMapping("/insertOrUpdate")
	public @ResponseBody
	Object insertOrUpdate(CmsUserGroup userGroup) {
		// TODO 验证
		if (StringUtils.hasText(userGroup.getId())) {
			this.userGroupService.updateUserGroup(userGroup);
		} else {
			this.userGroupService.insertUserGroup(userGroup);
		}
		return ResponseUtil.success();
	}

	@RequestMapping("/delete")
	public @ResponseBody
	Object delete(@RequestParam(value = "ids", required = true) String ids) {
		userGroupService.delete(ids);
		return ResponseUtil.success();
	}
}
