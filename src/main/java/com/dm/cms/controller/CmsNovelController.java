package com.dm.cms.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.cms.model.CmsNovel;
import com.dm.cms.service.CmsNovelService;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.ResponseUtil;
import com.github.pagehelper.PageInfo;

/**
 * 
 * @project com.dm.cms.controller.CmsNovelController.java
 * @author wjl
 * @createdate 2016年1月14日 上午11:08:16
 */
@Controller
@RequestMapping("/cms/novel")
public class CmsNovelController {

	@Autowired
	private CmsNovelService cmsNovelService;

	private Logger log = LoggerFactory.getLogger(CmsNovelController.class);

	@RequestMapping("/page")
	public String page() {
		return "/cms/novel/page";
	}

	@RequestMapping("load")
	@ResponseBody
	public Object load(Integer id) {
		if (id != null) {
			return this.cmsNovelService.findById(id);
		}
		return null;
	}

	@RequestMapping("/list")
	public @ResponseBody
	Object list(
			@RequestParam(value = "pageNum", required = false) Integer pageNum,
			@RequestParam(value = "pageSize", required = false) Integer pageSize,
			CmsNovel cmsNovel,
			@RequestParam(value = "sort", required = false) String sort) {
		if(sort==null || sort.equals("")){
			sort ="seq DESC,publish_date DESC";
		}
		Map argMap = new HashMap();
		argMap.put("model", cmsNovel);
		argMap.put("order",sort);
		PageInfo<CmsNovel> page = cmsNovelService.findCmsNovelByPage(pageNum,
				pageSize, argMap);
		return PageConvertUtil.grid(page);
	}

	@RequestMapping("insertOrUpdate")
	@ResponseBody
	public Object insertOrUpdate(
			CmsNovel cmsNovel,
			@RequestParam(value = "attachmentIds", required = false) String attachmentIds) {
		if (cmsNovel.getId() == null) {
			insert(cmsNovel);
			cmsNovelService.insertAttachment(cmsNovel.getId(), attachmentIds);
		} else {
			update(cmsNovel);
			cmsNovelService.updateAttachment(cmsNovel.getId(), attachmentIds);
		}
		return ResponseUtil.success("操作成功！");
	}

	private void update(CmsNovel cmsNovel) {
		cmsNovel.setStatus("0");
		this.cmsNovelService.updateCmsNovel(cmsNovel);

	}

	private void insert(CmsNovel cmsNovel) {
		this.cmsNovelService.insertCmsNovel(cmsNovel);

	}

	@RequestMapping("delete")
	@ResponseBody
	public Object delete(String novelIds,HttpServletRequest request) {
		this.cmsNovelService.delete(novelIds,request);
		return ResponseUtil.success("操作成功！");
	}

	@RequestMapping("commit")
	@ResponseBody
	public Object commit(String novelIds) {
        int num = cmsNovelService.updateStatus(novelIds, "1",null);
		return ResponseUtil.success("成功提交"+num+"条");
	}

	@RequestMapping("check")
	@ResponseBody
	public Object check(@RequestParam("novelIds") String novelIds,String status,HttpServletRequest request) {
        String novelIdArray[] = novelIds.split(",");
        int num = cmsNovelService.updateStatus(novelIds,status,request);
        if(status.equals("2"))
        {
		 return ResponseUtil.success("成功发布"+num+"条");
        }
        else
        {
        	return ResponseUtil.success("已驳回"+num+"条");
        }
	}

	@RequestMapping("sort")
	@ResponseBody
	public Object sort(
			@RequestParam(value = "id", required = true) Integer novelId,
			@RequestParam(value = "seq", required = true) Integer seq) {
		this.cmsNovelService.sort(novelId, seq);
		return ResponseUtil.success("操作成功");
	}

	@RequestMapping("/cutTo")
	public @ResponseBody
	Object cutTo(
			@RequestParam(value = "ids", required = true) String novelIds,
			Long channelId) {
		try {
			if (novelIds == null || novelIds.trim().equals("")) {
				return ResponseUtil.error("请选择要移动的内容！");
			}
			String[] id = novelIds.split(",");
			for (int i=id.length-1;i>=0;i--) {
				String novelId = id[i];
				CmsNovel novel = this.cmsNovelService.findById(Integer
						.valueOf(novelId));
				if (novel.getChannelId().intValue() == channelId.intValue()) {
					continue;
				}
				novel.setChannelId(channelId.intValue());
				novel.setStatus("0");
				cmsNovelService.updateCmsNovel(novel);
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
			@RequestParam(value = "ids", required = true) String novelIds,
			String channelId) {
		if (channelId == null || channelId.equals("")) {
			return ResponseUtil.error("请选择频道！");
		}
		if (novelIds == null || novelIds.equals("")) {
			return ResponseUtil.error("请选择要复制的内容！");
		}
		String[] novelids = novelIds.split(",");
		for (int i=novelids.length-1;i>=0;i--) {
			String novelId = novelids[i];
			CmsNovel cmsNovel = this.cmsNovelService.findById(Integer.valueOf(novelId));
			String[] channelids = channelId.split(",");
			for (String cId : channelids) {
				try {
					if (cmsNovel.getChannelId().intValue() == Integer.valueOf(
							cId).intValue()) {
						continue;
					} else {
						CmsNovel novel = new CmsNovel();
						BeanUtils.copyProperties(cmsNovel, novel);
						novel.setChannelId(Integer.valueOf(cId));
						novel.setStatus("0");
						novel.setId(null);
						this.cmsNovelService.insertCmsNovel(novel);
						this.cmsNovelService.insertAttachment(novel.getId(),cmsNovel.getAttachmentIds());
					}
				} catch (Exception e) {
					log.error("复制出错{}",e.getMessage());
					return ResponseUtil.error("复制失败！");
				}
			}
		}
		return ResponseUtil.success("复制成功！");
	}
}
