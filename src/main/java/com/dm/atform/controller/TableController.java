package com.dm.atform.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.util.export.Export;
import com.dm.app.util.export.JsonDateValueProcessor;
import com.dm.atform.model.AtTable;
import com.dm.atform.service.AtFieldService;
import com.dm.atform.service.AtTableService;
import com.dm.atform.service.MongoService;
import com.dm.platform.model.LogEntity;
import com.dm.platform.model.UserAccount;
import com.dm.platform.service.LogService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SqlParam;
import com.dm.platform.util.UserAccountUtil;
import com.github.pagehelper.PageInfo;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;

@Controller
@RequestMapping("table")
public class TableController {


	@Autowired
	private AtFieldService colService;

	@Autowired
	private AtTableService tableService;

	@Autowired
	private MongoService mongo;
	
	@Autowired
	private MongoTemplate mongoTemplate;

	@Autowired
	private LogService logService;
	@RequestMapping("/page")
	public String page(Model model) {
		return "/atform/table/page";
	}
	@RequestMapping("/gridlist")
	@ResponseBody
	public Object list(
			@RequestParam(value = "pageNum", required = false,defaultValue="1") Integer pageNum,
			@RequestParam(value = "pageSize", required = false,defaultValue="10") Integer pageSize,
			@RequestParam(value="sort" ,required = false,defaultValue="createDate_desc") String sort,
			AtTable atTable){ 
		Map map =new SqlParam().autoParam(atTable, sort,pageNum,pageSize);
		PageInfo<AtTable> page = this.tableService.findByArg(map);
		return PageConvertUtil.grid(page);
	}
	@RequestMapping("/load")
	@ResponseBody
	public Object load(String id){
		return this.tableService.findOne(id);
	}
	@RequestMapping("/loadCollections")
	@ResponseBody
	public Object loadCollections(){
		return this.mongo.loadCollections(); 
	}
	@RequestMapping("/insertOrUpdate")
	@ResponseBody
	public Object addOrUpdate(AtTable atTable){
		if(atTable.getId()==null||atTable.getId().equals("")){
			this.tableService.save(atTable);
		}else{
			this.tableService.update(atTable);
		}
		return ResponseUtil.success();
	}
	@RequestMapping("delete")
	@ResponseBody
	public Object delte(AtTable atTable){
		List<AtTable> list = this.tableService.findByPid(atTable.getId());
		if(list.size()>0){
			return ResponseUtil.error("请先删除子分类");
		}
		this.tableService.delete(atTable.getId());
		return ResponseUtil.success();
	}
	@RequestMapping("tree")
	@ResponseBody
	public Object tree(@RequestParam(value="tableId",required=false) String tableId,
			@RequestParam(value="status",required=false) String status,
			@RequestParam(value="type",required=false) String type){
			Map map = new HashMap();
			map.put("pId", tableId);
			map.put("status", status);
			map.put("type", type);
			return this.tableService.getTree(map);
	}
	@RequestMapping("/sort")
	@ResponseBody
	public Object sort(String id,String pid,String targetId,String moveType){
		this.tableService.sort(id,pid,targetId,moveType);
		return ResponseUtil.success("操作成功！");
	}

	@RequestMapping("/data/export/{tableId}")
	public void export(HttpServletRequest request,HttpServletResponse response,@PathVariable("tableId") String tableId){
		Map map0 = new HashMap(); 
		AtTable record = new AtTable();
		record.setpId(tableId);
		record.setType("0");
		record.setStatus("1");
		map0.put("model", record);
		map0.put("sort","seq asc" );
		List<AtTable> attablelist = this.tableService.findAllByArg(map0);
		AtTable t = this.tableService.findOne(tableId);
		Integer count = (t.getVisitCount()==null?0:t.getVisitCount())+1;
		t.setVisitCount(count);

		Integer dcount = (t.getDownloadCount()==null?0:t.getDownloadCount())+1;
		t.setDownloadCount(dcount);
		this.tableService.nologUpdate(t);
		try{
			SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateStr = format.format(new Date());
		LogEntity log = new LogEntity();
		UserAccount user = UserAccountUtil.getInstance().getCurrentUserAccount();
		log.setContent("用户【"+user.getName()+":"+user.getCode()+"】下载数据【"+t.getGridName()+":"+t.getId()+"】日期："+dateStr);
		log.setUser(user.getCode());
		log.setDate(dateStr);
		log.setIp(UserAccountUtil.getInstance().getCurrentIp());
		log.setTitle("数据下载【"+t.getGridName()+"】");
		log.setType("9");
		logService.insert(log);
		}catch(Exception e){
			e.printStackTrace();
		}
		int s = -1;
		if(attablelist.size()==0){
			attablelist.add(t);
		}else if(attablelist.size()>1){
			for(int i=0;i<attablelist.size();i++){
				AtTable tabl = attablelist.get(i);
				tabl.setVisitCount(count);
				this.tableService.nologUpdate(tabl);
				if(tabl.getId().equals(tableId)){
					s= i;
				}
			}
		}
		
		if(s!=-1){
			attablelist.remove(s);
		}
		//List<AtTable> attablelist = this.table.findByPid(tableId);
		List<String> tableNames = new ArrayList<String>();
		List<String> tableIds = new ArrayList<String>();
		for (int i = 0; i < attablelist.size(); i++) {
			tableNames.add(attablelist.get(i).getTableName());
			tableIds.add(attablelist.get(i).getId());
		}
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(java.util.Date.class,
				new JsonDateValueProcessor("yyyy-MM-dd"));
		List<File> files = new ArrayList<File>();
		for (int i = 0; i < tableNames.size(); i++) {
			DBCollection dc = mongoTemplate.getCollection(tableNames.get(i));
			DBCursor cur = dc.find();
			List a = new ArrayList();
			while (cur.hasNext()) {
				a.add(cur.next());
			}
			JSONArray jsonObject = JSONArray.fromObject(a, config);
			File f = Export.createExcel(jsonObject, tableNames.get(i));
			if(f!=null){
				files.add(f);
			}
		}
		List<Map<String, String>> asad = new ArrayList<>();
		for (int i = 0; i < tableIds.size(); i++) {
			Map<String, String> map =null;
			List<Map<String, String>> list11 = this.colService
					.findByTableId(tableIds.get(i));
			map= new HashMap<String, String>();
			map.put("tableName", tableNames.get(i));
			list11.add(0, map);
			if(attablelist.get(i).getInfo()!=null){
				map= new HashMap<String, String>();
				map.put("info", attablelist.get(i).getInfo());
				list11.add(1, map);
			}
			if(attablelist.get(i).getOrigin()!=null){
				map= new HashMap<String, String>();
				map.put("origin",  attablelist.get(i).getOrigin());
				list11.add(2, map);
			}
			if(attablelist.get(i).getOrg()!=null){
				map= new HashMap<String, String>();
				map.put("org",attablelist.get(i).getOrg());
				list11.add(3, map);
			}
			
			asad.addAll(list11);
		}
		File f = Export.createExcel1(asad,"/var/taiji/tomcat7_cms/webapps/downfiles/"+t.getGridName()+"_数据说明.xls");
		files.add(f);
		try {
			Export.downLoadFiles(files, request, response,t.getGridName());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
