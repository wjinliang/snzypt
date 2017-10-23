package com.dm.questionsurvey.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SqlParam;
import com.dm.questionsurvey.model.FeedBack;
import com.dm.questionsurvey.model.QuestionnaireSuvery;
import com.dm.questionsurvey.service.FeedBackService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/feedBack")
public class FeedBackBehindController {
	@Autowired
	FeedBackService feedBackService;
	
	@RequestMapping("/page")
	public String list(){
		return "/app/feedBack/page";
	} 
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public Object list(
			FeedBack feedBack,
			@RequestParam(value = "pageNum", required = false) Integer pageNum,
			@RequestParam(value = "pageSize", required = false) Integer pageSize) {
		Map map = new SqlParam<FeedBack>().autoParam(feedBack,null);
		map.put("model", feedBack);
		PageInfo<FeedBack> page = feedBackService.findFeedBackByPage(
				pageNum, pageSize, map);
		return PageConvertUtil.grid(page);
	}
	@RequestMapping("/load")
	@ResponseBody
	public Object loadRecontent(Model model,String id)
	{
		return feedBackService.findOne(id);
	}
	@RequestMapping("/delete")
	@ResponseBody
	public Map update(Model model,String id)
	{
		feedBackService.delete(id);
		return ResponseUtil.success("操作成功！");
	}
	
}
