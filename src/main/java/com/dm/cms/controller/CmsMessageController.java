package com.dm.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.cms.model.CmsMessage;
import com.dm.cms.model.CmsReply;
import com.dm.cms.service.CmsMessageService;
import com.dm.platform.model.UserAccount;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.UserAccountUtil;

@Controller
@RequestMapping("/cms/message")
public class CmsMessageController {

	@Autowired
	private CmsMessageService cmsMessageService;
	@Value("${cmsMessageIsNeedLogin}")
	private Boolean cmsMessageIsNeedLogin;
	
	@RequestMapping("/page")
	public String page(){
		return "/cms/message/page";
	}
	@RequestMapping("/list")
	@ResponseBody
	public Object list(
			@RequestParam(value = "pageNum", required = false) Integer pageNum,
			@RequestParam(value = "pageSize", required = false) Integer pageSize,
			CmsMessage cmsMessage) {
		if (cmsMessage.getSiteId() == null )
			return PageConvertUtil.emptyGrid();
		return PageConvertUtil.grid(cmsMessageService.findCmsMessageByPage(
				pageNum, pageSize, cmsMessage));
	}
	@RequestMapping("/load")
	@ResponseBody
	public Object load(String msgId){
		return this.cmsMessageService.loadOneInfo(msgId);
	}
	@RequestMapping("/reply")
	@ResponseBody
	public Object reply(CmsReply cmsReply){
		this.cmsMessageService.reply(cmsReply);
		return ResponseUtil.success("操作成功");
	}
	@RequestMapping("/msg")
	@ResponseBody
	public Object protalList(
			@RequestParam(value = "pageNum", required = false,defaultValue="1") Integer pageNum,
			@RequestParam(value = "pageSize", required = false,defaultValue="10") Integer pageSize,
			CmsMessage cmsMessage) {
		if (cmsMessage.getSiteId() == null && cmsMessage.getId() == null)
			return PageConvertUtil.emptyGrid();
		return PageConvertUtil.grid(cmsMessageService.findCmsMessageByPageInfo(
				pageNum, pageSize, cmsMessage));
	}
	@RequestMapping("/add")
	@ResponseBody
	public Object add(CmsMessage cmsMessage){
		if(cmsMessageIsNeedLogin){
			UserAccount user = UserAccountUtil.getInstance().getCurrentUserAccount();
			if(user==null){
				return ResponseUtil.error("登录后才能留言哦!");
			}
			cmsMessage.setMsgFromUserId(user.getCode());
		}
		this.cmsMessageService.insert(cmsMessage);
		return ResponseUtil.success("操作成功");
	}
	@RequestMapping("/delete")
	@ResponseBody
	public Object delete(String ids){
		this.cmsMessageService.delete(ids);
		return ResponseUtil.success("操作成功");
	}
	@RequestMapping("/toread")
	@ResponseBody
	public Object toRead(String id){
		this.cmsMessageService.updateRead(id,CmsMessage.ISREAD_YES);
		return ResponseUtil.success("操作成功");
	}
	@RequestMapping("/tonotread")
	@ResponseBody
	public Object tonotRead(String id){
		this.cmsMessageService.updateRead(id,CmsMessage.ISREAD_NO);
		return ResponseUtil.success("操作成功");
	}
	@RequestMapping("/publish")
	@ResponseBody
	public Object publish(String id){
		this.cmsMessageService.updateStatus(id,CmsMessage.STATUS_PUBLISH);
		return ResponseUtil.success("操作成功");
	}
	
}
