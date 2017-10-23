package com.dm.cms.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.cms.model.CmsAudio;
import com.dm.cms.service.CmsAttachmentOtherService;
import com.dm.cms.service.CmsAudioService;
import com.dm.cms.service.CmsChannelService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SqlParam;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/cms/audio")
public class CmsAudioController {

	@Value("${resource.basePath}") String resourceBasePath;
  
    @Value("${htmlDir}") String htmlFolder;
	
	@Autowired
	CmsAudioService cmsAudioService;
	  @Autowired CmsAttachmentOtherService cmsAttachmentOtherService;
	
	@RequestMapping("/page")
	public String page() {
		return "/cms/audio/page";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Map list(@RequestParam(value = "pageNum", required = false) Integer pageNum,@RequestParam(value = "sort", required = false) String sort,
			@RequestParam(value = "pageSize", required = false) Integer pageSize,CmsAudio cmsAudio) {
		if (cmsAudio.getChannelId()== null)
			return PageConvertUtil.emptyGrid();
		Map map = new SqlParam<CmsAudio>().autoParam(cmsAudio, sort);
		if(sort==null||sort.equals("")){
			map.put("order", "seq desc,publish_date desc");
		}
		map.put("model", cmsAudio);
		PageInfo<CmsAudio> page = cmsAudioService.findBychannelIdArgMap(map,pageNum,pageSize);
		return PageConvertUtil.grid(page);
	}
	
	@RequestMapping("/insertOrUpdate")
	@ResponseBody
	public Map insertOrUpdate(CmsAudio cmsAudio) {
		cmsAudioService.insertOrUpdate(cmsAudio);
		return ResponseUtil.success("操作成功");
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Map delete(String audioIds,HttpServletRequest request) {
		cmsAudioService.deleteByIds(audioIds,request);
		return ResponseUtil.success("操作成功");
	}
	
	@RequestMapping("/load")
	@ResponseBody
	public CmsAudio load(Integer audioId) {
		CmsAudio cmsAudio =  cmsAudioService.findOne(audioId);
		cmsAudio.setAttachmentIds(cmsAudioService.selectAttachmentByAudioId(audioId));
		return cmsAudio;
	}
	
	@RequestMapping("/commit")
	@ResponseBody
	public Map commit(String audioIds) {
		int num = cmsAudioService.commit(audioIds);
		return ResponseUtil.success("成功提交"+num+"条");
	}
	
	@RequestMapping("sort")
	@ResponseBody
	public Object sort(
			@RequestParam(value = "id", required = true) Integer audioId,
			@RequestParam(value = "seq", required = true) Integer seq) {
		this.cmsAudioService.sort(audioId, seq);
		return ResponseUtil.success("操作成功");
	}

	@RequestMapping("/cutTo")
	public @ResponseBody
	Object cutTo(
			@RequestParam(value = "ids", required = true) String audioIds,
			Long channelId) {
		try {
			if (audioIds == null || audioIds.trim().equals("")) {
				return ResponseUtil.error("请选择要移动的内容！");
			}
			String[] id = audioIds.split(",");
			for (int i=id.length-1;i>=0;i--) {
				String audioId = id[i];
				CmsAudio audio = this.cmsAudioService.findOne(Integer
						.valueOf(audioId));
				if (audio.getChannelId().intValue() == channelId.intValue()) {
					continue;
				}
				audio.setChannelId(channelId.intValue());
				audio.setStatus(0);
				String attachmentIds = cmsAudioService.selectAttachmentByAudioId(audio.getId());
				audio.setAttachmentIds(attachmentIds);
				cmsAudioService.insertOrUpdate(audio);
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
			@RequestParam(value = "ids", required = true) String audioIds,
			String channelId) {
		if (channelId == null || channelId.equals("")) {
			return ResponseUtil.error("请选择频道！");
		}
		if (audioIds == null || audioIds.equals("")) {
			return ResponseUtil.error("请选择要复制的内容！");
		}
		String[] audioids = audioIds.split(",");
		for (int i=audioids.length-1;i>=0;i--) {
			String audioId = audioids[i];
			CmsAudio cmsAudio = this.cmsAudioService.findOne(Integer.valueOf(audioId));
			String[] channelids = channelId.split(",");
			for (String cId : channelids) {
				try {
					if (cmsAudio.getChannelId().intValue() == Integer.valueOf(
							cId).intValue()) {
						continue;
					} else {
						CmsAudio audio = new CmsAudio();
						BeanUtils.copyProperties(cmsAudio, audio);
						audio.setChannelId(Integer.valueOf(cId));
						audio.setStatus(0);
						audio.setId(null);
						String attachmentIds = cmsAudioService.selectAttachmentByAudioId(cmsAudio.getId());
						audio.setAttachmentIds(attachmentIds);
						this.cmsAudioService.insertOrUpdate(audio);
					}
				} catch (Exception e) {
					e.printStackTrace();
					return ResponseUtil.error("复制失败！");
				}
			}
		}
		return ResponseUtil.success("复制成功！");
	}
	@RequestMapping("/check")
	@ResponseBody
	public Map check(@RequestParam(value = "audioIds", required = true)String videoIds,
			@RequestParam(value = "status", required = true) Integer status,HttpServletRequest request) {
		
		int num = cmsAudioService.updateStatus(status,videoIds,request);
		String result = "";
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
}
