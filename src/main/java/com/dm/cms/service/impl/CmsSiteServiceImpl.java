package com.dm.cms.service.impl;

import java.io.File;
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
import org.springframework.stereotype.Service;

import com.dm.cms.handler.generatorHtmlHandler;
import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsSite;
import com.dm.cms.model.CmsTemplate;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsSiteService;
import com.dm.cms.sqldao.CmsSiteMapper;
import com.dm.cms.sqldao.CmsTemplateMapper;
import com.dm.cms.sqldao.CmsUserGroupMapper;
import com.dm.cms.thread.ContentGenerateHtml;
import com.dm.cms.util.AppUtil;
import com.dm.platform.dto.SelectOptionDto;
import com.dm.platform.dto.TreeNode;
import com.dm.platform.util.UserAccountUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * Created by cgj on 2015/11/22.
 */
@Service
public class CmsSiteServiceImpl extends generatorHtmlHandler implements CmsSiteService {
	private static final Logger log = LoggerFactory
			.getLogger(CmsSiteServiceImpl.class);
	@Autowired
	CmsSiteMapper cmsSiteMapper;
	@Autowired
	CmsUserGroupMapper cmsUserGroupMapper;
	@Autowired
	CmsTemplateMapper cmsTemplateMapper;
	@Autowired
	CmsChannelService cmsChannelService;
	// @Autowired
	// ContentGenerateHtml runable;
	@Value("${isSiteStatic}")
	private boolean isSiteStatic;

	@Override
	public void insertCmsSite(CmsSite cmsSite) {
		cmsSiteMapper.insertSelective(cmsSite);
		String userId = UserAccountUtil.getInstance().getCurrentUserId();
		List<String> groupIds = cmsUserGroupMapper
				.selectCurrentUserGroupId(userId);
		if (groupIds.size() <= 0) {
			return;
		}
		List maps = new ArrayList<Map<String, String>>();
		for (String groupId : groupIds) {
			Map map = new HashMap<String, String>();
			map.put("groupId", groupId);
			map.put("siteId", cmsSite.getId());
			maps.add(map);
		}
		this.cmsUserGroupMapper.insertGroupSite(maps);
	}

	@Override
	public void updateCmsSite(CmsSite cmsSite) {
		cmsSiteMapper.updateByPrimaryKeySelective(cmsSite);
	}

	@Override
	public void deleteCmsSite(int cmsSiteId) {
		cmsSiteMapper.deleteByPrimaryKey(cmsSiteId);
		Map map = new HashMap();
		List list = new ArrayList<String>();
		list.add(cmsSiteId);
		map.put("siteId", list);
		this.cmsUserGroupMapper.deleteGroupSite(map);
	}

	@Override
	public CmsSite findOneById(int cmsSiteId) {
		return cmsSiteMapper.selectByPrimaryKey(cmsSiteId);
	}

	@Override
	public CmsSite findOneByDomain(String domain) {
		return cmsSiteMapper.selectByDomain(domain);
	}

	@Override
	public PageInfo<CmsSite> findCmsSite(Integer pageNum, Integer pageSize,
			Map argMap) {
		String userId = UserAccountUtil.getInstance().getCurrentUserId();
		argMap.put("uid", userId);
		PageHelper.startPage(pageNum, pageSize);
		List<CmsSite> list = cmsSiteMapper.selectRecordsByArgMap(argMap);
		PageInfo<CmsSite> page = new PageInfo<CmsSite>(list);
		return page;
	}

	@Override
	public List<TreeNode> findCmsSiteTreeNodes() {
		return cmsSiteMapper.selectTreeNodesByArgMap(null);
	}

	@Override
	public List<SelectOptionDto> findCmsSiteSelectOption() {
		String userId = UserAccountUtil.getInstance().getCurrentUserId();
		Map argMap = new HashMap();
		argMap.put("uid", userId);
		return cmsSiteMapper.selectSelectOptionByArgMap(argMap);
	}

	@Override
	public boolean generatorHtml(Integer siteId, HttpServletRequest request) {
		boolean succ = false;
		CmsSite site = cmsSiteMapper.selectByPrimaryKey(siteId);
		if(!isSiteStatic){
			if(site.getIsHtml()){
				site.setIsHtml(false);
				cmsSiteMapper.updateByPrimaryKeySelective(site);
			}
		return true;
		}
		CmsTemplate cmsTemplate = new CmsTemplate();
		if (site.getTemplateId() != null) {
			cmsTemplate = cmsTemplateMapper.selectByPrimaryKey(site
					.getTemplateId());
		}
		Map root = new HashMap();
		String htmldir = "/" + site.getDomain();
		String htmlFile = "/index.html";
		site.setUpdateTime(new Date());
		site.setIsHtml(true);
		site.setUrl(htmlFolder + "/" + site.getDomain() + "/index.html");
		root.put("site", site);
		succ = this.generatorHtmlPCAndModile(cmsTemplate.getTemplatePath(), htmldir, htmlFile, root, request);
		//succ = this.generatorHtmlPCAndModile(cmsTemplate.getTemplatePath(), htmldir, htmlFile, root, request);
		if (succ) {
			log.info("站点静态化成功:id={},name={}", site.getId(),
					site.getDisplayName());
			cmsSiteMapper.updateByPrimaryKeySelective(site);
		} else {
			log.error("站点静态化失败:id={},name={}", site.getId(),
					site.getDisplayName());
		}
		return succ;
	}

	@Override
	public boolean cancelGeneratorHtml(Integer siteId,
			HttpServletRequest request) {
		CmsSite site = cmsSiteMapper.selectByPrimaryKey(siteId);
		String baseDir = System.getProperty("web.root");
		String projectName = request.getContextPath();
		String basedir = baseDir.substring(0, baseDir.indexOf(projectName.substring(1)) - 1);
		String htmlDir = basedir
				+ htmlFolder + "/" + site.getDomain() + "/index.html";
		File file = new File(htmlDir);
		if (file.exists()) {
			file.delete();
		}
		String htmlModielDir = basedir
				+ htmlFolder + "/" + site.getDomain() + "/index.html";
		File filem = new File(htmlModielDir);
		if (filem.exists()) {
			filem.delete();
		}
		site.setIsHtml(false);
		cmsSiteMapper.updateByPrimaryKeySelective(site);
		return true;
	}

	@Override
	public boolean GeneratorHtmlSite(Integer siteId,
			HttpServletRequest request, String siteChannelContent) {
		this.generatorHtml(siteId, request); // 站点是必须静态化的
		CmsChannel cmsChannel = new CmsChannel();
		cmsChannel.setSiteId(siteId);
		List<CmsChannel> channels = cmsChannelService.findCmsChannelByPage(1,
				1000, cmsChannel).getList();
		ExecutorService executor = Executors.newFixedThreadPool(10);
		// ExecutorService executor = Executors.newCachedThreadPool();
		for (CmsChannel c : channels) {
			if (c.getChannelType().equals("2")) {// 链接频道
				continue;
			}
			ContentGenerateHtml runable = (ContentGenerateHtml) AppUtil
					.getBean("contentGenerateHtml");
			runable.setChannelId(c.getId());
			runable.setChannelType(c.getChannelType());
			runable.setRequest(request);
			runable.setSiteChannelContent(siteChannelContent);
			executor.execute(runable);
		}
		executor.shutdown();
		try {
			executor.awaitTermination(1200, TimeUnit.MINUTES);
		} catch (InterruptedException e1) {
			// TODO Auto-generated catch block
			log.error(e1.getMessage());
		}
		return true;
	}
}