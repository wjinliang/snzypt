package com.dm.cms.controller;

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

import com.dm.cms.model.CmsQuestionnaires;
import com.dm.cms.service.CmsQuestionnairesService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SqlParam;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/cms/questionnares")
public class CmsQuestionnairesController {

	@Autowired
	private CmsQuestionnairesService qustionnairesService;
	
	@RequestMapping("/page")
	public String page(){
		return "/module/questionnaires/page";
	}
	
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Object list(
			CmsQuestionnaires microcobol,
			@RequestParam(value = "pageNum", required = false) Integer pageNum,
			@RequestParam(value = "pageSize", required = false) Integer pageSize,
			@RequestParam(value = "sort", required = false) String sort) {
		Map map = new SqlParam<CmsQuestionnaires>().autoParam(microcobol, sort);
		map.put("model", microcobol);
		PageInfo<CmsQuestionnaires> page = qustionnairesService.findByPage(
				pageNum, pageSize, map);
		return PageConvertUtil.grid(page);
	}
	@RequestMapping("/insertOrUpdate")
	@ResponseBody
	public Object insertOrUpdate( CmsQuestionnaires microcobol){
		if(microcobol.getId()!=null){
			this.qustionnairesService.update(microcobol);
		}else{
			this.qustionnairesService.insert(microcobol);
		}
		return ResponseUtil.success();
	}
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(Integer id){
		this.qustionnairesService.delete(id);
		return ResponseUtil.success();
	}
	@RequestMapping("/load")
	@ResponseBody
	public Object load(Integer id){
		return this.qustionnairesService.load(id);
	}
	
	@RequestMapping("/check")
	@ResponseBody
	public Object publish(Integer id,String status){
		this.qustionnairesService.updateStatus(id,status);
		return ResponseUtil.success("操作成功");
	}
	
	@InitBinder
    public void initBinder(ServletRequestDataBinder binder){
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"),
                true));
    }
	
}
