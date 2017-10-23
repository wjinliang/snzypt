package com.dm.cms.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.cms.model.CmsAdvertising;
import com.dm.cms.service.CmsAdvertisingService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SqlParam;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/cms/advertising")
public class CmsAdvertisingController {
	
	@Autowired
	private CmsAdvertisingService cmsAdvertisingService;
	
	@RequestMapping("/page")
	public String page(){
		return "/cms/advertising/page";
	}
	
	@RequestMapping("list")
	@ResponseBody
	public Object list(
			@RequestParam(value = "pageNum", required = false) Integer pageNum,
			@RequestParam(value = "pageSize", required = false) Integer pageSize,
			CmsAdvertising cmsAdvertising,
			@RequestParam(value = "sort", required = false) String sort) {
		if (cmsAdvertising.getSiteId() == null)
			return PageConvertUtil.emptyGrid();
		Map map = new SqlParam<CmsAdvertising>().autoParam(cmsAdvertising, sort);
		map.put("model", cmsAdvertising);
		PageInfo<CmsAdvertising> page = cmsAdvertisingService.findCmsAdvertisingByPage(
				pageNum, pageSize, map);
		return PageConvertUtil.grid(page);
	}
	@RequestMapping("/insertOrUpdate")
	@ResponseBody
	public Object insertOrUpdate(@ModelAttribute CmsAdvertising cmsAdvertising){
		if(cmsAdvertising.getId()!=null){
			this.cmsAdvertisingService.update(cmsAdvertising);
		}else{
			this.cmsAdvertisingService.insert(cmsAdvertising);
		}
		return ResponseUtil.success();
	}
	@RequestMapping("/delete")
	@ResponseBody
	public Object delette(Integer id){
		this.cmsAdvertisingService.delete(id);
		return ResponseUtil.success();
	}
	@RequestMapping("/load")
	@ResponseBody
	public Object load(Integer id){
		return this.cmsAdvertisingService.load(id);
	}
	@RequestMapping("/click")
	@ResponseBody
	public Object click(Integer id){
		 this.cmsAdvertisingService.click(id);
		 return ResponseUtil.success();
	}
	
	@InitBinder
    public void initBinder(ServletRequestDataBinder binder){
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"),
                true));
    }
}
