package com.dm.cms.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.cms.model.CmsFriendlink;
import com.dm.cms.service.CmsFriendlinkService;
import com.dm.cms.service.CmsSiteService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;

@Controller
@RequestMapping("/cms/friendlink")
public class CmsFriendlinkController {
	@Autowired
	private CmsFriendlinkService cmsFriendlinkService;
	@Autowired
	private CmsSiteService cmsSiteService;
	
	@RequestMapping("/page")
	public String page(){
		return "cms/friendlink/page";
	}
	@RequestMapping("/list")
	@ResponseBody
	public Object list(@RequestParam(value = "pageNum", required = false,defaultValue="1") Integer pageNum,
			@RequestParam(value = "pageSize", required = false,defaultValue="5") Integer pageSize,
			CmsFriendlink cmsFriendlink) {
		if (cmsFriendlink.getSiteId() == null && cmsFriendlink.getId() == null)
			return PageConvertUtil.emptyGrid();
		return PageConvertUtil.grid(cmsFriendlinkService.findCmsFriendlinkByPage(
				pageNum, pageSize, cmsFriendlink));
		
	}
	@RequestMapping("/load")
	@ResponseBody
	public Object load(Integer id){
		return this.cmsFriendlinkService.loadById(id);
	}
	@RequestMapping("/insertOrUpdate")
	@ResponseBody
	public Object insertOrUpdate(CmsFriendlink cmsFriendlink,HttpServletRequest request){
		if(cmsFriendlink.getId()==null){
			this.cmsFriendlinkService.insert(cmsFriendlink);
		}else{
			this.cmsFriendlinkService.update(cmsFriendlink);
		}
		this.generatorIndexHtml(cmsFriendlink.getSiteId().intValue(), request);
		return ResponseUtil.success("操作成功!");
	}
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(Integer id,HttpServletRequest request){
		CmsFriendlink cmsFriendlink = this.cmsFriendlinkService.loadById(id);
		this.cmsFriendlinkService.delete(id);
		this.generatorIndexHtml(cmsFriendlink.getSiteId().intValue(), request);
		return ResponseUtil.success("操作成功!");
	}
	@RequestMapping("/setshow")
	@ResponseBody
	public Object setShow(Long id,HttpServletRequest request){
		CmsFriendlink cmsFriendlink = this.cmsFriendlinkService.loadById(id.intValue());
		this.cmsFriendlinkService.setIsShow(id);
		this.generatorIndexHtml(cmsFriendlink.getSiteId().intValue(),request);
		return ResponseUtil.success();
	}
	private void generatorIndexHtml(Integer siteId,HttpServletRequest request) {
		boolean status = cmsSiteService.generatorHtml(siteId, request);
		
	}
}
