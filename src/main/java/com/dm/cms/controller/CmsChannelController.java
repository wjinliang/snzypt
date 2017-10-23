package com.dm.cms.controller;

import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsSiteService;
import com.dm.platform.dto.TreeNode;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.PageUtil;
import com.dm.platform.util.RequestUtil;
import com.dm.platform.util.ResponseUtil;
import com.mysql.jdbc.log.LogFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by cgj on 2015/11/24.
 */

@Controller
@RequestMapping("/cms/channel")
public class CmsChannelController {
	
	private Logger log = LoggerFactory.getLogger(CmsChannelController.class);
	
	@Autowired
	CmsChannelService cmsChannelService;
	@Autowired
	CmsSiteService cmsSiteService;

	@RequestMapping("/page")
	public String page(Model model) {
		return "/cms/channel/page";
	}

	@RequestMapping("/tree")
	public @ResponseBody
	Object treeJsonBySiteId(
			@RequestParam(value = "siteId", required = true) Integer siteId,
			@RequestParam(value = "channelType", required = false) String channelType,
			@RequestParam(value = "filterContent" ,required = false) String isfilter) {
		List<TreeNode> treeNodes = cmsChannelService
				.findCmsChannelTreeNodeBySiteId(siteId,channelType,isfilter);
		return treeNodes;
	}
	

	@RequestMapping("/load")
	public @ResponseBody
	Object load(
			@RequestParam(value = "channelId", required = true) Integer channelId) {
		return cmsChannelService.findOneById(channelId);
	}
	@RequestMapping("/list")
	public @ResponseBody
	Object list(
			@RequestParam(value = "pageNum", required = false) Integer pageNum,
			@RequestParam(value = "pageSize", required = false) Integer pageSize,
			CmsChannel cmsChannel) {
		if (cmsChannel.getSiteId() == null && cmsChannel.getId() == null)
			return PageConvertUtil.emptyGrid();
		return PageConvertUtil.grid(cmsChannelService.findCmsChannelByPage(
				pageNum, pageSize, cmsChannel));
	}

	@RequestMapping("/insertOrUpdate")
	public @ResponseBody
	Object insertOrUpdate(CmsChannel cmsChannel) {
		if (cmsChannel.getId() == null)
			insertChannel(cmsChannel);
		else{
			updateChannel(cmsChannel);
		}
		return ResponseUtil.success("操作成功");
	}

	private void insertChannel(CmsChannel cmsChannel) {
		// TODO 逻辑验证
		CmsSite cmsSite = cmsSiteService.findOneById(cmsChannel.getSiteId());
		cmsChannel.setSiteDomain(cmsSite.getDomain());
		cmsChannelService.insertCmsChannel(cmsChannel);
	}

	private void updateChannel(CmsChannel cmsChannel) {
		// TODO 逻辑验证
		CmsSite cmsSite = cmsSiteService.findOneById(cmsChannel.getSiteId());
		cmsChannel.setSiteDomain(cmsSite.getDomain());
		cmsChannelService.updateCmsChannel(cmsChannel,true);
	}

    
    @RequestMapping("/generatorHtml")
    @ResponseBody
    public Object generatorHtml(int channelId,HttpServletRequest request) {
        //TODO 逻辑验证
       log.info(String.valueOf(channelId));
       log.debug("{}",request);
       boolean success = cmsChannelService.generateHtml(request, channelId);
       if(success)
       return ResponseUtil.success("静态化成功！");
       else
    	 return ResponseUtil.error("静态化失败");
    }
    
    @RequestMapping("/delete")
    public @ResponseBody Object delete(@RequestParam(value = "ids",required=true)String ids){
    	List<String> channelIds = Arrays.asList(ids.split(","));
    	for(String id : channelIds){
    		if(id!=null&&!id.equals("")){
    			Integer channelId = Integer.parseInt(id);
    			List<Integer> list =this.cmsChannelService.selectChildChannelIdList(channelId);
    			if(list.size()>0)
    				return ResponseUtil.error("删除失败，请先删除该频道的子频道!");
    			this.cmsChannelService.deleteCmsChannel(channelId);
    		}
    	}
    	return ResponseUtil.success("操作成功");
    }

	@RequestMapping("sort")
	@ResponseBody
	public Object sort(@RequestParam(value = "id", required = true) Integer id,
			@RequestParam(value = "pid", required = true) Integer pid,
			@RequestParam(value = "moveType", required = true)String moveType,
			@RequestParam(value = "targetId", required = true) Integer targetId) {
		return this.cmsChannelService.sort(id,targetId,pid,moveType);
	}
	
	 @RequestMapping("/cancelGeneratorHtml")
	    public @ResponseBody Object cancelGeneratorHtml(HttpServletRequest request,Integer channelId) {
	        boolean status = cmsChannelService.cancelGeneratorHtml(channelId, request);
	        if(status)
	        {
	        	return ResponseUtil.success("取消静态化成功！");
	        }
	        else
	        {
	        	return ResponseUtil.error("取消静态化失败");
	        }
	    }
}
