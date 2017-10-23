package com.dm.timer;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import com.dm.app.datatopic.cunzhuangguhua.model.CountryPic;
import com.dm.app.datatopic.cunzhuangguhua.service.CountryPicService;
import com.dm.platform.util.DmDateUtil;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
/**
 * 判断图则文件是否存在 不存在更新为 exsit=0
 * @author Mr.Jin
 *
 */
public class TuzeExsitTimer {

	@Autowired
	private MongoTemplate mongo;
	@Autowired
	private CountryPicService picService;

	@Value("${spring.task.TuzeExsit.isRun}")
	private boolean isRun;
	@Value("${spring.task.TuzeExsit.filePath}")
	private String path;

	public void doAction() {
		if (!isRun) {
			return;
		}

		System.out.println(TuzeExsitTimer.class+"开始:"+DmDateUtil.Current());
		run();
		System.out.println(TuzeExsitTimer.class+"结束:"+DmDateUtil.Current());
	}

	private void run() {
		Query q = new Query();
		DBCollection c = mongo.getCollection("b_CountryPic");
		q.addCriteria(Criteria.where("exsit").exists(false));
		int pagesize = 1000;
		int pagenum =1;
		int count=0;
		List<CountryPic> list = null;
		while(list==null || list.size()>0){
			list = picService.findList(q, pagesize, pagenum);
			for(CountryPic pic:list){
				String url = pic.getUrl();
				String filePath = path+url;
				//System.out.println(filePath+"==="+count++);
				File f = new File(filePath);
				BasicDBObject query = new BasicDBObject().append("OBJECTID", pic.getObjectId());
				DBObject dbpic=null;
				dbpic = c.findOne(query);
				if(f.exists()){
					dbpic.put("exsit", "1");
					c.update(query,
							dbpic);
				}else{
					dbpic.put("exsit", "0");
					c.update(query,
							dbpic);
				}
				
			}
		}
	}
	

}
