package com.dm.cms.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.dm.cms.handler.generatorHtmlHandler;
import com.dm.cms.model.CmsAttachment;
import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsCheck;
import com.dm.cms.model.CmsContent;
import com.dm.cms.model.CmsSite;
import com.dm.cms.model.CmsTemplate;
import com.dm.cms.model.CmsTemplateConfig;
import com.dm.cms.service.CmsAttachmentService;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsContentService;
import com.dm.cms.service.CmsSiteService;
import com.dm.cms.service.CmsTemplateConfigService;
import com.dm.cms.sqldao.CmsChannelMapper;
import com.dm.cms.sqldao.CmsContentMapper;
import com.dm.cms.sqldao.CmsSiteMapper;
import com.dm.cms.sqldao.CmsTemplateMapper;
import com.dm.cms.thread.ContentGenerateHtml;
import com.dm.cms.util.AppUtil;
import com.dm.platform.model.UserAccount;
import com.dm.platform.util.UserAccountUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * Created by cgj on 2015/11/29.
 */
@Service
public class CmsContentServiceImpl extends generatorHtmlHandler implements
		CmsContentService {
	private static final Logger log = LoggerFactory
			.getLogger(CmsContentServiceImpl.class);
	@Autowired
	CmsContentMapper cmsContentMapper;

	@Autowired
	CmsChannelMapper cmsChannelMapper;
	@Autowired
	CmsTemplateMapper cmsTemplateMapper;
	@Autowired
	CmsAttachmentService cmsAttachmentService;
	@Autowired
	CmsTemplateConfigService cmsTemplateConfigService;

	@Autowired
	CmsChannelService cmsChannelService;

	@Autowired
	CmsSiteMapper cmsSiteMapper;
	@Autowired
	CmsSiteService cmsSiteService;

	@Value("${isChannelStatic}")
	boolean isChannelStatic;

	@Value("${isContentStatic}")
	boolean isContentStatic;

	String serperator = System.getProperty("file.separator");

	@Override
	public void insertCmsContent(CmsContent cmsContent) {
		Map searchMap = new HashMap();
		CmsContent content = new CmsContent();
		content.setChannelId(cmsContent.getChannelId());
		searchMap.put("model", content);
		List<CmsContent> contents = this.findCmsContentByPage(1, 1, searchMap)
				.getList();
		int seq = 1;
		if (contents.size() > 0)
			seq = contents.get(0).getSeq() + 1;
		cmsContent.setSeq(seq);
		if (cmsContent.getTemplateId() == null) {// 设置默认模板
			CmsTemplateConfig c = cmsTemplateConfigService.load(null,
					cmsContent.getChannelId());
			if (c != null)
				cmsContent.setTemplateId(c.getContentTemplateId());
		}
		if (cmsContent.getPublishDate() == null) {
			cmsContent.setPublishDate(new Date());
		}
		cmsContentMapper.insertSelective(cmsContent);
	}

	@Override
	public void updateCmsContent(CmsContent cmsContent) {
		/*
		 * if(cmsContent.getContentType()!=null) {
		 * if(!cmsContent.getContentType().equals("10")){ String author =
		 * UserAccountUtil.getInstance().getCurrentUser();
		 * cmsContent.setAuthor(author); } }
		 */
		cmsContentMapper.updateByPrimaryKeySelective(cmsContent);
	}

	@Override
	public CmsContent findOneById(int cmsContentId) {
		return cmsContentMapper.selectByPrimaryKey(cmsContentId);
	}

	@Override
	public void deleteCmsContentById(int cmsContentId) {
		deleteAtta(cmsContentId);
		cmsContentMapper.deleteByPrimaryKey(cmsContentId);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public PageInfo<CmsContent> findCmsContentByPage(Integer pageNum,
			Integer pageSize, Map argMap) {
		if (argMap.get("sort") == null) {
			argMap.put("sort", "seq desc,publish_date desc");
		}
		if (argMap.get("channelIds") == null && argMap.get("model") != null) {
			Integer channelId = ((CmsContent) argMap.get("model"))
					.getChannelId();
			if (channelId != null) {
				List<Integer> channelIds = cmsChannelMapper
						.selectByPId(channelId);
				channelIds.add(channelId);
				argMap.put("channelIds", channelIds);
			} else {
				/* argMap.put("channelIds", new Integer[]{0}); */
			}
		}
		PageHelper.startPage(pageNum, pageSize);
		List<CmsContent> cmsContents = cmsContentMapper
				.selectRecordByArgMap(argMap);
		PageInfo<CmsContent> pageInfo = new PageInfo<CmsContent>(cmsContents);
		return pageInfo;
	}

	@Override
	public CmsContent findOneByPortal(String siteDomain, String channelEnName,
			int cmsContentId) {
		Map argMap = new HashMap();
		argMap.put("domain", siteDomain);
		argMap.put("enName", channelEnName);
		argMap.put("contentId", cmsContentId);
		return cmsContentMapper.selectByParams(argMap);
	}

	@Override
	public void insertAttachment(int cmsContentId, String cmsAttachmentIds) {
		if (cmsAttachmentIds == null || cmsAttachmentIds.equals("")) {
			return;
		}
		String[] fileIdArray = cmsAttachmentIds.split(",");
		for (String attachmentId : fileIdArray) {
			cmsContentMapper.insertAttachment(cmsContentId,
					Integer.valueOf(attachmentId));
		}
	}

	@Override
	public void updateAttachment(int cmsContentId, String cmsAttachmentIds) {
		cmsContentMapper.deleteAttachment(cmsContentId);
		insertAttachment(cmsContentId, cmsAttachmentIds);
	}

	private void deleteAtta(Integer cmsContentId) {
		List<CmsAttachment> attachmentIdList = this
				.findCmsAttachmentByCmsContentId(cmsContentId);
		cmsContentMapper.deleteAttachment(cmsContentId);
		for (CmsAttachment cmsAttachment : attachmentIdList) {
			String str = cmsContentMapper
					.selectContentIdsByAttachmentId(cmsAttachment.getId());
			if (str == null || str.equals(""))
				this.cmsAttachmentService.deleteByIdWithLocalFile(cmsAttachment
						.getId());

		}

	}

	@Override
	public List<CmsAttachment> findCmsAttachmentByCmsContentId(int cmsContentId) {
		return cmsContentMapper.selectAttachementByCmsContentId(cmsContentId);
	}

	@Override
	public String findCmsAttachementIdsByCmsContentId(int cmsContentId) {
		return cmsContentMapper.selectAttachmentIdsByCMsContentId(cmsContentId);
	}

	@Override
	public CmsContent generateHtml(HttpServletRequest request, int contentId) {
		boolean success = false;
		CmsContent content = this.cmsContentMapper
				.selectByPrimaryKey(contentId);
		if (content.getContentType() == 2) {
			return content;
		}
		content.setStatus(new Short("2"));
		Date now = new Date();
		if (content.getPublishDate() == null) {
			content.setPublishDate(now); 
		}
		content.setUpdateTime(now);
		if (!isContentStatic) {//如果potal
			content.setIsHtml(false);
			cmsContentMapper.updateByPrimaryKeySelective(content);
			return content;
		}
		content.setIsHtml(true);
		CmsChannel channel = cmsChannelMapper.selectByPrimaryKey(content
				.getChannelId());
		CmsSite site = cmsSiteMapper.selectByPrimaryKey(channel.getSiteId());
		CmsTemplate cmsTemplate = null;
		if (content.getTemplateId() != null) {
			cmsTemplate = cmsTemplateMapper.selectByPrimaryKey(content
					.getTemplateId());
		}
		StringBuffer channelEnNamedir = new StringBuffer();
		StringBuffer iteratorChannelName = getChannelenNameByIterator(
				content.getChannelId(), channelEnNamedir);
		String htmldir = serperator + iteratorChannelName + serperator
				+ "content";
		String htmlFile = serperator + content.getId() + ".html";
		log.debug("迭代目录{}", iteratorChannelName);
		log.debug("目录{}", htmldir);
		List<CmsAttachment> cmsAttachmentList = findCmsAttachmentByCmsContentId(contentId);
		Map<String, Object> root = new HashMap<String, Object>();
		if (cmsAttachmentList.size() > 0) {
			root.put("cmsAttachments", cmsAttachmentList);// 附件
		}
		root.put("own", contentId);
		root.put("site", site);
		if (content.getContentType() != null
				&& content.getContentType().equals("10")) {
			root.put("doc", content.toDoc());
		} else {
			root.put("cmsContent", content);
		}
		root.put("superChannel", this.getSuperChannel(channel));
		success = super.generatorHtmlPCAndModile(cmsTemplate.getTemplatePath(),
				htmldir, htmlFile, root, request);
		// success = FreeMarkertUtil.analysisTemplate(templatePath,
		// cmsTemplate.getTemplatePath(), htmlFile, root, request);
		// success = Ftl2HtmlUtils.template2HTML(templatePath,
		// cmsTemplate.getTemplatePath(), htmlFile, root);
		if (success) {
			log.info("内容静态化成功：[id=" + content.getId() + ",title="
					+ content.getTitle() + "]");
			String channelUrl = iteratorChannelName.toString().replace(
					serperator, "/");
			content.setIsHtml(true);
			content.setUrl(htmlFolder + "/" + channelUrl + "content/"
					+ content.getId() + ".html");
			cmsContentMapper.updateByPrimaryKeySelective(content);
		} else {
			log.error("内容静态化失败：[id=" + content.getId() + ",title="
					+ content.getTitle() + "]");
			return null;
		}

		return content;
	}

	private CmsChannel getSuperChannel(CmsChannel channel) {
		CmsChannel pChannel = this.cmsChannelMapper.selectByPrimaryKey(channel
				.getPid());
		if (pChannel == null) {
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
	public boolean updateContentState(HttpServletRequest request,
			Integer contentId, Short status) {
		CmsContent cmsContent = this.cmsContentMapper
				.selectByPrimaryKey(contentId);
		boolean succ = true;
		if (cmsContent == null
				|| (cmsContent.getStatus().equals(status) && !(status == 2))) {
			return false;
		}
		if (status == 1 && cmsContent.getStatus() == 1) {
			return false;
		}
		if (2 == status) {
			if (cmsContent.getContentType() != null
					&& cmsContent.getContentType() == 2) {// 链接频道
				succ = true;
				cmsContent.setStatus(status);
				cmsContent.setIsHtml(true);
				this.cmsContentMapper.updateByPrimaryKeySelective(cmsContent);
				CmsChannel cms = cmsChannelMapper.selectByPrimaryKey(cmsContent
						.getChannelId());
				if (isChannelStatic) {
					ExecutorService excutor = Executors.newFixedThreadPool(10);
					// 多线程静态化频道，如无需注释即可
					generateChannelMutipleThread(request, cms, excutor);
				}
				succ = cmsSiteService.generatorHtml(cms.getSiteId(), request);
			} else {
				CmsContent c = this.generateHtml(request, contentId);
				if (c != null) {
					CmsChannel cms = cmsChannelMapper
							.selectByPrimaryKey(cmsContent.getChannelId());
					if (isChannelStatic) {
						ExecutorService excutor = Executors
								.newFixedThreadPool(10);
						// 多线程静态化频道，如无需注释即可
						generateChannelMutipleThread(request, cms, excutor);
					}
					succ = cmsSiteService.generatorHtml(cms.getSiteId(),
							request);
				} else {
					succ = false;
				}
			}
		} else {
			cmsContent.setStatus(status);
			cmsContent.setIsHtml(false);
			this.cmsContentMapper.updateByPrimaryKeySelective(cmsContent);
			succ = true;

		}
		return succ;
	}

	@Override
	public int selectCountBychannelId(Integer channelId) {
		List<Integer> channelIds = cmsChannelMapper.selectByPId(channelId);
		if (channelIds.size() == 0)
			return 0;
		return cmsContentMapper.selectCount(channelIds);
	}

	@Override
	public int selectCountBychannelIdOnly(Integer channelId) {
		List<Integer> channelIds = new ArrayList<Integer>();
		channelIds.add(channelId);
		return cmsContentMapper.selectCount(channelIds);
	}

	@Override
	public void sort(Integer contentId, Integer seq) {
		CmsContent cmsContent = this.cmsContentMapper
				.selectByPrimaryKey(contentId);
		this.sort(cmsContent, seq);
	}

	private void sort(CmsContent cmsContent, Integer seq) {
		Map searchMap = new HashMap();
		searchMap.put("sort", "seq desc,publish_date desc");
		CmsContent content = new CmsContent();
		content.setChannelId(cmsContent.getChannelId());// 之传入channelId
		searchMap.put("model", content);
		List<CmsContent> contents = this
				.findCmsContentByPage(1, seq, searchMap).getList();
		boolean f = false;
		int index = 0;
		int cmsContentSeq = 0;
		int max = contents.size();
		if (seq == 1) {
			cmsContent.setSeq(contents.get(0).getSeq() + 1);
			this.cmsContentMapper.updateByPrimaryKeySelective(cmsContent);
			return;
		}
		if (max > 1
				&& contents.get(max - 2).getSeq()
						- contents.get(max - 1).getSeq() > 1) {// 可以直接插入
			cmsContentSeq = contents.get(max - 1).getSeq() + 1;
			cmsContent.setSeq(cmsContentSeq);
			this.cmsContentMapper.updateByPrimaryKeySelective(cmsContent);
			return;
		}
		for (int i = 0; i < max; i++) {// 当前操作的是否在list里面
			CmsContent c = contents.get(i);
			if (c.getId().equals(cmsContent.getId())) {
				index = i;
				f = true;
				break;
			}
		}
		if (f) {// 当前在里面
			if (index == max - 1)// 当前位置 == 要移动的位置
				return;
			for (int i = index + 1; i < max; i++) {// 只移动当前下面的list
				CmsContent c = contents.get(i);
				cmsContentSeq = c.getSeq();
				c.setSeq(cmsContentSeq + 1);
				this.cmsContentMapper.updateByPrimaryKeySelective(c);
			}
		} else {
			for (int i = 0; i < max - 1; i++) {// 移动当前上面的list
				CmsContent c = contents.get(i);
				cmsContentSeq = c.getSeq();
				c.setSeq(cmsContentSeq + 1);
				this.cmsContentMapper.updateByPrimaryKeySelective(c);
			}
		}
		cmsContent.setSeq(cmsContentSeq);
		this.cmsContentMapper.updateByPrimaryKeySelective(cmsContent);
	}

	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
	}

	@Override
	public void selectTopOneAndUpdate() {
		// TODO Auto-generated method stub
		PageHelper.startPage(1, 1);
		List<CmsContent> cmsContents = cmsContentMapper.selectTopOne();
		PageInfo<CmsContent> page = new PageInfo<CmsContent>(cmsContents);
		List<CmsContent> list = page.getList();
		if (list.size() > 0) {
			list.get(0).setContentType(0);
			cmsContentMapper.updateByPrimaryKey(list.get(0));
		}
	}

	@Override
	public List<CmsContent> selectTopOne(Map params) {
		if (params == null) {
			PageHelper.startPage(1, 1);
			List<CmsContent> cmsContents = cmsContentMapper.selectTopOne();
			PageInfo<CmsContent> page = new PageInfo<CmsContent>(cmsContents);
			List<CmsContent> list = page.getList();
			return list;
		}
		if (params.get("pageSize") == null) {
			PageHelper.startPage(1, 1);
			List<CmsContent> cmsContents = cmsContentMapper.selectTopOne();
			PageInfo<CmsContent> page = new PageInfo<CmsContent>(cmsContents);
			List<CmsContent> list = page.getList();
			return list;
		}
		Integer pageSize = Integer.valueOf(params.get("pageSize").toString());
		Integer pageNum = params.get("pageNum") == null ? 1 : Integer
				.valueOf(params.get("pageNum").toString());
		PageHelper.startPage(pageNum, pageSize);
		List<CmsContent> cmsContents = cmsContentMapper.selectTopOne();
		PageInfo<CmsContent> page = new PageInfo<CmsContent>(cmsContents);
		List<CmsContent> list = page.getList();
		return list;
	}

	@Override
	public CmsContent selectTopOne() {
		// TODO Auto-generated method stub
		List<CmsContent> cmsContents = cmsContentMapper.selectTopOne();
		if (cmsContents.size() > 0) {
			return cmsContents.get(0);
		}
		return new CmsContent();
	}

	@Override
	public PageInfo<CmsCheck> findCmsContentByViewPage(Integer pageNum,
			Integer pageSize, Map argMap) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, pageSize);
		List<CmsCheck> CmsChecks = cmsContentMapper.selectViewByReord(argMap);
		return new PageInfo<CmsCheck>(CmsChecks);
	}

	@Override
	public PageInfo<CmsContent> selectIsPictures(Integer pageNum,
			Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<CmsContent> list = this.cmsContentMapper.selectIsPictures();
		return new PageInfo<CmsContent>(list);
	}

	@Override
	public void setContentIsDelete(Integer id) {
		CmsContent record = new CmsContent();
		record.setId(id);
		UserAccount user = UserAccountUtil.getInstance()
				.getCurrentUserAccount();
		record.setDeleteUser(user.getCode());
		record.setIsDelete(true);
		record.setStatus(new Short("0"));
		record.setIsHtml(false);
		record.setIsPicture(false);
		record.setIsTop(false);
		this.cmsContentMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public void restore(String contentId) {
		if (contentId != null && !contentId.equals("")) {
			for (String id : contentId.split(",")) {
				CmsContent record = new CmsContent();
				record.setId(Integer.valueOf(id));
				record.setIsDelete(false);
				this.cmsContentMapper.updateByPrimaryKeySelective(record);
			}
		}

	}

	@Override
	public void generateChannelMutipleThread(HttpServletRequest request,
			CmsChannel channel, ExecutorService executor) {
		ContentGenerateHtml runable = (ContentGenerateHtml) AppUtil
				.getBean("contentGenerateHtml");
		runable.setChannelId(channel.getId());
		runable.setChannelType(channel.getChannelType());
		runable.setRequest(request);
		runable.setSiteChannelContent("channel");
		executor.execute(runable);
		if (channel.getPid() != 0) {
			CmsChannel ch = cmsChannelMapper.selectByPrimaryKey(channel
					.getPid());
			generateChannelMutipleThread(request, ch, executor);
		} else {
			executor.shutdown();
			try {
				executor.awaitTermination(1200, TimeUnit.MINUTES);
			} catch (InterruptedException e1) {
				// TODO Auto-generated catch block
				log.error(e1.getMessage());
			}
		}
	}

	@Override
	public PageInfo<CmsContent> findLeaderContentsByPage(Integer pageNum,
			Integer pageSize, String leaderId) {
		PageHelper.startPage(pageNum, pageSize);
		List<CmsContent> list = this.cmsContentMapper
				.selectByLeaderId(leaderId);
		return new PageInfo<CmsContent>(list);
	}

}
