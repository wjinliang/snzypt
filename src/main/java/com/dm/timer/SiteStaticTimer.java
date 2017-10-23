package com.dm.timer;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.dm.cms.model.CmsChannel;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsSiteService;

public class SiteStaticTimer{

	@Autowired
	private CmsSiteService siteService;
	@Autowired
	private CmsChannelService channelService;
	@Value("${spring.task.SiteStatic.isRun}")
	private boolean isRun;
	
    public void run(){
    		if(!isRun){
    			return;
    		}
    		siteService.generatorHtml(1, null);
    		Map searchMap = new HashMap();
    		searchMap.put("order", "id");
    		List<CmsChannel> channels = channelService.findByRoot(searchMap);
    		for(CmsChannel c:channels){
    			if(c.getIsHtml()){
    				channelService.generateHtml(null, c.getId());
    			}
    		}
    	System.out.println(this.getClass()+new SimpleDateFormat("yyyy 年 MM 月 dd 日 HH 时 mm 分 ss 秒").format(new Date()));
    }
    
    
    
}