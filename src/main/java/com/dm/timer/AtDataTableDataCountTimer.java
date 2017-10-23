package com.dm.timer;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.dm.atform.model.AtTable;
import com.dm.atform.service.AtTableService;
import com.dm.atform.service.SysDataCountService;

public class AtDataTableDataCountTimer{

	@Value("${spring.task.dataCount.isRun}")
	private boolean isRun;
	@Autowired
	private AtTableService atTableService;
	@Autowired
	private SysDataCountService dataCountService;
	
    public void run(){
    		if(!isRun){
    			return;
    		}
    		Map map = new HashMap();
    		//map.put("type", );
    		List<AtTable> list = atTableService.findAllByArg(map);
    		List<AtTable> dataList = new ArrayList<AtTable>();
    		List<AtTable> typeList = new ArrayList<AtTable>();
    		for(AtTable table:list){
    			if(table.getType()!=null &&table.getType().equals("0")){//数据表
    				String tableName = table.getTableName();
    				long s = dataCountService.getCount(table);
    				table.setDataCount(s);
    				this.atTableService.nologUpdate(table);
    				dataList.add(table);
    			}else{
    				typeList.add(table);
    			}
    		}
    		for(AtTable t:typeList){
    			if(t.getpId()==null||t.getpId().equals("")){
    				setCount(t);
    			}
    		}
    		System.out.println(this.getClass()+new SimpleDateFormat("yyyy 年 MM 月 dd 日 HH 时 mm 分 ss 秒").format(new Date()));
    }

	private Long setCount(AtTable t) {
		List<AtTable> subList = this.atTableService.findByPid(t.getId());
		Long s = 0l;
		if(subList.size()==0){//没有子分类
			if(t.getType()!=null && t.getType().equals("1")){//叶子节点为分类 初始化0
				t.setDataCount(0l);
				this.atTableService.nologUpdate(t);
			}
			return t.getDataCount();
		}
		for(AtTable table:subList){//有子分类 为自分类的和
			s+=setCount(table);
		}
		t.setDataCount(s);
		this.atTableService.nologUpdate(t);
		return s;
	}
    
    
    
}