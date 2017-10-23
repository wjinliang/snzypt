package com.dm.cms.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.dm.cms.model.CmsAudio;
import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsContent;
import com.dm.cms.model.CmsNovel;
import com.dm.cms.model.CmsVideo;
import com.dm.cms.model.CmsVisitCountVo;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsStatisticService;
import com.dm.cms.sqldao.CmsAudioMapper;
import com.dm.cms.sqldao.CmsContentMapper;
import com.dm.cms.sqldao.CmsContentVisitRecordMapper;
import com.dm.cms.sqldao.CmsNovelMapper;
import com.dm.cms.sqldao.CmsStatisticMapper;
import com.dm.cms.sqldao.CmsVideoMapper;
import com.dm.platform.model.UserAccount;
import com.dm.platform.util.DmDateUtil;
import com.dm.platform.util.UserAccountUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class CmsStatisticServiceImp implements CmsStatisticService {
	private Logger log = LoggerFactory.getLogger(CmsStatisticServiceImp.class);

	@Autowired
	private CmsContentVisitRecordMapper cmsContentVisitRecordMapper;
	@Autowired
	private CmsChannelService cmsChannelService;
	@Autowired
	private CmsContentMapper cmsContentMapper;
	@Autowired
	private CmsVideoMapper cmsVideoMapper;
	@Autowired
	private CmsAudioMapper cmsAudioMapper;
	@Autowired
	private CmsNovelMapper cmsNovelMapper;
	@Autowired
	private CmsStatisticMapper cmsStatisticMapper;
	
	@Override
	public PageInfo<CmsVisitCountVo> siteVisitList(Integer pageNum,
			Integer pageSize, CmsVisitCountVo cmsVisitCountVo, Integer days) {
		setDate(cmsVisitCountVo, days);
		PageHelper.startPage(pageNum, pageSize);
		List<CmsVisitCountVo> list = cmsContentVisitRecordMapper
				.selectVisitListForSite(cmsVisitCountVo);
		PageInfo<CmsVisitCountVo> page = new PageInfo<CmsVisitCountVo>(list);
		return page;
	}

	private void setDate(CmsVisitCountVo cmsVisitCountVo, Integer days) {
		if(days != null)
		{
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String dateStr = sf.format(date);
		try {
			date = sf.parse(dateStr);// date > yyyy-MM-dd 00:00:00
		} catch (ParseException e) {
			log.error(e.getMessage());
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		days = days - 1; // 今天
		cal.add(Calendar.DAY_OF_MONTH, -days);
		date = cal.getTime();
		cmsVisitCountVo.setDate(date);
		}
		else
		{
			cmsVisitCountVo.setDate(null);
		}
		
	}

	@Override
	public PageInfo<CmsVisitCountVo> channelVisitList(Integer pageNum,
			Integer pageSize, CmsVisitCountVo cmsVisitCountVo, Integer days) {
		setDate(cmsVisitCountVo, days);
		PageHelper.startPage(pageNum, pageSize);
		cmsVisitCountVo.setSort("count desc");
		List<CmsVisitCountVo> list = cmsContentVisitRecordMapper
				.selectVisitListForChannel(cmsVisitCountVo);
		PageInfo<CmsVisitCountVo> page = new PageInfo<CmsVisitCountVo>(list);
		return page;
	}

	@Override
	public PageInfo<CmsVisitCountVo> contentVisitList(Integer pageNum,
			Integer pageSize, CmsVisitCountVo cmsVisitCountVo, Integer days) {
		setDate(cmsVisitCountVo, days);
		if(cmsVisitCountVo.getChannelType()==null){
			cmsVisitCountVo.setChannelType("0");//默认普通新闻
		}
		PageHelper.startPage(pageNum, pageSize);
		List<CmsVisitCountVo> list = cmsContentVisitRecordMapper
				.selectVisitListForContent(cmsVisitCountVo);
		PageInfo<CmsVisitCountVo> page = new PageInfo<CmsVisitCountVo>(list);
		return page;
	}

	@Override
	public void addVisited(CmsVisitCountVo cmsVisitCountVo,
			HttpServletRequest request) {
		String channelType = cmsVisitCountVo.getChannelType();
		Integer channelId = null;
		if (StringUtils.hasText(cmsVisitCountVo.getChannelEnName())) {
			CmsChannel channel = cmsChannelService
					.findOneByEnName(cmsVisitCountVo.getChannelEnName());
			if (channel != null) {
				channelId = channel.getId();
			}
		}
		Integer cId = cmsVisitCountVo.getContentId();
		if (cId != null&&channelType.equals("0")) {
			CmsContent c = this.cmsContentMapper.selectByPrimaryKey(cId);
			channelId = c.getChannelId();
		}else if (cId != null&&channelType.equals("5")) {
			CmsVideo c = this.cmsVideoMapper.selectByPrimaryKey(cId);
			channelId = c.getChannelId();
		}else if (cId != null&&channelType.equals("6")) {
			CmsAudio c = this.cmsAudioMapper.selectByPrimaryKey(cId);
			channelId = c.getChannelId();
		}else if (cId != null&&channelType.equals("7")) {
			CmsNovel c = this.cmsNovelMapper.selectByPrimaryKey(cId);
			channelId = c.getChannelId();
		}else{
			
		}
		String userId = null;
		UserAccount userAccount = UserAccountUtil.getInstance().getCurrentUserAccount();
		// TODO 获取当前登陆的用户id
		if(userAccount!=null)
		{
			userId= userAccount.getCode();
		}
		String visitTime = DmDateUtil.Current();
		String ip = UserAccountUtil.getInstance().getRequestIp(request);
		this.cmsContentVisitRecordMapper.insertVisitRecord(cId, channelId,channelType,
				userId,visitTime, ip);

	}

	@Override
	public Map pubulishList(Integer pageNum, Integer pageSize,
			CmsVisitCountVo cmsVisitCountVo, int days) {
		setDate(cmsVisitCountVo, days);
		PageHelper.startPage(pageNum, pageSize);
		List<CmsVisitCountVo> listlimit = cmsContentVisitRecordMapper
				.selectPublishListLimit(cmsVisitCountVo);
		PageInfo<CmsVisitCountVo> page = new PageInfo<CmsVisitCountVo>(
				listlimit);
		List<CmsVisitCountVo> limit = page.getList();
		long total = limit.size();
		if (total == 0) {
			List<CmsVisitCountVo> list = new ArrayList<CmsVisitCountVo>();
			Map map = new HashMap();
			map.put("status", 1);
			map.put("total", total);
			map.put("data", list);
			return map;
		}
		List<Integer> channelIds = new ArrayList<Integer>();
		for (CmsVisitCountVo vo : limit) {
			channelIds.add(vo.getChannelId());
		}
		List<CmsVisitCountVo> list = cmsContentVisitRecordMapper
				.selectPublishList(cmsVisitCountVo, channelIds);
		list = add0(list);
		Map map = new HashMap();
		map.put("status", 1);
		map.put("total", total);
		map.put("data", list);
		return map;
	}

	// 补充访问为0的
	private List<CmsVisitCountVo> add0(List<CmsVisitCountVo> list) {
		Set<String> dates = new TreeSet<String>();
		Set<String> titles = new HashSet<String>();
		for (CmsVisitCountVo vo : list) {
			dates.add(vo.getDateStr());
			titles.add(vo.getTitle());
		}
		List<CmsVisitCountVo> listAll = new ArrayList<CmsVisitCountVo>();
		List<CmsVisitCountVo> listCha = new ArrayList<CmsVisitCountVo>();
		int n = 0;
		for (String date : dates) {
			for (int i = n; i < list.size(); i++) {
				n = i;
				CmsVisitCountVo vo = list.get(i);
				if (!date.equals(vo.getDateStr())) {
					for (String t : titles) {
						boolean f = true;
						for (CmsVisitCountVo c : listCha) {
							if (t.equals(c.getTitle())) {
								f = false;
								break;
							}
						}
						if (f) {
							CmsVisitCountVo temp = new CmsVisitCountVo();
							temp.setCount(0);
							temp.setDateStr(date);
							temp.setTitle(t);
							listAll.add(temp);
						}
					}

					listCha.clear();
					listCha.add(vo);
					break;
				}
				listCha.add(vo);
				listAll.add(vo);
				if (i == list.size() - 1) {
					for (String t : titles) {
						boolean f = true;
						for (CmsVisitCountVo c : listCha) {
							if (t.equals(c.getTitle())) {
								f = false;
								break;
							}
						}
						if (f) {
							CmsVisitCountVo temp = new CmsVisitCountVo();
							temp.setCount(0);
							temp.setDateStr(date);
							temp.setTitle(t);
							listAll.add(temp);
						}
					}

					listCha.clear();
					listCha.add(vo);
				}
			}
		}
		return listAll;

	}

	@Override
	public Integer selectCountByContentId(Integer contentId, String channelType) {
		// TODO Auto-generated method stub
		return cmsContentVisitRecordMapper.selectCountByContentId(contentId, channelType);
	}

	@Override
	public Map<String,Object> selectSiteStatisticList(Integer pageNum,
			Integer pageSize, String sort, Map map) {
		PageInfo<Map> page = null;
		Map returnMap  = new HashMap<String,Object>();
		returnMap.put("status", "1");
		returnMap.put("total",0);
		returnMap.put("data", Collections.emptyList());
		List<Map> listMap = new ArrayList<Map>();
		if(sort!=null && !"".equals(sort)){
			sort = sort.toUpperCase().replace("_"," ");
			map.put("sort", sort);
		}
		if(sort.startsWith("COUNT")){
			CmsVisitCountVo cmsVisitCountVo = new CmsVisitCountVo();
			cmsVisitCountVo.setSort(sort);
			PageHelper.startPage(pageNum, pageSize);
			List<CmsVisitCountVo> visit = this.cmsContentVisitRecordMapper.selectVisitListForSite(cmsVisitCountVo);
			PageInfo<CmsVisitCountVo> page1 = new PageInfo<CmsVisitCountVo>(visit);
			for(CmsVisitCountVo v:page1.getList()){
				Integer siteId = v.getSiteId();
				map.put("siteId", siteId);
				map.remove("sort");
				List<Map> list = cmsStatisticMapper
						.selectSiteStatisticList(map);
				Map record = list.get(0);
				int count = v.getCount();
				int template = cmsStatisticMapper.selectTemplateCountForSite(siteId);
				record.put("count", v.getCount());
				record.put("templateCount", template);
				listMap.add(record);
			}
			returnMap.put("data",listMap);
			returnMap.put("status", "1");
			returnMap.put("total",page1.getTotal());
		}else{
			PageHelper.startPage(pageNum, pageSize);
			List<Map> list = cmsStatisticMapper
					.selectSiteStatisticList(map);
			page = new PageInfo<Map>(list);
			for(Map record :page.getList()){
				Integer siteId = (Integer)record.get("siteId");
				CmsVisitCountVo cmsVisitCountVo = new CmsVisitCountVo();
				cmsVisitCountVo.setSiteId(siteId);
				cmsVisitCountVo.setSort("count desc");
				List<CmsVisitCountVo> visit = this.cmsContentVisitRecordMapper.selectVisitListForSite(cmsVisitCountVo);
				int template = cmsStatisticMapper.selectTemplateCountForSite(siteId);
				record.put("templateCount", template);
				record.put("count", visit.get(0).getCount());
			}
			returnMap.put("data",page.getList());
			returnMap.put("status", "1");
			returnMap.put("total",page.getTotal());
		}
		return returnMap;
	}

	@Override
	public Map<String,Object> selectChannelStatisticList(Integer pageNum,
			Integer pageSize, String sort, Map map) {
		PageInfo<Map> page = null;
		Map returnMap  = new HashMap<String,Object>();
		returnMap.put("status", "1");
		returnMap.put("total",0);
		returnMap.put("data", Collections.emptyList());
		List<Map> listMap = new ArrayList<Map>();
		if(sort!=null && !"".equals(sort)){
			sort = sort.toUpperCase().replace("_"," ");
			map.put("sort", sort);
		}
		if(sort.contains("COUNT")){
			CmsVisitCountVo cmsVisitCountVo = new CmsVisitCountVo();
			cmsVisitCountVo.setSort(sort);
			PageHelper.startPage(pageNum, pageSize);
			List<CmsVisitCountVo> visit = this.cmsContentVisitRecordMapper.selectVisitListForChannel(cmsVisitCountVo);
			PageInfo<CmsVisitCountVo> page1 = new PageInfo<CmsVisitCountVo>(visit);
			for(CmsVisitCountVo v:page1.getList()){
				Integer channelId = v.getChannelId();
				map.put("channelId", channelId);
				map.remove("sort");
				List<Map> list = cmsStatisticMapper
						.selectChannelStatisticList(map);
				Map record = list.get(0);
				int count = v.getCount();
				record.put("count", v.getCount());
				listMap.add(record);
			}
			returnMap.put("data",listMap);
			returnMap.put("status", "1");
			returnMap.put("total",page1.getTotal());
		}else{
			PageHelper.startPage(pageNum, pageSize);
			List<Map> list = cmsStatisticMapper
					.selectChannelStatisticList(map);
			page = new PageInfo<Map>(list);
			for(Map record :page.getList()){
				Integer channelId = (Integer)record.get("id");
				CmsVisitCountVo cmsVisitCountVo = new CmsVisitCountVo();
				cmsVisitCountVo.setChannelId(channelId);
				cmsVisitCountVo.setSort("count desc");
				List<CmsVisitCountVo> visit = this.cmsContentVisitRecordMapper.selectVisitListForChannel(cmsVisitCountVo);
				record.put("count", visit.get(0).getCount());
			}
			returnMap.put("data",page.getList());
			returnMap.put("status", "1");
			returnMap.put("total",page.getTotal());
		}
		return returnMap;
	}

	@Override
	public Map<String,Object> selectUserStatisticList(Integer pageNum,
			Integer pageSize, String sort, Map map) {
		PageInfo<Map> page = null;
		Map returnMap  = new HashMap<String,Object>();
		returnMap.put("status", "1");
		returnMap.put("total",0);
		returnMap.put("data", Collections.emptyList());
		List<Map> listMap = new ArrayList<Map>();
		if(sort!=null && !"".equals(sort)){
			sort = sort.toUpperCase().replace("_"," ");
			map.put("sort", sort);
		}
		if(sort.startsWith("COUNT")){
			CmsVisitCountVo cmsVisitCountVo = new CmsVisitCountVo();
			cmsVisitCountVo.setSort(sort);
			PageHelper.startPage(pageNum, pageSize);
			List<Map> visit = this.cmsContentVisitRecordMapper.selectVisitListForUser(map);
			PageInfo<Map> page1 = new PageInfo<Map>(visit);
			for(Map v:page1.getList()){
				String userCode  = v.get("code").toString();
				map.put("code", userCode);
				map.remove("sort");
				List<Map> list = cmsStatisticMapper
						.selectUserStatisticList(map);
				Map record = list.get(0);
				Integer count =Integer.valueOf( v.get("count").toString());
				record.put("count", count);
				listMap.add(record);
			}
			returnMap.put("data",listMap);
			returnMap.put("status", "1");
			returnMap.put("total",page1.getTotal());
		}else{
			PageHelper.startPage(pageNum, pageSize);
			List<Map> list = cmsStatisticMapper
					.selectUserStatisticList(map);
			page = new PageInfo<Map>(list);
			for(Map record :page.getList()){
				String userCode = (String)record.get("code");
				List<Map> visit = this.cmsContentVisitRecordMapper.selectVisitListForUser(map);
				record.put("count", visit.get(0).get("count"));
			}
			returnMap.put("data",page.getList());
			returnMap.put("status", "1");
			returnMap.put("total",page.getTotal());
		}
		return returnMap;
	}

}
