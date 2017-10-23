package com.dm.timer;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.dm.atform.service.SysDataCountService;
import com.dm.atform.util.RedisCache;

public class RedisRecordDataCountTimer{

	
	public static final String DATA_COUNT_KEY="RedisRecordDataCountTimer_DATA_COUNT_KEY";
	@Autowired
	RedisCache redis;
	@Autowired
	SysDataCountService dataCountService;
    public void run(){
    	Map m = dataCountService.getSysDataCount();
    	redis.set(DATA_COUNT_KEY, (long)m.get("fullCount"),7*24*60*60);
    	
    }


    
}