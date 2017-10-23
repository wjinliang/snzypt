package com.dm.app.common.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.query.Query;

import com.dm.app.util.Page;

/**
 * MongD持久层抽象接口
 * @param <T>
 * @param <PK>
 */
public interface MongoBaseDAO <T extends Serializable, PK extends Serializable>{
	
	/**
	 * 保存一个对象数据
	 * @param t
	 */
	public void save(T t);
	
	
	/**
	 * 删除一个对象
	 * @param t
	 */
	public void delete(T t);
	
	
	/**
	 * 根据id删除一个对象
	 * @param id
	 */
	public void deleteById(PK id);
	/**
	 * 通ids批量删除
	 * @param id
	 * @return
	 */
	public void deleteIds(String[] ids);
	
	/**
	 * 根据id获取一个对象
	 * @param id
	 * @return
	 */
	public T findById(PK id);
	
	
	/**
	 * 获取某类mongodb数据库对应集合的所有数据
	 * @return
	 */
	public List<T> findAll();
	
	
	/**
	 * 分布查询方法
	 * @param page 要跳转的页码
	 * @param pageSize	每页的数据量
	 * @return
	 */
	public Page<T> getPage(int page, int pageSize);
	
	public Page<T> getPage(Query query,int page, int pageSize);
	public Page<T> getPage(HashMap<String,Object> params, int page, int pageSize);
	
	
	/**
	 * 根据id更新某个字段
	 * @param id
	 * @param key
	 * @param value
	 */
	public void updatePropertyById(PK id, String key, Object value);
	
	
	/**
	 * 根据对象的属性查询一个对象,此属性值必须是唯一的,所有只返回一个唯一的对象
	 * @param key   属性名
	 * @param value  属性值
	 * @return
	 */
	public T getByProperty(String key, Object value);
	
	
	/**
	 * 根据对象的属性查询满足该属性值的所有对象,
	 * 此属性值不是唯一的,所有返回的是对象的List集合
	 * @param key 属性名
	 * @param value 属性值
	 * @return
	 */
	public List<T> getsByProperty(String key, Object value);


	/**
	 * 根据id自增自减某个属性
	 * @param id
	 * @param key	要更改的属性值
	 * @param incr	减量或者增量
	 */
	public void incrementById(PK id, String key, Number incr);
	
	
	/**
	 * 根据id的集合获取对应的实体的集合
	 * @param ids
	 * @return
	 */
	List<T> getByIds(Collection<PK> ids);
	
	
	/**
	 * 分页查询方法
	 * @param page 当前页码
	 * @param pageSize	每页显示的数量
	 * @param map	条件查询的属性及值,map中key为属性, value库值, 若无,传入空值即可
	 * @param orders	排序的字段,key为要排序的属性,value库正序还是倒序, LinkedHashMap,按先后顺序排序, 若无需排序,传入空值即可
	 * @return
	 */
	public Page<T> getPage(int page, int pageSize, Map<String, Object> map, LinkedHashMap<String, Direction> orders);
	
	
	/**
	 * 根据属性查询
	 * @param ids
	 * @return
	 */
	public List<T> findByPropertys(String key, Object[] ids);

	
	/**
	 * 根据指定属性值修改另一属性的值
	 * @param querykey
	 * @param queryValue
	 * @param property
	 * @param value
	 */
	public void updateByProperty(String querykey, Object queryValue, String property,
			Object value);


	/**
	 * 根据查询条件, 修改多个属性值
	 * @param querykey
	 * @param queryValue
	 * @param updateMap
	 */
	public void updateByProperty(String querykey, Object queryValue, Map<String, Object> updateMap);


	/**
	 * 获取总数
	 * @param map
	 * @return
	 */
	public long getCount(Map<String, Object> map);


	void incrementByProperty(String queryKey, Object queryValue, String key,
			Number incr);


	public List<T> findAll(Map searchMap);
}
