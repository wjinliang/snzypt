package com.dm.dataprocessing.service;

import java.util.Map;

import com.dm.dataprocessing.model.ContentPublishProces;
import com.github.pagehelper.PageInfo;

public interface ContentPublishProcessingService {

	public PageInfo<ContentPublishProces> list(Integer pageNum, Integer pageSize, Map map);

	public void run(String id );

	public ContentPublishProces load(String id);

	public void insert(ContentPublishProces v);

	public void update(ContentPublishProces v);

	public void delete(String id);
}
