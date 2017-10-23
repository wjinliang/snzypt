package com.dm.cms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import com.dm.cms.model.CmsAdvertising;
import com.dm.cms.service.CmsAdvertisingService;
import com.dm.cms.sqldao.CmsAdvertisingMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

@Service
public class CmsAdvertisingServiceImpl implements CmsAdvertisingService {

	@Autowired
	MongoTemplate mongoTemplate; 
	@Autowired
	private CmsAdvertisingMapper cmsAdvertisingMapper;
	@Override
	public PageInfo<CmsAdvertising> findCmsAdvertisingByPage(Integer pageNum,
			Integer pageSize, Map map) {
		DBCursor dc = mongoTemplate.getCollection("person").find();
		while (dc.hasNext()) {
            DBObject obj = dc.next();
            
            System.out.println(obj);
        }
		PageHelper.startPage(pageNum, pageSize);
		List<CmsAdvertising> list = this.cmsAdvertisingMapper.findByArgMap(map);
		PageInfo<CmsAdvertising> page = new PageInfo<CmsAdvertising>(list);
		return page;
	}

	@Override
	public void update(CmsAdvertising cmsAdvertising) {
		this.cmsAdvertisingMapper.updateByPrimaryKeySelective(cmsAdvertising);

	}

	@Override
	public void insert(CmsAdvertising cmsAdvertising) {
		this.init(cmsAdvertising);
		this.cmsAdvertisingMapper.insert(cmsAdvertising);
	}

	private void init(CmsAdvertising cmsAdvertising) {
		cmsAdvertising.setClickCount(0);
		cmsAdvertising.setEnabled(true);
		cmsAdvertising.setEnabled(cmsAdvertising.getEnabled()!=null?cmsAdvertising.getEnabled():true);
		cmsAdvertising.setTarget(cmsAdvertising.getTarget()==null?"_blank":cmsAdvertising.getTarget());
		
	}

	@Override
	public void delete(Integer id) {
		this.cmsAdvertisingMapper.deleteByPrimaryKey(id);

	}

	@Override
	public CmsAdvertising load(Integer id) {
		return this.cmsAdvertisingMapper.selectByPrimaryKey(id);
	}

	@Override
	public void click(Integer id) {
		CmsAdvertising ad = this.cmsAdvertisingMapper.selectByPrimaryKey(id);
		if(ad==null) return;
		ad.setClickCount(ad.getClickCount()+1);
		this.cmsAdvertisingMapper.updateByPrimaryKey(ad);
		
	}

	@Override
	public PageInfo<CmsAdvertising> findCmsAdvertisingByPageForPortal(int pageNum,
			Integer pageSize, Map map) {
		PageHelper.startPage(pageNum, pageSize);
		List<CmsAdvertising> list = this.cmsAdvertisingMapper.findByArgMapForProtal(map);
		PageInfo<CmsAdvertising> page = new PageInfo<CmsAdvertising>(list);
		return page;
	}

}
