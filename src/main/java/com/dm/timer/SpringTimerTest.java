package com.dm.timer;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.dm.atform.model.AtTable;
import com.dm.atform.service.AtTableService;

public class SpringTimerTest{

	@Autowired
	private AtTableService atTableService;
	
	private boolean isRun = false;
	
    public void test(){
    		if(!isRun){
    			return;
    		}
    	System.out.println(this.getClass()+new SimpleDateFormat("yyyy 年 MM 月 dd 日 HH 时 mm 分 ss 秒").format(new Date()));
    }
    public void doAction(){
    	if(!isRun){
			return;
		}
    	List<AtTable> list = atTableService.findAllByArg(null);
    	for(AtTable a: list ){
    		String table = a.getTableName();
    		
    	}
    }
    
    
}