package com.dm.cms.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dm.cms.handler.generatorHtmlHandler;
import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsNovel;
import com.dm.cms.model.CmsSite;
import com.dm.cms.model.CmsTemplate;
import com.dm.cms.model.CmsVideo;
import com.dm.cms.service.CmsAttachmentOtherService;
import com.dm.cms.service.CmsNovelService;
import com.dm.cms.service.CmsSiteService;
import com.dm.cms.service.CmsTemplateConfigService;
import com.dm.cms.sqldao.CmsChannelMapper;
import com.dm.cms.sqldao.CmsNovelMapper;
import com.dm.cms.sqldao.CmsSiteMapper;
import com.dm.cms.sqldao.CmsTemplateMapper;
import com.dm.platform.util.UserAccountUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 小说
 * 
 * @project com.dm.cms.service.impl.CmsNovelServiceImp.java
 * @author wjl
 * @createdate 2016年1月14日 上午11:43:24
 */
@Service
public class CmsNovelServiceImp extends generatorHtmlHandler  implements CmsNovelService {
	private static final Logger log = LoggerFactory
			.getLogger(CmsNovelService.class);

	@Autowired
	private CmsNovelMapper cmsNovelMapper;
	@Autowired
	CmsSiteMapper cmsSiteMapper;
	
	@Autowired
	CmsSiteService cmsSiteService;
	@Autowired
	CmsTemplateMapper cmsTemplateMapper;
	@Autowired
	CmsChannelMapper cmsChannelMapper;
	@Autowired
	CmsAttachmentOtherService cmsAttachmentOtherService;
	@Autowired
	CmsTemplateConfigService cmsTemplateConfigService;

	String serperator = System.getProperty("file.separator");

	@Override
	public PageInfo<CmsNovel> findCmsNovelByPage(Integer pageNum,
			Integer pageSize, Map map) {
		if( map.get("model")!=null)
		{
		Integer channelId = ((CmsNovel) map.get("model")).getChannelId();
		if (channelId != null) {
			List<Integer> channelIds = cmsChannelMapper.selectByPId(channelId);
			channelIds.add(channelId);
			map.put("channelIds", channelIds);
			}
		}
		PageHelper.startPage(pageNum, pageSize);
		List<CmsNovel> list = cmsNovelMapper.selectRecordByArgMap(map);
		PageInfo<CmsNovel> page = new PageInfo<CmsNovel>(list);
		return page;
	}

	@Override
	public void updateCmsNovel(CmsNovel cmsNovel) {
		cmsNovel.setUpdateTime(new Date());
		this.cmsNovelMapper.updateByPrimaryKeySelective(cmsNovel);

	}

	@Override
	public void insertCmsNovel(CmsNovel cmsNovel) {
		Date now = new Date();
		cmsNovel.setCreateTime(now);
		cmsNovel.setUpdateTime(now);
		// String type =
		// this.cmsChannelMapper.selectByPrimaryKey(cmsNovel.getChannelId()).getDisplayName();
		// cmsNovel.setType(type);
		if (cmsNovel.getTemplateId() == null) {// 设置默认模板
			cmsNovel.setTemplateId(cmsTemplateConfigService.load(null,
					cmsNovel.getChannelId()).getContentTemplateId());
		}
		cmsNovel.setCreateUserId(UserAccountUtil.getInstance().getCurrentUserId());
		this.cmsNovelMapper.insertSelective(cmsNovel);
		cmsNovel.setSeq(cmsNovel.getId());
		this.cmsNovelMapper.updateByPrimaryKeySelective(cmsNovel);

	}

	@Override
	public void updateAttachment(Integer id, String attachmentIds) {
		this.cmsNovelMapper.deleteAttaByNovelId(id);
		insertAttachment(id, attachmentIds);
	}

	@Override
	public void insertAttachment(Integer id, String attachmentIds) {
		if (attachmentIds == null || attachmentIds.equals("")) {
			return;
		}
		String[] fileIdArray = attachmentIds.split(",");
		for (String attachmentId : fileIdArray) {
			this.cmsNovelMapper.insertAttachment(id,
					Integer.valueOf(attachmentId));
		}

	}

	@Override
	public void delete(String ids,HttpServletRequest request) {
		if (ids == null || ids.equals("")) {
			return;
		}
		String[] idArray = ids.split(",");
		CmsNovel cmsNovel = cmsNovelMapper.selectByPrimaryKey(Integer.valueOf(idArray[0]));
		CmsChannel channel = cmsChannelMapper.selectByPrimaryKey(cmsNovel.getChannelId());
		for (String id : idArray) {
			Integer novelId = Integer.valueOf(id);
			this.cmsNovelMapper.deleteByPrimaryKey(novelId);
			String attachmentIds = this.cmsNovelMapper
					.selectAttaIdsStringByNovelId(Integer.valueOf(id));
			this.deleteAttachment(novelId, attachmentIds);
		}
		cmsSiteService.generatorHtml(channel.getSiteId(), request);
	}

	private void deleteAttachment(Integer novelId, String attachmentIds) {
		this.cmsNovelMapper.deleteAttaByNovelId(novelId);
		if (attachmentIds == null || attachmentIds.equals(""))
			return;
		String[] attachmentIdArray = attachmentIds.split(",");
		for (String attaId : attachmentIdArray) {
			String str = this.cmsNovelMapper
					.selectNovelIdsByAttachmentId(Integer.valueOf(attaId));
			if (str == null || str.equals(""))
				this.cmsAttachmentOtherService.delete(Integer.valueOf(attaId));
		}

	}

	@Override
	public CmsNovel findById(Integer id) {
		CmsNovel c = this.cmsNovelMapper.selectByPrimaryKey(id);
		String attachmentIds = this.cmsNovelMapper
				.selectAttaIdsStringByNovelId(id);
		c.setAttachmentIds(attachmentIds);
		return c;
	}

	@Override
	public boolean generatorHtml(Integer novelId, HttpServletRequest request) {
		boolean success = false;
		CmsNovel cmsNovel = cmsNovelMapper.selectByPrimaryKey(novelId);
		cmsNovel.setUpdateTime(new Date());
		CmsChannel channel = cmsChannelMapper.selectByPrimaryKey(cmsNovel
				.getChannelId());
		CmsSite site = cmsSiteMapper.selectByPrimaryKey(channel.getSiteId());
		CmsTemplate cmsTemplate = null;
		if (cmsNovel.getTemplateId() != null) {
			cmsTemplate = cmsTemplateMapper.selectByPrimaryKey(cmsNovel
					.getTemplateId());
		}

		StringBuffer channelEnNamedir = new StringBuffer();
		StringBuffer iteratorChannelName = getChannelenNameByIterator(
				cmsNovel.getChannelId(), channelEnNamedir);
		String htmldir = serperator
				+ iteratorChannelName + serperator + "content_novel";
		log.debug("迭代目录{}", iteratorChannelName);
		log.debug("目录{}", htmldir);
		Map<String, Object> root = new HashMap<String, Object>();
		Date now = new Date();
		cmsNovel.setUpdateTime(now);
		cmsNovel.setPublishDate(now);
		root.put("own", novelId);
		root.put("cmsNovel", cmsNovel);
		root.put("site", site);
		root.put("superChannel", getSuperChannel(channel));
		String htmlFile = "";
		htmlFile =  serperator + novelId + ".html";
		success = super.generatorHtmlPCAndModile(cmsTemplate.getTemplatePath(), htmldir, htmlFile, root, request);
		// success = Ftl2HtmlUtils.template2HTML(templatePath,
		// cmsTemplate.getTemplatePath(), htmlFile, root);
		if (success) {
			log.info("内容静态化成功：[id=" + novelId + ",title=" + cmsNovel.getName()
					+ "]");
			String channelUrl = iteratorChannelName.toString().replace(
					serperator, "/");
			cmsNovel.setUrl(htmlFolder + "/" + channelUrl + "content_novel/" + novelId
					+ ".html");
			cmsNovel.setStatus("2");
			cmsNovel.setIsHtml(true);
			cmsNovelMapper.updateByPrimaryKey(cmsNovel);
		} else {
			log.error("内容静态化失败：[id=" + novelId + ",title=" + cmsNovel.getName()
					+ "]");
			return false;
		}
		CmsNovel cmsNovelBasic = cmsNovelMapper.selectByPrimaryKey(Integer
				.valueOf(Integer.valueOf(novelId)));
		CmsChannel cha = cmsChannelMapper.selectByPrimaryKey(cmsNovelBasic.getChannelId());
		boolean succSite = cmsSiteService.generatorHtml(cha.getSiteId(), request);
		if(!succSite)
		{
			log.info("站点刷新失败");
		}
		return true;
	}
	private CmsChannel getSuperChannel(CmsChannel channel) {
		CmsChannel pChannel = this.cmsChannelMapper.selectByPrimaryKey(channel.getPid());
		if(pChannel==null){
			return channel;
		}
		return getSuperChannel(pChannel);
	}
	public StringBuffer getChannelenNameByIterator(Integer ChannelId,
			StringBuffer channelEnNamedir) {
		CmsChannel channel = cmsChannelMapper.selectByPrimaryKey(ChannelId);
		if (channel != null) {
			channelEnNamedir.insert(0, serperator);
			channelEnNamedir.insert(0, channel.getEnName());
			if (channel.getPid() != 0) {
				getChannelenNameByIterator(channel.getPid(), channelEnNamedir);
			} else {
				CmsSite site = cmsSiteMapper.selectByPrimaryKey(channel
						.getSiteId());
				channelEnNamedir.insert(0, serperator);
				channelEnNamedir.insert(0, site.getDomain());
			}
		}
		return channelEnNamedir;
	}

	@Override
	public void sort(Integer novelId, Integer seq) {
		CmsNovel novel = this.cmsNovelMapper.selectByPrimaryKey(novelId);
		doSort(novel, seq);
	}

	private void doSort(CmsNovel novel, int seq) {
		Map searchMap = new HashMap();
		searchMap.put("order", "seq desc,publish_date desc");
		CmsNovel cmsNovel = new CmsNovel();
		cmsNovel.setChannelId(novel.getChannelId());
		searchMap.put("model", cmsNovel);
		List<CmsNovel> novelList = this.findCmsNovelByPage(1, seq, searchMap)
				.getList();
		if (seq == 1) {
			novel.setSeq(novelList.get(0).getSeq() + 1);
			this.cmsNovelMapper.updateByPrimaryKeySelective(novel);
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
			novel.setSeq(cmsNovelSeq);
			this.cmsNovelMapper.updateByPrimaryKeySelective(novel);
			return;
		}
		for (int i = 0; i < max; i++) {// 当前操作的是否在list里面
			CmsNovel c = novelList.get(i);
			if (c.getId().equals(novel.getId())) {
				index = i;
				f = true;
				break;
			}
		}
		if (f) {// 当前在里面
			if (index == max - 1)// 当前位置 == 要移动的位置
				return;
			for (int i = index + 1; i < max; i++) {// 只移动当前下面的list
				CmsNovel c = novelList.get(i);
				cmsNovelSeq = c.getSeq();
				c.setSeq(cmsNovelSeq + 1);
				this.cmsNovelMapper.updateByPrimaryKeySelective(c);
			}
		} else {
			for (int i = 0; i < max - 1; i++) {// 移动当前上面的list
				CmsNovel c = novelList.get(i);
				cmsNovelSeq = c.getSeq();
				c.setSeq(cmsNovelSeq + 1);
				this.cmsNovelMapper.updateByPrimaryKeySelective(c);
			}
		}
		novel.setSeq(cmsNovelSeq);
		this.cmsNovelMapper.updateByPrimaryKeySelective(novel);

	}

	@Override
	public List<CmsNovel> selectPageListByMap(Map argMap) {
		return cmsNovelMapper.selectPageListByMap(argMap);
	}

	@Override
	public int updateStatus(String novelIds, String status,
			HttpServletRequest request) {
		if (novelIds == null || novelIds.equals("")) {
			return 0;
		}
		int num = 0;
		String[] idsArray = novelIds.split(",");
		for (String novelId : idsArray) {
			if (status.equals("2")) { // 发布
				boolean succ = generatorHtml(Integer.valueOf(novelId), request);
			} else {
				CmsNovel cmsNovel = cmsNovelMapper.selectByPrimaryKey(Integer
						.valueOf(novelId));
				cmsNovel.setStatus(status);
				cmsNovelMapper.updateByPrimaryKey(cmsNovel);
			}
			num++;
		}
		return num;
	}
}
