package com.dm.importmanage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dm.importmanage.model.ExclImportConf;
import com.dm.importmanage.model.ExclImportLog;
import com.dm.importmanage.service.ImportLogService;
import com.dm.importmanage.service.ImportManageService;
import com.dm.platform.util.FileUtil;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SqlParam;
import com.github.pagehelper.PageInfo;


@Controller
@RequestMapping("/imports")
public class ImportManageController {
	@Autowired
	private ImportManageService importManageService;
	@Autowired
	private ImportLogService importLogService;
	
	@RequestMapping("/confpage")
	public String confpage(Model model) {
		return "/imports/confpage";
	}
	@RequestMapping("/page")
	public String page(Model model) {
		return "/imports/page";
	}
	@RequestMapping("/list")
	@ResponseBody
	public Object list(
			ExclImportConf conf,
			@RequestParam(value = "pageNum", required = false,defaultValue="1") Integer pageNum,
			@RequestParam(value = "pageSize", required = false,defaultValue="10") Integer pageSize,
			@RequestParam(value = "sort", required = false) String sort) {
		Map map = new SqlParam<ExclImportConf>().autoParam(conf, sort);
		PageInfo<ExclImportConf> page = importManageService.findByPage(
				pageNum, pageSize, map);
		return PageConvertUtil.grid(page);
	}
	@RequestMapping("/logList")
	@ResponseBody
	public Object logList(
			ExclImportLog conf,
			@RequestParam(value = "pageNum", required = false,defaultValue="1") Integer pageNum,
			@RequestParam(value = "pageSize", required = false,defaultValue="10") Integer pageSize,
			@RequestParam(value = "sort", required = false) String sort) {
		Map map = new SqlParam<ExclImportLog>().autoParam(conf, sort);
		PageInfo<ExclImportLog> page = importLogService.findLogByPage(
				pageNum, pageSize, map);
		return PageConvertUtil.grid(page);
	}
	
	@RequestMapping("saveOrUpdate")
	@ResponseBody
	public Object saveOrUpdate(ExclImportConf conf){
		if(conf.getId()==null){
			this.importManageService.save(conf);
		}
		else{
			this.importManageService.update(conf);
		}
		return ResponseUtil.success();
	}
	@RequestMapping("delete")
	@ResponseBody
	public Object del(ExclImportConf conf){
		this.importManageService.delete(conf);
		return ResponseUtil.success();
	}
	@RequestMapping("confopts")
	@ResponseBody
	public Object options(){
		return this.importManageService.findOption();
	}
	
	@RequestMapping("test")
	@ResponseBody
	public Object test(ExclImportLog log){
		List m = this.importLogService.test(log);
		Map r = ResponseUtil.success(m);
		r.put("status", "2");
		return r;
	}
	@RequestMapping("import")
	@ResponseBody
	public Object importexcl(ExclImportLog log){
		this.importLogService.importExcel(log);
		return ResponseUtil.success();
	}
	@RequestMapping("autoconf")
	@ResponseBody
	public Object autoconf(ExclImportLog log){
		this.importLogService.autoconf(log);
		return ResponseUtil.success();
	}
	@RequestMapping("doxzc")
	@ResponseBody
	public Object doxzc(Integer id){
		this.importLogService.doxzc(id);
		return ResponseUtil.success();
		
	}
	@RequestMapping("deldata")
	@ResponseBody
	public Object del(Integer id){
		this.importLogService.delData(id);
		return ResponseUtil.success();
		
	}	@RequestMapping("fileupload")
	@ResponseBody
	public Object fileUpload(HttpServletRequest httpServletRequest,
			@RequestParam(value = "confId", required = false)Integer id,
			@RequestParam(value = "file", required = true) MultipartFile file) {
		try {
			try {
				String realFileName = file.getOriginalFilename();
				if (!realFileName.endsWith(".xls")) {
					return ResponseUtil.error("格式必须是.xls");
				}
				if (file.getSize() > (56 * 1024 * 2014)) {
					return ResponseUtil.error("附件大小必须小于56M");
				}
				String basePath="excel/"; 
				if(id!=null){
				ExclImportConf e = this.importManageService.findById(id);
					if(e!=null){
						basePath += e.getFilePath();
					}
				}
				String templateContextPath = httpServletRequest.getSession()
						.getServletContext().getRealPath("/");
				templateContextPath+=basePath;
				String fileName = FileUtil.saveFileFromMultipartFile(file,
						templateContextPath);
				
				String finalPath = templateContextPath + "/" + fileName;
				Map map = new HashMap();
				map.put("status", 1);
				map.put("path", finalPath);
				return map;
			} catch (Exception e) {
				e.printStackTrace();
				return ResponseUtil.error("异常");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseUtil.error();
		}
	}
	
	

}
