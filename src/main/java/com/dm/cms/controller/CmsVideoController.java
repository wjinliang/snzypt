package com.dm.cms.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;







import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.cms.model.CmsVideo;
import com.dm.cms.service.CmsAttachmentOtherService;
import com.dm.cms.service.CmsVideoService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SqlParam;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/cms/video")
public class CmsVideoController {
	
	@Value("${resource.basePath}") String resourceBasePath;
  
    @Value("${htmlDir}") String htmlFolder;
	
	
	@Autowired
	CmsVideoService cmsVideoService;
	  @Autowired CmsAttachmentOtherService cmsAttachmentOtherService;
	  @InitBinder
	    public void initBinder(ServletRequestDataBinder binder){
	        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"),
	                true));
	    }
	@RequestMapping("/page")
	public String page() {
		return "/cms/video/page";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/list")
	@ResponseBody
	public Map list(@RequestParam(value = "pageNum", required = false) Integer pageNum,@RequestParam(value = "sort", required = false) String sort,
			@RequestParam(value = "pageSize", required = false) Integer pageSize,CmsVideo cmsVideo) {
		if (cmsVideo.getChannelId()== null)
			return PageConvertUtil.emptyGrid();
		Map map = new SqlParam<CmsVideo>().autoParam(cmsVideo, sort);
		if(sort==null|| sort.equals("")){
			map.put("order","seq desc,publish_date desc");
		}
		map.put("model", cmsVideo);
		PageInfo<CmsVideo> page = cmsVideoService.findBychannelIdArgMap(map,pageNum,pageSize);
		return PageConvertUtil.grid(page);
	}
	
	@RequestMapping("/insertOrUpdate")
	@ResponseBody
	public Map insertOrUpdate(CmsVideo cmsVideo) {
		cmsVideoService.insertOrUpdate(cmsVideo);
		return ResponseUtil.success("操作成功");
	}
	@RequestMapping("/saveAndCommit")
	@ResponseBody
	public Map saveAndCommit(CmsVideo cmsVideo) {
		cmsVideoService.insertOrUpdate(cmsVideo);
		cmsVideoService.commit(cmsVideo.getId().toString());
		return ResponseUtil.success("提交成功");
	}
	@RequestMapping("/saveAndPublish")
	@ResponseBody
	public Map saveAndPublish(CmsVideo cmsVideo,HttpServletRequest request) {
		cmsVideoService.insertOrUpdate(cmsVideo);
		cmsVideoService.updateStatus(2,cmsVideo.getId().toString(),request);
		return ResponseUtil.success("发布成功");
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Map delete(String videoIds,HttpServletRequest request) {
		cmsVideoService.deleteByIds(videoIds,request);
		return ResponseUtil.success("操作成功");
	}
	
	@RequestMapping("/check")
	@ResponseBody
	public Map check(@RequestParam(value = "videoIds", required = true)String videoIds,
			@RequestParam(value = "status", required = true) Integer status,HttpServletRequest request) {
		
		int num = cmsVideoService.updateStatus(status,videoIds,request);
		String result="";
		if(status==2)
		{
			result="成功发布"+num+"条!";
		}
		else
		{
			result="已经驳回"+num+"条";
		}
		return ResponseUtil.success(result);
	}
	
	@RequestMapping("/load")
	@ResponseBody
	public CmsVideo load(Integer videoId) {
		
		CmsVideo cmsVideo =  cmsVideoService.findOne(videoId);
		cmsVideo.setAttachmentIds(cmsVideoService.selectAttachmentByVideoId(videoId));
		return cmsVideo;
	}
	
	@RequestMapping("/commit")
	@ResponseBody
	public Map commit(String videoIds) {
		int num = cmsVideoService.commit(videoIds);
		return ResponseUtil.success("成功提交"+num+"条");
	}
	@RequestMapping("sort")
	@ResponseBody
	public Object sort(
			@RequestParam(value = "id", required = true) Integer videoId,
			@RequestParam(value = "seq", required = true) Integer seq) {
	    this.cmsVideoService.sort(videoId, seq);
		return ResponseUtil.success("操作成功");
	}

	@RequestMapping("/cutTo")
	public @ResponseBody
	Object cutTo(
			@RequestParam(value = "ids", required = true) String videoIds,
			Long channelId) {
		try {
			if (videoIds == null || videoIds.trim().equals("")) {
				return ResponseUtil.error("请选择要移动的内容！");
			}
			String[] id = videoIds.split(",");
			for (int i=id.length-1;i>=0;i--) {
				String videoId = id[i];
				CmsVideo video = this.cmsVideoService.findOne(Integer
						.valueOf(videoId));
				if (video.getChannelId().intValue() == channelId.intValue()) {
					continue;
				}
				video.setChannelId(channelId.intValue());
				video.setStatus(0);
				cmsVideoService.insertOrUpdate(video);
			}
			return ResponseUtil.success("移动成功！");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseUtil.error("移动失败！");
		}
	}

	/**
	 * 复制到某频道
	 * 
	 * @param contentId
	 * @param channelId
	 * @return
	 */
	@RequestMapping("/copyTo")
	public @ResponseBody
	Object copyTo(
			@RequestParam(value = "ids", required = true) String videoIds,
			String channelId) {
		if (channelId == null || channelId.equals("")) {
			return ResponseUtil.error("请选择频道！");
		}
		if (videoIds == null || videoIds.equals("")) {
			return ResponseUtil.error("请选择要复制的内容！");
		}
		String[] videoids = videoIds.split(",");
		for (int i=videoids.length-1;i>=0;i--) {
			String videoId = videoids[i];
			CmsVideo cmsNovel = this.cmsVideoService.findOne(Integer.valueOf(videoId));
			String[] channelids = channelId.split(",");
			for (String cId : channelids) {
				try {
					if (cmsNovel.getChannelId().intValue() == Integer.valueOf(
							cId).intValue()) {
						continue;
					} else {
						CmsVideo video = new CmsVideo();
						BeanUtils.copyProperties(cmsNovel, video);
						video.setChannelId(Integer.valueOf(cId));
						video.setStatus(0);
						video.setId(null);
						this.cmsVideoService.insertOrUpdate(video);
					}
				} catch (Exception e) {
					e.printStackTrace();
					return ResponseUtil.error("复制失败！");
				}
			}
		}
		return ResponseUtil.success("复制成功！");
	}
	
}
