package com.dm.websurvey.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dm.cms.model.TreeNode;
import com.dm.platform.model.TDictItem;
import com.dm.platform.util.TDictUtil;
import com.dm.platform.util.UUIDUtils;
import com.dm.websurvey.model.Leader;
import com.dm.websurvey.service.LeaderService;
import com.dm.websurvey.sqldao.LeaderMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class LeaderServiceImpl implements LeaderService{

	@Autowired
	LeaderMapper leadMapper;
	
	@Override
	public void add(Leader leader) {
		// TODO Auto-generated method stub
		leader.setId(UUIDUtils.getUUID16());
		leadMapper.insert(leader);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		leadMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void update(Leader leader) {
		// TODO Auto-generated method stub
		leadMapper.updateByPrimaryKey(leader);
	}

	@Override
	public PageInfo<Leader> findByPage(int pageNum, int pageSize, Map map) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		List<Leader> leaders = leadMapper.selectRecordByArgMap(map);
		PageInfo<Leader> pageInfo = new PageInfo<Leader>(leaders);
		return pageInfo;
	}
	
	@Override
	public List<Leader> findAll(String code,String org) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		Map m = new HashMap();
		m.put("type", code);
		m.put("org", org);
		map.put("sort", "seq asc");
		map.put("model", m);
		List<Leader> leaders = leadMapper.selectRecordByArgMap(map);
		return leaders;
	}
	
	public Leader findOne(String id)
	{
		return leadMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<TreeNode> treeWithOrg() {
		Map map = new HashMap();
		Map m = new HashMap();
		List<TDictItem> items = TDictUtil.itemList("C01");
		List<TreeNode>  list = new ArrayList<TreeNode>();
		map.put("sort", "seq asc");
		for(TDictItem item:items){
			m.put("org", item.getItemName());
			map.put("model", m);
			List<Leader> leaders = leadMapper.selectRecordByArgMap(map);
			TreeNode node = new TreeNode();
			node.setId(item.getItemId().toString());
			node.setOpen(false);
			node.setName(item.getItemName());
			list.add(node);
			for(Leader l:leaders){
				TreeNode cnode = new TreeNode();
				cnode.setId(l.getId().toString());
				cnode.setOpen(false);
				cnode.setpId(item.getItemId().toString());
				cnode.setName(l.getName().replace("&nbsp;", ""));
				cnode.setI("1");
				list.add(cnode);
			}
			
		}
		return list;
	}

}
