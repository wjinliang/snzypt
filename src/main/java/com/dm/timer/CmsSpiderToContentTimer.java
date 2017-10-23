package com.dm.timer;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;

import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsContent;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsContentService;
import com.dm.platform.model.UserAccount;
import com.dm.platform.util.UserAccountUtil;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.QueryOperators;

public class CmsSpiderToContentTimer{
	
	@Autowired
	private MongoTemplate mongo;
	@Autowired
	private CmsChannelService cmsChannelService;
	@Autowired
	private CmsContentService cmsContentService;
	
	
	private boolean isRun = true;
	
  
    public void doAction(){
    	if(!isRun){
			return;
		}
    	 DBCollection coll = mongo.getCollection("conf_spider_to_content");// 获取要更新的表;
 		//整理的 2016 对应221 对应村庄规划
 		BasicDBObject query = new BasicDBObject().append("type", "1");
 		DBCursor cur = coll.find(query);
 		while (cur.hasNext()) {
 			DBObject o = cur.next();
 			String contentCollection = o.get("collection").toString();
 			String channelId = o.get("channelId").toString();
 			String templateId = o.get("templateId").toString();
 			String publishTimeFiled = o.get("publishTime").toString();
 			String publishTimeFormat = o.get("publishTimeFormat").toString();
 			String titleFiled = o.get("title").toString();
 			String contentFiled = o.get("content").toString();
 			String authorFiled = o.get("author").toString();
 			String origionFiled = o.get("origion").toString();
 			String idFiled = o.get("id").toString();
 			

 	    	 DBCollection tablecoll = mongo.getCollection(contentCollection);// 获取要更新的表;
 	    	 DBObject quy = new BasicDBObject().append("publishFlag",
				new BasicDBObject().append(QueryOperators.EXISTS, false));
 	    	DBCursor tablecur = tablecoll.find(quy);
 	    	DateFormat dateFormat = null;
 	    	try{
 	    		dateFormat = new SimpleDateFormat(publishTimeFormat);
 	    	}catch(Exception e){
 	    		
 	    	}
 	    	while(tablecur.hasNext()){
	 	    	DBObject tableo = tablecur.next();
	 			CmsContent content = new CmsContent();
	 			Object cont = tableo.get(contentFiled);
	 			String id = tableo.get(idFiled).toString();
	 			try{
	 			if (cont == null) {
	 				tableo.put("publishFlag","NOContent");
	 				tablecoll.update(new BasicDBObject().append(idFiled, id),tableo);
	 				continue;
	 			}
	 			content.setContentText((String) cont);
	 			content.setAuthor((String) tableo.get(authorFiled));
	 			content.setTitle((String) tableo.get(titleFiled));
	 			Date publishDate = null;
	 			Object pubo = tableo.get(publishTimeFiled);
	 			if(pubo!=null){
	 				String pubString = pubo.toString();
	 				try{
	 					publishDate = dateFormat.parse(pubString);
	 				}catch(Exception e){
	 				
	 				}
	 			}
	 			content.setPublishDate(publishDate);
	 			content.setOrigin((String) tableo.get(origionFiled));
	 			content.setChannelId(Integer.valueOf(channelId));
	 			content.setContentType(0);
	 			content.setTemplateId(Integer.valueOf(templateId));
	 			content.setSeq(1);
	 			content.setFiled1((String) tableo.get("url"));
	 			content.setCreateTime(new Date());
	 			insert(content);
	 			boolean succ = this.cmsContentService.updateContentState(null,
	 					content.getId(), new Short("2"));
	 			System.out.println("成功发布新闻："+id+"，"+tableo.get(titleFiled));
	 			tableo.put("publishFlag","yes");
	 			tablecoll.update(new BasicDBObject().append(idFiled, id),tableo);
	 			}catch(Exception e1){
		 			tableo.put("publishFlag",e1.getMessage());
		 			tablecoll.update(new BasicDBObject().append(idFiled, id),tableo);
	 				
	 			}
 				
 	    	}
 		}
 			
    }
 		private void insert(CmsContent cmsContent) {
 			CmsChannel cmsChannel = cmsChannelService.findOneById(cmsContent
 					.getChannelId());
 			cmsContent.setSiteDomain(cmsChannel.getSiteDomain());
 			cmsContent.setChannelEnName(cmsChannel.getEnName());
 			cmsContent.setIsDelete(false);
 			UserAccount user = UserAccountUtil.getInstance()
 					.getCurrentUserAccount();
 			if(user!=null){
	 			cmsContent.setCreateUser(user.getCode());
	 			cmsContent.setCreateUserName(user.getName());
 			}
 			if (cmsContent.getTitleStyle() != null
 					&& !cmsContent.getTitleStyle().equals("")) {
 				String titleStyleArray[] = cmsContent.getTitleStyle().split(",");
 				cmsContent.setTitleStyle("color:" + titleStyleArray[0]
 						+ ";font-size:" + titleStyleArray[1]);
 			}
 			cmsContentService.insertCmsContent(cmsContent);
 		}
    
    
}