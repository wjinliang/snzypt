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
import org.springframework.stereotype.Service;

import com.dm.cms.handler.generatorHtmlHandler;
import com.dm.cms.model.CmsAttachmentOther;
import com.dm.cms.model.CmsAudio;
import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsSite;
import com.dm.cms.model.CmsTemplate;
import com.dm.cms.service.CmsAttachmentOtherService;
import com.dm.cms.service.CmsAudioService;
import com.dm.cms.service.CmsSiteService;
import com.dm.cms.service.CmsTemplateConfigService;
import com.dm.cms.service.CmsTemplateService;
import com.dm.cms.sqldao.CmsAudioMapper;
import com.dm.cms.sqldao.CmsChannelMapper;
import com.dm.cms.sqldao.CmsSiteMapper;
import com.dm.platform.util.UserAccountUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class CmsAudioServiceImpl extends generatorHtmlHandler implements CmsAudioService{

	@Autowired
	CmsAudioMapper cmsAudioMapper;
	@Autowired
	CmsChannelMapper cmsChannelMapper;
	@Autowired
	CmsAttachmentOtherService cmsAttachmentOtherService;
	@Autowired
	CmsTemplateService cmsTemplateService;
	@Autowired
	CmsTemplateConfigService cmsTemplateConfigService;
    
	@Autowired
	CmsSiteService cmsSiteService;
	
	@Autowired
	CmsSiteMapper cmsSiteMapper;

	private static final Logger log = LoggerFactory
			.getLogger(CmsContentServiceImpl.class);

	@Override
	public PageInfo<CmsAudio> findBychannelIdArgMap(Map map, Integer pageNum,
			Integer pageSize) {
		if(map.get("model")!=null)
		{
		Integer channelId =((CmsAudio) map.get("model")).getChannelId();
		if (channelId != null) {
			List<Integer> channelIds = cmsChannelMapper.selectByPId(channelId);
			channelIds.add(channelId);
			map.put("channelIds", channelIds);
		}
		}
		PageHelper.startPage(pageNum, pageSize);
		List<CmsAudio> cmsAudios = cmsAudioMapper.findByChannelIdArgMap(map);
		PageInfo<CmsAudio> page = new PageInfo<CmsAudio>(cmsAudios);
		return page;
	}

	@Override
	public void insertOrUpdate(CmsAudio cmsAudio) {
		String url = "";
		String attachmentIds = cmsAudio.getAttachmentIds();
		String attachmentIdArray[] = new String[] {};
		if (attachmentIds != null && !attachmentIds.equals("")) {
			attachmentIdArray = attachmentIds.split(",");
			CmsAttachmentOther cmsAttachmentOther = cmsAttachmentOtherService
					.findOneById(Integer.valueOf(attachmentIdArray[0]));
			url = cmsAttachmentOther.getAttachmentUrl();
		}
		if (cmsAudio.getId() != null) {
			cmsAudioMapper.deleteAttachmentsByAudioId(cmsAudio.getId());
			cmsAudio.setUpdateTime(new Date());
			cmsAudio.setStatus(0);
			cmsAudio.setAudioUrl(url);
			cmsAudioMapper.updateByPrimaryKeySelective(cmsAudio);
		} else {
			if(cmsAudio.getStatus()==null)
			{
			cmsAudio.setStatus(0);
			}
			cmsAudio.setAudioUrl(url);
			cmsAudio.setCreateTime(new Date());
			cmsAudio.setCreateUserId(UserAccountUtil.getInstance().getCurrentUserId());
			Map searchMap = new HashMap();
			CmsAudio audio = new CmsAudio();
			audio.setChannelId(cmsAudio.getChannelId());
			searchMap.put("model", audio);
			searchMap.put("order", "seq desc,publish_date desc");
			List<CmsAudio> cmsAudios = findBychannelIdArgMap(searchMap, 1,
					1).getList();
			int seq = 1;
			if (cmsAudios.size() > 0) {
				CmsAudio cmsA = cmsAudios.get(0);
				seq = cmsA.getSeq()==null?1:cmsA.getSeq()+1;
			}
			cmsAudio.setSeq(seq);
			if (cmsAudio.getTemplateId() == null) {// 设置默认模板
				cmsAudio.setTemplateId(cmsTemplateConfigService.load(null,
						cmsAudio.getChannelId()).getContentTemplateId());
			}
			cmsAudioMapper.insertSelective(cmsAudio);
		}
		for (String attach : attachmentIdArray) {
			cmsAudioMapper.insertAttachments(cmsAudio.getId(),
					Integer.valueOf(attach));
		}
	}

	@Override
	public void deleteByIds(String audioIds,HttpServletRequest request) {
		if (audioIds == null || audioIds.equals("")) {
			return;
		}
		String audioIdArray[] = audioIds.split(",");
		CmsAudio audio = cmsAudioMapper.selectByPrimaryKey(Integer.valueOf(audioIdArray[0]));
		CmsChannel channel = cmsChannelMapper.selectByPrimaryKey(audio.getChannelId());
		for (String audioId : audioIdArray) {
			cmsAudioMapper.deleteByPrimaryKey(Integer.valueOf(audioId));
			this.deleteAttachments(Integer.valueOf(audioId));
		}
		cmsSiteService.generatorHtml(channel.getSiteId(), request);
	}

	private void deleteAttachments(Integer audioId) {
		cmsAudioMapper.deleteAttachmentsByAudioId(audioId);
		String attachmentIds = selectAttachmentByAudioId(audioId);
		if (attachmentIds == null || attachmentIds.equals(""))
			return;
		String[] attachmentIdArray = attachmentIds.split(",");
		for (String attaId : attachmentIdArray) {
			String str = this.cmsAudioMapper
					.selectAudioIdsByAttachmentId(Integer.valueOf(attaId));
			if (str == null || str.equals(""))
				this.cmsAttachmentOtherService.delete(Integer.valueOf(attaId));
		}

	}

	@Override
	public CmsAudio findOne(Integer audioId) {
		return cmsAudioMapper.selectByPrimaryKey(audioId);
	}

	@Override
	public String selectAttachmentByAudioId(Integer audioId) {
		return cmsAudioMapper.selectAttachmentByAudioId(audioId);
	}

	@Override
	public int commit(String audioIds) {
		String audioIdArray[] = audioIds.split(",");
		int num = 0;
		for (String audioId : audioIdArray) {
			CmsAudio cmsAudio = cmsAudioMapper.selectByPrimaryKey(Integer
					.valueOf(audioId));
			cmsAudio.setStatus(1);
			cmsAudioMapper.updateByPrimaryKey(cmsAudio);
			num++;
		}
		return num;
	}

	@Override
	public void sort(Integer audioId, Integer seq) {
		CmsAudio cmsAudio = this.findOne(audioId);
		Map searchMap = new HashMap();
		searchMap.put("order", "seq desc,publish_date desc");
		CmsAudio cmsAu = new CmsAudio();
		cmsAu.setChannelId(cmsAudio.getChannelId());// 之传入channelId
		searchMap.put("model", cmsAu);
		List<CmsAudio> cmsAudios = this.findBychannelIdArgMap(searchMap, 1, seq).getList();
		boolean f = false;
		int index = 0;
		int cmsAudioSeq = 0;
		int max = cmsAudios.size();
		if (max == 0) {
			return;
		}
		if (seq == 1) {
			cmsAudio.setSeq(cmsAudios.get(0).getSeq() + 1);
			this.cmsAudioMapper.updateByPrimaryKeySelective(cmsAudio);
			return;
		}
		if (max > 1
				&& cmsAudios.get(max - 2).getSeq()
						- cmsAudios.get(max - 1).getSeq() > 1) {// 可以直接插入
			cmsAudioSeq = cmsAudios.get(max - 1).getSeq() + 1;
			cmsAudio.setSeq(cmsAudioSeq);
			this.cmsAudioMapper.updateByPrimaryKeySelective(cmsAudio);
			return;
		}
		for (int i = 0; i < max; i++) {// 当前操作的是否在list里面
			CmsAudio c = cmsAudios.get(i);
			if (c.getId().equals(cmsAudio.getId())) {
				index = i;
				f = true;
				break;
			}
		}
		if (f) {// 当前在里面
			if (index == max - 1)// 当前位置 == 要移动的位置
				return;
			for (int i = index + 1; i < max; i++) {// 只移动当前下面的list
				CmsAudio c = cmsAudios.get(i);
				cmsAudioSeq = c.getSeq();
				c.setSeq(cmsAudioSeq + 1);
				this.cmsAudioMapper.updateByPrimaryKeySelective(c);
			}
		} else {
			for (int i = 0; i < max - 1; i++) {// 移动当前上面的list
				CmsAudio c = cmsAudios.get(i);
				cmsAudioSeq = c.getSeq();
				c.setSeq(cmsAudioSeq + 1);
				this.cmsAudioMapper.updateByPrimaryKeySelective(c);
			}
		}
		cmsAudio.setSeq(cmsAudioSeq);
		this.cmsAudioMapper.updateByPrimaryKeySelective(cmsAudio);

	}

	@Override
	public int updateStatus(Integer status, String audioIds,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		String audioArray[] = audioIds.split(",");
		int num = 0;
		CmsAudio cmsAudioBasic = cmsAudioMapper.selectByPrimaryKey(Integer
				.valueOf(audioArray[0]));
		CmsChannel cms = cmsChannelMapper.selectByPrimaryKey(cmsAudioBasic.getChannelId());
		for (String audioId : audioArray) {
			
			if (status == 2) {
				boolean succ = generatorHtml(request, Integer.valueOf(audioId));
				if (succ) {
					num++;
				}
			} else if (status == 3) {
				CmsAudio cmsAudio = cmsAudioMapper.selectByPrimaryKey(Integer
						.valueOf(audioId));
				cmsAudio.setStatus(status);
				cmsAudioMapper.updateByPrimaryKey(cmsAudio);
				num++;
			}
		}
		boolean succSite = cmsSiteService.generatorHtml(cms.getSiteId(), request);
		if(succSite)
		{
			log.info("站点刷新失败");
		}
		return num;
	}

	@Override
	public boolean generatorHtml(HttpServletRequest request, Integer audioId) {
		CmsAudio cmsAudio = cmsAudioMapper.selectByPrimaryKey(Integer
				.valueOf(audioId));
		CmsTemplate cmsTemplate = new CmsTemplate();
		if (cmsAudio.getTemplateId() != null) {
			cmsTemplate = cmsTemplateService.findOneById(cmsAudio
					.getTemplateId());
		}
		CmsChannel cmsChannel = cmsChannelMapper.selectByPrimaryKey(cmsAudio
				.getChannelId());
		StringBuffer channelEnNamedir = new StringBuffer();
		StringBuffer iteratorChannelName = getChannelenNameByIterator(
				cmsAudio.getChannelId(), channelEnNamedir);
		CmsSite site = cmsSiteMapper.selectByPrimaryKey(cmsChannel.getSiteId());
		Map root = new HashMap();
		root.put("own", cmsAudio.getId());
		root.put("site", site);
		root.put("cmsAudio", cmsAudio);
		String htmldir =  File.separator + iteratorChannelName
				+ "content_audio";
		String htmlFile = File.separator + cmsAudio.getId() + ".html";
		Date now = new Date();
		cmsAudio.setUpdateTime(now);
		cmsAudio.setPublishDate(now);
		root.put("superChannel", this.getSuperChannel(cmsChannel));
		boolean success = this.generatorHtmlPCAndModile(cmsTemplate.getTemplatePath(),htmldir,htmlFile, root, request);
		if (success) {
			log.info("内容静态化成功：[id=" + cmsAudio.getId() + ",title="
					+ cmsAudio.getName() + "]");
			cmsAudio.setIsHtml(true);
			cmsAudio.setStatus(2);
			cmsAudio.setUrl(htmlFolder + "/" + iteratorChannelName + "/"
					+ "content_audio/" + cmsAudio.getId() + ".html");
			cmsAudioMapper.updateByPrimaryKeySelective(cmsAudio);
		} else {
			log.error("内容静态化失败：[id=" + cmsAudio.getId() + ",title="
					+ cmsAudio.getName() + "]");
		}
		return success;
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
	private CmsChannel getSuperChannel(CmsChannel channel) {
		CmsChannel pChannel = this.cmsChannelMapper.selectByPrimaryKey(channel.getPid());
		if(pChannel==null){
			return channel;
		}
		return getSuperChannel(pChannel);
	}
	@Override
	public List<CmsAudio> selectPageListByMap(Map argMap) {
		// TODO Auto-generated method stub
		return cmsAudioMapper.selectPageListByMap(argMap);
	}

}
