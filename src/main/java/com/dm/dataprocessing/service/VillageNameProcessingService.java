package com.dm.dataprocessing.service;

import java.util.Map;

import com.dm.dataprocessing.model.VillageNameProces;
import com.github.pagehelper.PageInfo;

public interface VillageNameProcessingService {

	public PageInfo<VillageNameProces> list(Integer pageNum, Integer pageSize, Map map);

	public void run(String id );

	public VillageNameProces load(String valiageCollId);

	public void insert(VillageNameProces v);

	public void update(VillageNameProces v);

	public void delete(String id);
}
