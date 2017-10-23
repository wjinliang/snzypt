package com.dm.cms.service.impl;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.dm.cms.handler.generatorHtmlHandler;
import com.dm.cms.model.CmsAttachmentOther;
import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsSite;
import com.dm.cms.model.CmsTemplate;
import com.dm.cms.model.CmsVideo;
import com.dm.cms.service.CmsAttachmentOtherService;
import com.dm.cms.service.CmsSiteService;
import com.dm.cms.service.CmsTemplateConfigService;
import com.dm.cms.service.CmsTemplateService;
import com.dm.cms.service.CmsVideoService;
import com.dm.cms.sqldao.CmsChannelMapper;
import com.dm.cms.sqldao.CmsSiteMapper;
import com.dm.cms.sqldao.CmsVideoMapper;
import com.dm.platform.util.UserAccountUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
/**
 * 
 * @project com.dm.cms.service.impl.CmsVideoServiceImpl.java
 * @author wjl
 * @createdate 2016年2月25日 上午10:21:26
 */
@Service
public class CmsVideoServiceImpl extends generatorHtmlHandler implements CmsVideoService {

	@Autowired
	CmsVideoMapper cmsVideoMapper;

	@Autowired
	CmsSiteMapper cmsSiteMapper;
	
	@Autowired
	CmsSiteService cmsSiteService;

	@Autowired
	CmsChannelMapper cmsChannelMapper;

	@Autowired
	CmsTemplateService cmsTemplateService;
	@Autowired
	CmsTemplateConfigService cmsTemplateConfigService;

	@Value("${htmlDir}")
	String htmlFolder;
	@Value("${template.mobileBasePath}")
	String mobileFolder;
	@Value("${template.basePath}")
	String templateFolder;

	@Autowired
	CmsAttachmentOtherService cmsAttachmentOtherService;
	
	private static final Logger log = LoggerFactory
			.getLogger(CmsContentServiceImpl.class);

	@Override
	public void insertOrUpdate(CmsVideo cmsVideo) {
		String attachmentIds = cmsVideo.getAttachmentIds();
		String url = null;
		/*if (attachmentIds != null && !attachmentIds.equals("")) {
			String attachmentIdArray[] = attachmentIds.split(",");
			CmsAttachmentOther cmsAttachmentOther = cmsAttachmentOtherService
					.findOneById(Integer.valueOf(attachmentIdArray[0]));
			url = cmsAttachmentOther.getAttachmentUrl();
		}*/
		if(cmsVideo.getVideoUrl()!=null){
			url = cmsVideo.getVideoUrl();
		}
		if (cmsVideo.getId() != null) {
			cmsVideoMapper.deleteAttachmentsByVideoId(cmsVideo.getId());
			cmsVideo.setUpdateTime(new Date());
			cmsVideo.setStatus(0);
			cmsVideo.setVideoUrl(url);
			cmsVideoMapper.updateByPrimaryKeySelective(cmsVideo);
		} else {
			String userId = UserAccountUtil.getInstance().getCurrentUserId();
			cmsVideo.setCreateUserId(userId);
			if(cmsVideo.getStatus()==null)
			{
			cmsVideo.setStatus(0);
			}
			cmsVideo.setVideoUrl(url);
			Map map = new HashMap();
			map.put("order", "seq desc,publish_date desc");
			CmsVideo video = new CmsVideo();
			video.setChannelId(cmsVideo.getChannelId());
			map.put("model", video);
			List<CmsVideo> list = findBychannelIdArgMap(map, 1, 1).getList();
			int seq = 1;
			if (list.size() > 0) {
				seq = list.get(0).getSeq()==null?1: list.get(0).getSeq()+ 1;
			}
			cmsVideo.setSeq(seq);
			if (cmsVideo.getTemplateId() == null) {// 设置默认模板
				cmsVideo.setTemplateId(cmsTemplateConfigService.load(null,
						cmsVideo.getChannelId()).getContentTemplateId());
			}
			cmsVideoMapper.insertSelective(cmsVideo);
		}
		insertAttachment(cmsVideo.getId(), cmsVideo.getAttachmentIds());
	}

	public void insertAttachment(Integer videoId, String attachmentIds) {
		if (attachmentIds == null || attachmentIds.equals("")) {
			return;
		}
		String attachmentArrays[] = attachmentIds.split(",");
		for (String attach : attachmentArrays) {
			cmsVideoMapper.insertAttachments(videoId, Integer.valueOf(attach));
		}
	}

	@Override
	public void deleteByIds(String ids,HttpServletRequest request) {
		if (ids == null || ids.equals("")) {
			return;
		}
		String[] idStr = ids.split(",");
		CmsVideo cmsVideo = cmsVideoMapper.selectByPrimaryKey(Integer.valueOf(idStr[0]));
		CmsChannel channel = cmsChannelMapper.selectByPrimaryKey(cmsVideo.getChannelId());
		for (String id : idStr) {
			cmsVideoMapper.deleteByPrimaryKey(Integer.valueOf(id));
			this.deleteAttachment(Integer.valueOf(id));
		}
		cmsSiteService.generatorHtml(channel.getSiteId(), request);
	}

	private void deleteAttachment(Integer id) {
		cmsVideoMapper.deleteAttachmentsByVideoId(id);
		String attachmentIds = selectAttachmentByVideoId(id);
		if (attachmentIds == null || attachmentIds.equals(""))
			return;
		String[] attachmentIdArray = attachmentIds.split(",");
		for (String attaId : attachmentIdArray) {
			String str = this.cmsVideoMapper
					.selectVideoIdsByAttachmentId(Integer.valueOf(attaId));
			if (str == null || str.equals(""))
				this.cmsAttachmentOtherService.delete(Integer.valueOf(attaId));
		}
	}

	@Override
	public CmsVideo findOne(Integer videoId) {
		CmsVideo cmsVideo = cmsVideoMapper.selectByPrimaryKey(videoId);
		String attachmentStr = selectAttachmentByVideoId(videoId);
		cmsVideo.setAttachmentIds(attachmentStr);
		return cmsVideo;
	}

	@Override
	public String selectAttachmentByVideoId(Integer videoId) {

		List<Integer> attachmentIds = cmsVideoMapper
				.selectAttachmentsByVideoId(videoId);
		String attachmentStr = "";
		if (attachmentIds.size() > 0) {
			for (Integer atta : attachmentIds) {
				attachmentStr += atta.toString() + ",";
			}
			attachmentStr = attachmentStr.substring(0,
					attachmentStr.length() - 1);
		}
		return attachmentStr;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public PageInfo<CmsVideo> findBychannelIdArgMap(Map map, Integer pageNum,
			Integer pageSize) {
		Integer channelId = ((CmsVideo) map.get("model")).getChannelId();
		if (channelId != null) {
			List<Integer> channelIds = cmsChannelMapper.selectByPId(channelId);
			channelIds.add(channelId);
			map.put("channelIds", channelIds);
		}
		PageHelper.startPage(pageNum, pageSize);
		List<CmsVideo> list = cmsVideoMapper.findBychannelIdArgMap(map);
		PageInfo<CmsVideo> page = new PageInfo<CmsVideo>(list);
		return page;
	}

	@Override
	public int commit(String videoIds) {
		String videoIdsArray[] = videoIds.split(",");
		int num = 0;
		for (String str : videoIdsArray) {
			CmsVideo cmsVideo = cmsVideoMapper.selectByPrimaryKey(Integer
					.valueOf(str));
			cmsVideo.setStatus(1);
			cmsVideoMapper.updateByPrimaryKey(cmsVideo);
			num++;
		}
		return num;
	}

	@Override
	public void sort(Integer videoId, Integer seq) {
		CmsVideo cmsVideo = this.findOne(videoId);
		Map searchMap = new HashMap();
		searchMap.put("order", "seq desc,publish_date desc");
		CmsVideo cmsNovel = new CmsVideo();
		cmsNovel.setChannelId(cmsVideo.getChannelId());
		searchMap.put("model", cmsNovel);
		List<CmsVideo> novelList = this
				.findBychannelIdArgMap(searchMap, 1, seq).getList();
		if (seq == 1) {
			cmsVideo.setSeq(novelList.get(0).getSeq() + 1);
			this.cmsVideoMapper.updateByPrimaryKeySelective(cmsVideo);
			return;
		}
		boolean f = false;
		int index = 0;
		int cmsNovelSeq = 0;
		int max = novelList.size();
		if (max > 1
				&& novelList.get(max - 2).getSeq()
						- novelList.get(max - 1).getSeq() > 1) {// 可以直接插入
			cmsNovelSeq = novelList.get(max - 1).getSeq() + 1;
			cmsVideo.setSeq(cmsNovelSeq);
			this.cmsVideoMapper.updateByPrimaryKeySelective(cmsVideo);
			return;
		}
		for (int i = 0; i < max; i++) {// 当前操作的是否在list里面
			CmsVideo c = novelList.get(i);
			if (c.getId().equals(cmsVideo.getId())) {
				index = i;
				f = true;
				break;
			}
		}
		if (f) {// 当前在里面
			if (index == max - 1)// 当前位置 == 要移动的位置
				return;
			for (int i = index + 1; i < max; i++) {// 只移动当前下面的list
				CmsVideo c = novelList.get(i);
				cmsNovelSeq = c.getSeq();
				c.setSeq(cmsNovelSeq + 1);
				this.cmsVideoMapper.updateByPrimaryKeySelective(c);
			}
		} else {
			for (int i = 0; i < max - 1; i++) {// 移动当前上面的list
				CmsVideo c = novelList.get(i);
				cmsNovelSeq = c.getSeq();
				c.setSeq(cmsNovelSeq + 1);
				this.cmsVideoMapper.updateByPrimaryKeySelective(c);
			}
		}
		cmsVideo.setSeq(cmsNovelSeq);
		this.cmsVideoMapper.updateByPrimaryKeySelective(cmsVideo);
	}

	@Override
	public int updateStatus(Integer status, String videoIds,
			HttpServletRequest request) {
		String videoIdArray[] = videoIds.split(",");
		int num = 0;
		CmsVideo cmsVideoBasic = cmsVideoMapper.selectByPrimaryKey(Integer
				.valueOf(Integer.valueOf(videoIdArray[0])));
		for (String videoId : videoIdArray) {
			if (status == 2) {
				boolean success = generatorHtml(request,
						Integer.valueOf(videoId));
				if (success) {
					num++;
				}
			} else if (status == 3) {
				CmsVideo cmsVideo = cmsVideoMapper.selectByPrimaryKey(Integer
						.valueOf(Integer.valueOf(videoId)));
				cmsVideo.setStatus(status);
				cmsVideoMapper.updateByPrimaryKey(cmsVideo);
				num++;
			}
		}
		CmsChannel cms = cmsChannelMapper.selectByPrimaryKey(cmsVideoBasic.getChannelId());
		boolean succSite = cmsSiteService.generatorHtml(cms.getSiteId(), request);
		if(!succSite)
		{
			log.info("站点刷新失败");
		}
		return num;
	}

	@Override
	public boolean generatorHtml(HttpServletRequest request, Integer videoId) {
		CmsVideo cmsVideo = cmsVideoMapper.selectByPrimaryKey(Integer
				.valueOf(videoId));
		CmsTemplate cmsTemplate = new CmsTemplate();
		if (cmsVideo.getTemplateId() != null) {
			cmsTemplate = cmsTemplateService.findOneById(cmsVideo
					.getTemplateId());
		}
		CmsChannel cmsChannel = cmsChannelMapper.selectByPrimaryKey(cmsVideo
				.getChannelId());
		StringBuffer channelEnNamedir = new StringBuffer();
		StringBuffer iteratorChannelName = getChannelenNameByIterator(
				cmsVideo.getChannelId(), channelEnNamedir);
		String htmldir = File.separator + iteratorChannelName
				+ "content_video";
		String htmlFile = File.separator + cmsVideo.getId() + ".html";
		CmsSite site = cmsSiteMapper.selectByPrimaryKey(cmsChannel.getSiteId());
		Map root = new HashMap();
		Date now = new Date();
		cmsVideo.setUpdateTime(now);
		if(cmsVideo.getPublishDate()==null){
			cmsVideo.setPublishDate(now);
		}
		root.put("own", cmsVideo.getId());
		root.put("site", site);
		root.put("cmsVideo", cmsVideo);
		root.put("superChannel", getSuperChannel(cmsChannel));
		boolean success = super.generatorHtmlPCAndModile(cmsTemplate.getTemplatePath(), htmldir, htmlFile, root, request);
		if (success) {
			log.info("内容静态化成功：[id=" + cmsVideo.getId() + ",title="
					+ cmsVideo.getName() + "]");
			cmsVideo.setIsHtml(true);
			cmsVideo.setStatus(2);
			cmsVideo.setUrl(htmlFolder + "/" + iteratorChannelName + "/"
					+ "content_video/" + cmsVideo.getId() + ".html");
			cmsVideoMapper.updateByPrimaryKeySelective(cmsVideo);
		} else {
			log.error("内容静态化失败：[id=" + cmsVideo.getId() + ",title="
					+ cmsVideo.getName() + "]");
		}
		return success;
	}
	private CmsChannel getSuperChannel(CmsChannel channel) {
		CmsChannel pChannel = this.cmsChannelMapper.selectByPrimaryKey(channel.getPid());
		if(pChannel==null){
			return channel;
		}
		return getSuperChannel(pChannel);
	}
	private StringBuffer getChannelenNameByIterator(Integer ChannelId,
			StringBuffer channelEnNamedir) {
		CmsChannel channel = cmsChannelMapper.selectByPrimaryKey(ChannelId);
		if (channel != null) {
			channelEnNamedir.insert(0, "/");
			channelEnNamedir.insert(0, channel.getEnName());
			if (channel.getPid() != 0) {
				getChannelenNameByIterator(channel.getPid(), channelEnNamedir);
			} else {
				CmsSite site = cmsSiteMapper.selectByPrimaryKey(channel
						.getSiteId());
				channelEnNamedir.insert(0, "/");
				channelEnNamedir.insert(0, site.getDomain());
			}
		}
		return channelEnNamedir;
	}

	@Override
	public List<CmsVideo> selectPageListByMap(Map argMap) {
		List<CmsVideo> cmsVideos = cmsVideoMapper.selectPageListByMap(argMap);
		return cmsVideos;
	}

	@Override
	public void updateByPrimaryKey(CmsVideo cmsVideo) {
		this.cmsVideoMapper.updateByPrimaryKey(cmsVideo);

	}

	@Override
	public String selectVideoIdsByAttachmentId(Integer id) {
		return this.cmsVideoMapper.selectVideoIdsByAttachmentId(id);
	}
}
