package com.dm.app.datatopic.statistis.service;

import java.util.List;

/**
 * 统计2009-2013年耕地面积，包括年初，年内，年末
 * @author Lenovo
 *
 */
public interface TjGdmjService {
	/**
	 * 
	 * 统计2009-2013年所有耕地面积，包括年初，年中，年末
	 * @param entityClass
	 * @return
	 */
	public List findAll(Class entityClass);

}
