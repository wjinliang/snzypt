package com.dm.module.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.module.model.Microcobol;
import com.dm.module.service.MicrocobolService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SqlParam;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/microcobol")
public class MicrocobolController {

	@Autowired
	private MicrocobolService microcobolService;
	
	@RequestMapping("/page")
	public String page(){
		return "/module/microcobol/page";
	}
	
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Object list(
			Microcobol microcobol,
			@RequestParam(value = "pageNum", required = false) Integer pageNum,
			@RequestParam(value = "pageSize", required = false) Integer pageSize,
			@RequestParam(value = "sort", required = false) String sort) {
		if (microcobol.getSiteId() == null){
			return PageConvertUtil.emptyGrid();
		}
		Map map = new SqlParam<Microcobol>().autoParam(microcobol, sort);
		map.put("model", microcobol);
		PageInfo<Microcobol> page = microcobolService.findMicrocobolByPage(
				pageNum, pageSize, map);
		return PageConvertUtil.grid(page);
	}
	@RequestMapping("/insertOrUpdate")
	@ResponseBody
	public Object insertOrUpdate( Microcobol microcobol){
		if(microcobol.getId()!=null){
			this.microcobolService.update(microcobol);
		}else{
			this.microcobolService.insert(microcobol);
		}
		return ResponseUtil.success();
	}
	@RequestMapping("/delete")
	@ResponseBody
	public Object delette(Integer id){
		this.microcobolService.delete(id);
		return ResponseUtil.success();
	}
	@RequestMapping("/load")
	@ResponseBody
	public Object load(Integer id){
		return this.microcobolService.load(id);
	}
	@RequestMapping("/click")
	@ResponseBody
	public Object click(Integer id){
		 this.microcobolService.click(id);
		 return ResponseUtil.success();
	}
	
	@InitBinder
    public void initBinder(ServletRequestDataBinder binder){
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"),
                true));
    }
	
}
