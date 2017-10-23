package com.dm.api.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dm.cms.model.CmsAudio;
import com.dm.cms.model.CmsNovel;
import com.dm.cms.model.CmsVideo;
import com.dm.cms.service.CmsAudioService;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsCommentService;
import com.dm.cms.service.CmsNovelService;
import com.dm.cms.service.CmsStatisticService;
import com.dm.cms.service.CmsVideoService;
import com.dm.platform.dao.CommonDAO;
import com.dm.platform.model.UserAccount;
import com.dm.platform.model.UserAttrEntity;
import com.dm.platform.service.UserAccountService;
import com.dm.platform.service.UserAttrService;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SimpleCryptoUtil;
import com.dm.platform.util.UserAccountUtil;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/api/front")
public class CmsFrontCenterController {

	    @Autowired CmsCommentService commentService;
	    @Autowired CommonDAO commonDAO;
	    @Resource UserAccountService userAccountService;
	    @Resource UserAttrService userAttrService;
	    @Autowired
		CmsVideoService cmsVideoService;
	    @Autowired CmsChannelService cmsChannelService;
	    @Autowired CmsAudioService cmsAudioService;
	    @Autowired CmsNovelService cmsNovelService;
	    @Autowired CmsCommentService cmsCommentService;
	    @Autowired CmsStatisticService cmsStaticService;
	    

    @Value("${htmlDir}")
    String htmlFolder;
    
	
	 @RequestMapping("/infoCenter.htm")
	    public String infoCenter(Model model) {
		    UserAccount user = UserAccountUtil.getInstance().getCurrentUserAccount();
		    model.addAttribute("htmlFolder",htmlFolder);
		    if(user!=null)
		    {
		      UserAttrEntity userAttr = userAttrService.findOne(user.getCode());
		      model.addAttribute("userAttr", userAttr);
		      model.addAttribute("currentUser",user);
		      return "/template/frontCenterInfo";
		    }
		    return "/front/404";
	    }
	
	    @RequestMapping(value = "/updateUser") 
		@ResponseBody
	    public Map updateUser(UserAccount userAccount,String sex) {
			UserAccount user = userAccountService.findOne(userAccount.getCode());
			user.setUpdateTime(new Date());
			user.setEmail(userAccount.getEmail());
			user.setName(userAccount.getName());
			user.setMobile(userAccount.getMobile());
			UserAttrEntity userAttr = userAttrService.findOne(user.getCode());
			userAttr.setGender(sex);
			ShaPasswordEncoder sha = new ShaPasswordEncoder();
			sha.setEncodeHashAsBase64(false);
			userAccount.setPassword(sha.encodePassword(
					userAccount.getPassword(), null));
		    userAccountService.updateUser(user);
		    userAttrService.update(userAttr);
	        return ResponseUtil.success("更新成功！");
	    }
	    
	    @RequestMapping(value = "/changePassword") 
		@ResponseBody
	    public Map changePassword(UserAccount userAccount) {
			UserAccount user = userAccountService.findOne(userAccount.getCode());
			user.setUpdateTime(new Date());
			ShaPasswordEncoder sha = new ShaPasswordEncoder();
			sha.setEncodeHashAsBase64(false);
			user.setPassword(sha.encodePassword(
					userAccount.getPassword(), null));
		    userAccountService.updateUser(user);
	        return ResponseUtil.success("更新成功！");
	    }
	    
	    @RequestMapping(value = "/videoPage") 
	    public String  videoPage(Model model,Integer pageNum,Integer pageSize) {
	    	UserAccount user = UserAccountUtil.getInstance().getCurrentUserAccount();
	    	model.addAttribute("htmlFolder",htmlFolder);
		    	if(user!=null)
		    	{
	    	        return "/template/video_main_page"; 
         	    }
				   return "/front/404";
	    }
	    
	    @RequestMapping(value = "/audioPage") 
	    public String  audioPage(Model model,Integer pageNum,Integer pageSize) {
	    	UserAccount user = UserAccountUtil.getInstance().getCurrentUserAccount();
	    	model.addAttribute("htmlFolder",htmlFolder);
		    	if(user!=null)
		    	{
	    	        return "/template/audio_main_page"; 
         	    }
				return "/front/404";
	    }
	    
	    @RequestMapping(value = "/novelPage") 
	    public String  novelPage(Model model,Integer pageNum,Integer pageSize) {
	    	UserAccount user = UserAccountUtil.getInstance().getCurrentUserAccount();
	    	model.addAttribute("htmlFolder",htmlFolder);
		    	if(user!=null)
		    	{
	    	        return "/template/novel_main_page"; 
         	    }
				return "/front/404";
	    }
	    
	    @RequestMapping(value = "/uploadPage") 
	    public String  uploadPage(Model model,String channelType) {
	    	UserAccount user = UserAccountUtil.getInstance().getCurrentUserAccount();
	    	model.addAttribute("htmlFolder",htmlFolder);
	    	model.addAttribute("types", cmsChannelService.findAllByRoot(channelType));
		    	if(user!=null)
		    	{
		    		if(channelType.equals("5"))
		    		{
		    			 return "/template/video_upload_page";
		    		}
		    		else if(channelType.equals("6"))
		    		{
		    			 return "/template/audio_upload_page";
		    		}
		    		else
		    		{
		    			 return "/template/novel_upload_page";
		    		}
	    	       
         	    }
				   return "/front/404";
	    }
	    
	    @RequestMapping(value = "/saveVideo") 
	    public String videoUpload(CmsVideo cmsVideo) {
	    	UserAccount user = UserAccountUtil.getInstance().getCurrentUserAccount();
	    	if(user!=null)
	    	{
	        cmsVideo.setCreateUserId(user.getCode());		
	    	cmsVideoService.insertOrUpdate(cmsVideo);
	    	}
	    	return "redirect:videoPage";
	    }
	    
	    @RequestMapping(value = "/saveAudio") 
	    public String saveAudio(CmsAudio cmsAudio) {
	    	UserAccount user = UserAccountUtil.getInstance().getCurrentUserAccount();
	    	if(user!=null)
	    	{
	    	cmsAudio.setCreateUserId(user.getCode());		
	    	cmsAudioService.insertOrUpdate(cmsAudio);
	    	}
	    	return "redirect:audioPage";
	    }
	    

	    @RequestMapping(value = "/saveNovel") 
	    public String saveNovel(CmsNovel cmsNovel) {
	    	UserAccount user = UserAccountUtil.getInstance().getCurrentUserAccount();
	    	if(user!=null)
	    	{
	    	cmsNovel.setCreateUserId(user.getCode());		
	    	cmsNovelService.insertCmsNovel(cmsNovel);
	    	cmsNovelService.insertAttachment(cmsNovel.getId(), cmsNovel.getAttachmentIds());
	    	}
	    	return "redirect:novelPage";
	    }
	    
	    @RequestMapping(value = "/checkOrDelete") 
		@ResponseBody
	    public Map checkOrDelete(Integer id,String type,String channelType,HttpServletRequest request) {
	    	if(channelType.equals("5"))
	    	{
		    	if(type.equals("check"))
		    	{
			    	cmsVideoService.commit(id.toString());
		    	}
		    	else
		    	{
		    		if(type.equals("delete"))
			    	{
				    	cmsVideoService.deleteByIds(id.toString(),request);
			    	}
		    	}
	    	}
	    	else if(channelType.equals("6"))
	    	{
	    		if(type.equals("check"))
		    	{
			    	cmsAudioService.commit(id.toString());
		    	}
		    	else
		    	{
		    		if(type.equals("delete"))
			    	{
		    			cmsAudioService.deleteByIds(id.toString(),request);
			    	}
		    	}
	    	}
	    	else if(channelType.equals("7"))
	    	{
	    		if(type.equals("check"))
		    	{
			    	cmsNovelService.updateStatus(id.toString(), "1", request);
		    	}
		    	else
		    	{
		    		if(type.equals("delete"))
			    	{
		    			cmsNovelService.delete(id.toString(),request);
			    	}
		    	}
	    	}
			return ResponseUtil.success("操作成功");
	    }
	    
	    @RequestMapping(value = "/videoList") 
	    public List<CmsVideo> videoList(Model model,Integer pageNum,Integer pageSize) {
	    	UserAccount user = UserAccountUtil.getInstance().getCurrentUserAccount();
	    	pageNum = pageNum==null?1:pageNum;
	    	pageSize = pageSize==null?pageSize:8;
	    	model.addAttribute("htmlFolder",htmlFolder);
	    	if(user!=null)
	    	{
	    		CmsVideo video = new CmsVideo();
	    		video.setCreateUserId(user.getCode());
	    		Map map = new HashMap();
	    		map.put("model", video);
	    		return cmsVideoService.findBychannelIdArgMap(map, pageNum, pageSize).getList();
	    	}
			return null;
	    }
	    
	    @RequestMapping(value = "/videoContent") 
	    public String videoContent(Model model,Integer pageNum,Integer pageSize) {
	    	UserAccount user = UserAccountUtil.getInstance().getCurrentUserAccount();
	    	pageNum = pageNum==null?1:pageNum;
	    	pageSize = pageSize==null?8:pageSize;
		    	if(user!=null)
		    	{
		    		CmsVideo video = new CmsVideo();
		    		video.setCreateUserId(user.getCode());
		    		Map map = new HashMap();
		    		map.put("model", video);
		    		map.put("order","id desc");
		    		PageInfo<CmsVideo> page = cmsVideoService.findBychannelIdArgMap(map, pageNum, pageSize);
		    		model.addAttribute("page", page);
	    	        return "/template/load_videos"; 
         	    }
				   return "/front/404";
	    }
	    
	    @RequestMapping(value = "/audioContent") 
	    public String audioContent(Model model,Integer pageNum,Integer pageSize) {
	    	UserAccount user = UserAccountUtil.getInstance().getCurrentUserAccount();
	    	pageNum = pageNum==null?1:pageNum;
	    	pageSize = pageSize==null?10:pageSize;
		    	if(user!=null)
		    	{
		    		CmsAudio audio = new CmsAudio();
		    		audio.setCreateUserId(user.getCode());
		    		Map map = new HashMap();
		    		map.put("model", audio);
		    		map.put("order","id desc");
		    		PageInfo<CmsAudio> page = cmsAudioService.findBychannelIdArgMap(map, pageNum, pageSize);
		    		for(CmsAudio ce : page.getList())
		    		{
		    			int commentCount = cmsCommentService.selectCountByCmsContentId(ce.getId(),"6");
						int count = cmsStaticService.selectCountByContentId(ce.getId(), "6");
						ce.setCount(count);
						ce.setCommentCount(commentCount);
		    		}
		    		model.addAttribute("page", page);
	    	        return "/template/load_audios"; 
         	    }
				   return "/front/404";
	    }
	    

	    @RequestMapping(value = "/novelContent") 
	    public String novelContent(Model model,Integer pageNum,Integer pageSize) {
	    	UserAccount user = UserAccountUtil.getInstance().getCurrentUserAccount();
	    	pageNum = pageNum==null?1:pageNum;
	    	pageSize = pageSize==null?10:pageSize;
		    	if(user!=null)
		    	{
		    		CmsNovel audio = new CmsNovel();
		    		audio.setCreateUserId(user.getCode());
		    		Map map = new HashMap();
		    		map.put("model", audio);
		    		map.put("order","id desc");
		    		PageInfo<CmsNovel> page = cmsNovelService.findCmsNovelByPage(pageNum, pageSize,map);
		    		for(CmsNovel ce : page.getList())
		    		{
		    			int commentCount = cmsCommentService.selectCountByCmsContentId(ce.getId(),"7");
						int count = cmsStaticService.selectCountByContentId(ce.getId(), "7");
						ce.setCount(count);
						ce.setCommentCount(commentCount);
		    		}
		    		model.addAttribute("htmlFolder",htmlFolder);
		    		model.addAttribute("page", page);
	    	        return "/template/load_novels"; 
         	    }
				   return "/front/404";
	    }
}
