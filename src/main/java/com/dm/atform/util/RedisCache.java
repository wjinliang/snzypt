package com.dm.atform.util;

import java.util.Set;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;

import com.dm.atform.sqldao.IBasicCache;

/**
 * Created by chenguojun on 8/30/16.
 */

public class RedisCache implements IBasicCache<String, Object> {

	private final static int DEFAULT_EXPIRE_SECOND1 = 3 * 24 * 60 * 60;
	private final static int DEFAULT_EXPIRE_SECOND = 12 * 60 * 60;

	@Autowired
	private RedisTemplate<String, Object> redisTemplate;

	@Override
	public void set(String key, Object value) {
		try {
			//System.out.println("redis添加key-:" + key);
			redisTemplate.opsForValue().set(key, value, DEFAULT_EXPIRE_SECOND,
					TimeUnit.SECONDS); 
		} catch (Exception e) {
			System.err.println(this.getClass().toString()+"redis链接失败 请检查!"+e.getMessage());
		}
	}

	@Override
	public void set(String key, Object value, int seconds) {
		try {
			redisTemplate.opsForValue().set(key, value, seconds,
					TimeUnit.SECONDS);
		} catch (Exception e) { 
			System.err.println(this.getClass().toString()+"redis链接失败 请检查!"+e.getMessage());
		}
	}

	@Override
	public Object get(String key) {
		try {
			//return null;
			return redisTemplate.opsForValue().get(key);
		} catch (Exception e) {
			System.err.println(this.getClass().toString()+"redis链接失败 请检查!"+e.getMessage());
		}
		return null;
	}

	@Override
	public void del(String key) {
		try{
			redisTemplate.delete(key);
		} catch (Exception e) {
			System.err.println(this.getClass().toString()+"redis链接失败 请检查!"+e.getMessage());
		}
	}

	@Override
	public void expire(String key, int seconds) {
		redisTemplate.expire(key, seconds, TimeUnit.SECONDS);
	}

	public void delByPattern(String pattern) {
		Set<String> keys = redisTemplate.keys(pattern);
		for (String key : keys) {
			del(key);
		}
	}
}
