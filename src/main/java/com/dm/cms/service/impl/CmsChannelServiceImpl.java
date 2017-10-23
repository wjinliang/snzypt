package com.dm.cms.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dm.cms.handler.generatorHtmlHandler;
import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsContent;
import com.dm.cms.model.CmsSite;
import com.dm.cms.model.CmsTemplate;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsContentService;
import com.dm.cms.service.CmsTemplateConfigService;
import com.dm.cms.sqldao.CmsChannelMapper;
import com.dm.cms.sqldao.CmsContentMapper;
import com.dm.cms.sqldao.CmsSiteMapper;
import com.dm.cms.sqldao.CmsTemplateMapper;
import com.dm.cms.sqldao.CmsUserGroupMapper;
import com.dm.platform.dto.TreeNode;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.UserAccountUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * Created by cgj on 2015/11/24.
 */
@Service public class CmsChannelServiceImpl extends generatorHtmlHandler implements CmsChannelService {
	
	private Logger log = LoggerFactory.getLogger(CmsChannelServiceImpl.class);
	
	@Autowired CmsTemplateMapper cmsTemplateMapper;
    @Autowired CmsChannelMapper cmsChannelMapper;
    @Autowired CmsSiteMapper cmsSiteMapper;
    @Autowired CmsContentMapper cmsContentMapper;
    @Autowired CmsUserGroupMapper cmsUserGroupMapper;
    @Autowired CmsContentService cmsContentService; 
    @Autowired CmsTemplateConfigService cmsTemplateConfigService;
    String serperator = System.getProperty("file.separator");
    
    public void insertCmsChannel(CmsChannel cmsChannel) {
    	String channelType = cmsChannel.getChannelType();
    	cmsChannel.setChannelType(channelType==null?"0":channelType);
		cmsChannelMapper.insertSelective(cmsChannel);
		int channelId = cmsChannel.getId();
		if (cmsChannel.getTemplateId() == null) {// 设置默认模板
			cmsChannel.setTemplateId(cmsTemplateConfigService.load(null,
					channelId).getChannelTemplateId());
		}
		cmsChannel.setSeq(channelId);
		cmsChannelMapper.updateByPrimaryKeySelective(cmsChannel);
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
			map.put("channelId", channelId);
			maps.add(map);
		}
		this.cmsUserGroupMapper.insertGroupChannel(maps);
		if(cmsChannel.getChannelType().equals("3")){//单页频道
			CmsContent content = new CmsContent();
			content.setChannelId(channelId);
			content.setTitle("单页频道内容");
			content.setSiteDomain(cmsChannel.getSiteDomain());
			content.setChannelEnName(cmsChannel.getEnName());
			content.setContentText(cmsChannel.getContentText());
			content.setContentType(3);
			cmsContentMapper.insertSelective(content);
			cmsChannel.setPageSize(content.getId());
			cmsChannelMapper.updateByPrimaryKeySelective(cmsChannel);
		}
	}


    @Override public int updateCmsChannel(CmsChannel cmsChannel,boolean f) {
        int result = cmsChannelMapper.updateByPrimaryKeySelective(cmsChannel);
        if(result == 1 && f && cmsChannel.getChannelType().equals("3")){//单页频道
        	String contentText = cmsChannel.getContentText();
        	cmsChannel = cmsChannelMapper.selectByPrimaryKey(cmsChannel.getId());
        	Integer contentId = cmsChannel.getPageSize();
        	CmsContent con = cmsContentMapper.selectByPrimaryKey(contentId);
        	if(con!=null){
        	con.setContentText(contentText);
        	cmsContentMapper.updateByPrimaryKeyWithBLOBs(con);
        	}else{
        		CmsContent content = new CmsContent();
        		content.setChannelId(cmsChannel.getId());
    			content.setTitle("单页频道内容");
    			content.setSiteDomain(cmsChannel.getSiteDomain());
    			content.setChannelEnName(cmsChannel.getEnName());
    			content.setContentText(cmsChannel.getContentText());
    			content.setContentType(3);
    			cmsContentMapper.insertSelective(content);
    			cmsChannel.setPageSize(content.getId());
    			cmsChannelMapper.updateByPrimaryKeySelective(cmsChannel);
        	}
		}
        return result;
    }

    @Override
	public void deleteCmsChannel(int cmsChannelId) {
		cmsChannelMapper.deleteByPrimaryKey(cmsChannelId);
		Map map = new HashMap();
		List list = new ArrayList<String>();
		list.add(cmsChannelId);
		map.put("channelId", list);
		this.cmsUserGroupMapper.deleteGroupChannel(map);
	}


    @Override public CmsChannel findOneById(int cmsChannelId) {
    	CmsChannel channel = cmsChannelMapper.selectByPrimaryKey(cmsChannelId);
    	if(channel!=null && "3".equals(channel.getChannelType())){
    		Integer contentId = channel.getPageSize();
    		if(contentId==null){
    			return channel;
    		}
        	CmsContent con = cmsContentMapper.selectByPrimaryKey(contentId);
        	if(con==null){
        		return channel;
        	}
        	channel.setContentText(con.getContentText());
    	}
    	return channel;
    }

    @Override public CmsChannel findOneByEnName(String enName) {
        return cmsChannelMapper.selectByEnName(enName);
    }

    @Override public CmsChannel findOneByPortal(String domain, String enName) {
        return cmsChannelMapper.selectByDomainAndEnName(domain, enName);
    }

    @Override public PageInfo<CmsChannel> findCmsChannelByPage(Integer pageNum, Integer pageSize,
        CmsChannel cmsChannel) {
    	String userId = UserAccountUtil.getInstance().getCurrentUserId();
        Map map = new HashMap();
        map.put("uid", userId);
        map.put("model", cmsChannel);
        PageHelper.startPage(pageNum, pageSize);
        List<CmsChannel> list = cmsChannelMapper.selectRecordsByArgMap(map);
        PageInfo<CmsChannel> page = new PageInfo<CmsChannel>(list);
        return page;
    }

    @Override public List<TreeNode> findCmsChannelTreeNodeBySiteId(int siteId, String channelType,String isfilter) {
        Map map = new HashMap();
        Map model = new HashMap();
        model.put("siteId", siteId);
        model.put("channelType", channelType);
        model.put("isFilter", isfilter);
        map.put("model", model);
        String userId = UserAccountUtil.getInstance().getCurrentUserId();
    	map.put("uid", userId);
        return cmsChannelMapper.selectTreeNodes(map);
    }

    @Override public List<TreeNode> findCmsChannelTreeNodeWithSiteNode() {
        Map channelArgMap = new HashMap();
        List<TreeNode> channelNodes = cmsChannelMapper.selectTreeNodes(channelArgMap);
        for (TreeNode treeNode : channelNodes) {
            if (treeNode.getpId() == 0) {
                treeNode.setpId(-treeNode.getI());
            }
            ;
        }
        Map siteArgMap = new HashMap();
        List<TreeNode> siteNodes = cmsSiteMapper.selectTreeNodesByArgMap(siteArgMap);
        for (TreeNode siteNode : siteNodes) {
            siteNode.setpId(0);
            siteNode.setId(-siteNode.getId());
            Collections.addAll(channelNodes, siteNode);
        }
        return channelNodes;
    }

    @Override public List<TreeNode> findCmsChannelTreeNodeWithSiteNodeFilterByUser() {
        String currentUserName = UserAccountUtil.getInstance().getCurrentUser();

        return null;
    }

    
    @Override public void updateSortOfCmsChannel(int fromCmsChannelId, int toCmsChannelId) {

    }
    
    
    @Override
	public Object sort(Integer id, Integer targetId, Integer pid,
			String moveType) {
		Map<String, Object> map = new HashMap<String, Object>();
		String userId = UserAccountUtil.getInstance().getCurrentUserId();
		map.put("pid", pid);
		map.put("uid", userId);
		List<CmsChannel> list = this.cmsChannelMapper
				.selectRecordsByArgMap(map);
		Integer min = 0;
		Integer minmore = 0;
		Integer maxmore = 0;
		Integer max = 0;
		int size = list.size();
		for (int i = 0; i <size ; i++) {
			CmsChannel c = list.get(i);
			if (id.equals(c.getId())) {
				max = c.getSeq();
			}
			if (targetId.equals(c.getId())) {
				min = c.getSeq();
				if (i + 1 < size) {
					minmore = list.get(i + 1).getSeq();
				}
				if(i-1>=0){
					maxmore = list.get(i-1).getSeq();
				}
			}
		}
		if (min < max) {// 向上拖动
			Collections.reverse(list);
			if (moveType.equals("prev")) {
				updateSeq1(list,min,max);
			} else {
				updateSeq1(list,minmore,max);
			}
		} else if (min > max) {// 向下拖动
			if (moveType.equals("prev")) {
				updateSeq(list,max,maxmore);
			} else {
				updateSeq(list,max,min);
			}
		}
		return ResponseUtil.success();
	}
	// 向上拖动
	private void updateSeq1(List<CmsChannel> list, Integer min, Integer max) {
		boolean f = true;
		Integer temp = 0;
		for (CmsChannel c : list) {
			if (c.getSeq() >= min && c.getSeq() <max) {
				Integer s = c.getSeq();
				c.setSeq(temp);
				this.cmsChannelMapper.updateByPrimaryKey(c);
				temp = s;
			}
			if (c.getSeq().equals(max)) {
				if (f) {
					temp = c.getSeq();
					c.setSeq(min);
					this.cmsChannelMapper.updateByPrimaryKey(c);
					f = false;
				}
			}
		}
		
	}
	// 向下拖动
	private void updateSeq(List<CmsChannel> list, Integer min, Integer max) {
		boolean f = true;
		Integer temp = 0;
		for (CmsChannel c : list) {
			if (c.getSeq() > min && c.getSeq() <= max) {
				Integer s = c.getSeq();
				c.setSeq(temp);
				this.cmsChannelMapper.updateByPrimaryKey(c);
				temp = s;
			}
			if (c.getSeq().equals(min)) {
				if (f) {
					temp = c.getSeq();
					c.setSeq(max);
					this.cmsChannelMapper.updateByPrimaryKey(c);
					f = false;
				}
			}
		}
		
	}
    
    @Override
    public List<CmsChannel> findByRoot(Map argMap)
    {	
    	Integer pageNum =null;
    	Integer pageSize = null;
    	if(argMap.get("pageSize")!=null){
    		pageSize = Integer.valueOf(argMap.get("pageSize").toString());
    		if(argMap.get("pageNum")!=null){
    			pageNum = Integer.valueOf(argMap.get("pageNum").toString());
    		}
    		if(pageNum==null) pageNum=1;
    	}
    	if(pageSize!=null){
    		PageHelper.startPage(pageNum, pageSize);
    	}
    	List<CmsChannel> cmsChannels =  cmsChannelMapper.selectByRoot(argMap);
    	if(pageSize!=null){
    		PageInfo<CmsChannel> page = new PageInfo<CmsChannel>(cmsChannels);
    		cmsChannels = page.getList();
    	}
    	return cmsChannels;
    }
    
    @Override
    public boolean generateHtml(HttpServletRequest request,int channelId)
    {
    	boolean success = true; 
    	CmsChannel channel = this.findOneById(channelId);
    	if(channel.getChannelType().equals("2")){//链接频道
			return true;
		}
    	CmsSite site = cmsSiteMapper.selectByPrimaryKey(channel.getSiteId());
    	CmsTemplate cmsTemplate = new CmsTemplate();
    	if(channel.getTemplateId()!=null){
    		cmsTemplate =  cmsTemplateMapper.selectByPrimaryKey(channel.getTemplateId());
	    }
    	StringBuffer iteratorChannelName = new StringBuffer();
		iteratorChannelName = getChannelenNameByIterator(channelId, iteratorChannelName);
		String htmldir = serperator+iteratorChannelName;
		int total = cmsContentService.selectCountBychannelIdOnly(channelId);
		Integer totalpage =total /channel.getPageSize();
		if(total==0)
		{
			totalpage=1;
		}
		if (total % channel.getPageSize() != 0) {
			totalpage++;
		}
		for(int i = 1;i<=totalpage;i++){
			Map<String, Object> root = new HashMap<String, Object>();
			root.put("own", channelId);
			root.put("parent",channel.getPid());
			root.put("pageNum", i);
			root.put("htmlFolder", htmlFolder);
			root.put("channel", channel);
			root.put("site", site);
			root.put("pageSize",channel.getPageSize());
			root.put("superChannel", getSuperChannel(channel));
			String htmlFile = serperator + channel.getEnName()+"_"+i+".html";
			success = this.generatorHtmlPCAndModile(cmsTemplate.getTemplatePath(),htmldir,htmlFile, root, request);
		    if(!success)
		    {
		    	log.error("----频道静态化失败----[{},{}]",channel.getId(),channel.getDisplayName());
		    }
		}
		if(success)
		{
			channel.setIsHtml(true);
			channel.setUrl(htmlFolder+"/"+iteratorChannelName+channel.getEnName()+"_1.html");
			log.debug("URL频道网址地址{}",channel.getUrl());
			Date now = new Date();
			channel.setUpdateTime(now);
			cmsChannelMapper.updateByPrimaryKeySelective(channel);
			log.info("==============频道静态化成功！[id={},name={}]",channel.getId(),channel.getDisplayName());
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
    @Override
    public boolean cancelGeneratorHtml(Integer channelId,HttpServletRequest request)
    {
    	String webappDir = request.getSession().getServletContext().getRealPath("/");
    	String projectName = request.getContextPath();
    	webappDir = webappDir.substring(0,webappDir.indexOf(projectName.substring(1))-1);
    	CmsChannel channel = cmsChannelMapper.selectByPrimaryKey(channelId);
        StringBuffer iteratorChannelName = new StringBuffer();
		iteratorChannelName = getChannelenNameByIterator(channelId, iteratorChannelName);
		String htmldir = webappDir+htmlFolder+serperator+iteratorChannelName;
		File file = new File(htmldir);
		if(file.exists())
		{
			file.delete();
		}
		String mobilehtmldir = webappDir+htmlFolder+htmlMobileFolder+serperator+iteratorChannelName;
		File filem = new File(mobilehtmldir);
		if(filem.exists())
		{
			filem.delete();
		}
    	channel.setIsHtml(false);
    	cmsChannelMapper.updateByPrimaryKeySelective(channel);
    	return true;
    }
    
    public StringBuffer getChannelenNameByIterator(Integer ChannelId,StringBuffer channelEnNamedir)
	{
    	CmsChannel channel = cmsChannelMapper.selectByPrimaryKey(ChannelId);
		if(channel!=null)
		{
			channelEnNamedir.insert(0,"/");
			channelEnNamedir.insert(0,channel.getEnName());
			if(channel.getPid().intValue()!=0)
			{
				log.debug("---{}---",channel.getPid().intValue());
				getChannelenNameByIterator(channel.getPid(),channelEnNamedir);
			}
			else
			{
				CmsSite site = cmsSiteMapper.selectByPrimaryKey(channel.getSiteId());
				channelEnNamedir.insert(0,"/");
				channelEnNamedir.insert(0,site.getDomain());
			}
		}
		return channelEnNamedir;
	}


	@Override
	public List<Integer> selectChildChannelIdList(Integer channelId) {
		return this.cmsChannelMapper.selectByPId(channelId);
	}


	@Override
	public List<CmsChannel> findAllByRoot(String channelType) {
		// TODO Auto-generated method stub
		return cmsChannelMapper.findAllByRoot(channelType);
	}
    
}