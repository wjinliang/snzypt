package com.dm.app.datatopic.statistis.service;

import java.util.List;
import java.util.Map;

/*
 * 10-16  农业观光园  接口
 */
public interface TjNysctjService {
	/**
     * @description  通过条件查询农村基本情况的某一列的所有值
     * @author huoge
     * @date 2017年2月27日
     * @param entityClass 要查询的类
     * @return
     */
    public List findAll(Class entityClass);
	//返回农用机械的数据(机械)
	public List getNyjx();
	//返回农用化肥的数据(吨)
	public List getNyHf();
	//返回农用耕地面积
	public List getMj();
	//返回农用耕地面积占比
	public List getMjZb();
		
	

}
