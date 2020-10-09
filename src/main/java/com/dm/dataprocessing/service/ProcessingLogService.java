package com.dm.dataprocessing.service;

import java.util.Map;

import com.dm.dataprocessing.model.ProcesLog;
import com.github.pagehelper.PageInfo;

public interface ProcessingLogService {

	public PageInfo<ProcesLog> list(Integer pageNum, Integer pageSize, Map map);

	public ProcesLog load(String id);

	public void insert(ProcesLog v);

	public void update(ProcesLog v);

	public void delete(String id);
}
