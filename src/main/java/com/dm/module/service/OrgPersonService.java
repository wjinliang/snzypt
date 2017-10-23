package com.dm.module.service;

import java.util.List;
import java.util.Map;

import com.dm.module.model.OrgPerson;
import com.github.pagehelper.PageInfo;

public interface OrgPersonService {

	public PageInfo<OrgPerson> findOrgPersonByPage(Integer pageNum,
			Integer pageSize, Map map) ;

	public void update(OrgPerson orgPerson);

	public void insert(OrgPerson orgPerson) ;

	public void delete(OrgPerson orgPerson);

	public OrgPerson load(String id);

	public List<Map> loadOrgOption(Boolean required);
}
