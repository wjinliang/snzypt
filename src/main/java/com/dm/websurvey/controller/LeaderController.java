package com.dm.websurvey.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.cms.model.TreeNode;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SqlParam;
import com.dm.websurvey.model.Leader;
import com.dm.websurvey.service.LeaderService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/leader")
public class LeaderController {
	
   @Autowired
   LeaderService leaderService;
	
	@RequestMapping("/list")
	@ResponseBody
	public Map list(Integer pageNum,Integer pageSize,Leader leader,String sort)
	{
		
		sort = StringUtils.isEmpty(sort)?"seq_asc":sort;
		Map map = new SqlParam<Leader>().autoParam(leader,sort);
		PageInfo<Leader> pageinfo = leaderService.findByPage(pageNum, pageSize, map);
		return PageConvertUtil.grid(pageinfo);
	}
	
	@RequestMapping("/page")
	public String page()
	{
		return "/websurvey/lead-page";
	}
	
	@RequestMapping("/addOrUpdate")
	@ResponseBody
	public Map add(Leader leader)
	{
		if(StringUtils.isEmpty(leader.getId()))
		leaderService.add(leader);
		else
			leaderService.update(leader);
		return ResponseUtil.success("操作成功！");
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Map delete(String id)
	{
		leaderService.delete(id);
		return ResponseUtil.success("操作成功！");
	}
	
	@RequestMapping("/load")
	@ResponseBody
	public Leader load(String id)
	{
		Leader leader = leaderService.findOne(id);
        return leader;
	}
	@RequestMapping("/tree")
	@ResponseBody
	public List<TreeNode> tree(){
		return this.leaderService.treeWithOrg();
	}
}
