package com.dm.module.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dm.module.model.OrgPerson;
import com.dm.module.service.OrgPersonService;
import com.dm.module.sqldao.OrgPersonMapper;
import com.dm.platform.model.Org;
import com.dm.platform.service.OrgService;
import com.dm.platform.util.UUIDUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class OrgPersonServiceImpl implements OrgPersonService{

	@Autowired
	private OrgPersonMapper orgPersonMapper;
	@Autowired
	private OrgService orgService;
	@Override
	public PageInfo<OrgPerson> findOrgPersonByPage(Integer pageNum,
			Integer pageSize, Map map) {
		PageHelper.startPage(pageNum, pageSize);
		List<OrgPerson> list = orgPersonMapper.selectByArgMap(map);
		PageInfo<OrgPerson> page = new PageInfo<OrgPerson>(list);
		return page;
	}

	@Override
	public void update(OrgPerson orgPerson) {
		Org org = orgService.findOne(orgPerson.getOrgId());
		if(org!=null){
			orgPerson.setOrgName(org.getName());
		}
		this.orgPersonMapper.updateByPrimaryKey(orgPerson);
		
	}

	@Override
	public void insert(OrgPerson orgPerson) {
		orgPerson.setId(UUIDUtils.getUUID8());
		Org org = orgService.findOne(orgPerson.getOrgId());
		if(org!=null){
			orgPerson.setOrgName(org.getName());
		}
		this.orgPersonMapper.insert(orgPerson);
		
	}

	@Override
	public void delete(OrgPerson orgPerson) {
		this.orgPersonMapper.deleteByPrimaryKey(orgPerson.getId());
		
	}

	@Override
	public OrgPerson load(String id) {
		OrgPerson op = this.orgPersonMapper.selectByPrimaryKey(id);
		return op;
	}

	@Override
	public List<Map> loadOrgOption(Boolean required) {
		List<Map> list = new ArrayList<Map>();
		List<Map> orgs = new ArrayList<Map>();
		if(required){
			orgs = this.orgPersonMapper.loadAllOrgs();
		}else{
			orgs = this.orgPersonMapper.loadOrgs();
		}
		for(Map o:orgs){
			Map  map = new HashMap();
			map.put("text", o.get("orgName"));
			map.put("value",o.get("orgId"));
			list.add(map);
		}
		return list;
	}

}
