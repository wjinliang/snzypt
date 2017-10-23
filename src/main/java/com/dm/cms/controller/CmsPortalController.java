package com.dm.cms.controller;

import java.awt.image.BufferedImage;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.collections.ListUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dm.cms.model.CmsAttachment;
import com.dm.cms.model.CmsAudio;
import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.CmsContent;
import com.dm.cms.model.CmsInterview;
import com.dm.cms.model.CmsInterviewQuestions;
import com.dm.cms.model.CmsNovel;
import com.dm.cms.model.CmsQuestionnaires;
import com.dm.cms.model.CmsSite;
import com.dm.cms.model.CmsTemplate;
import com.dm.cms.model.CmsVideo;
import com.dm.cms.model.CmsVote;
import com.dm.cms.model.CmsVoteOption;
import com.dm.cms.service.CmsAttachmentService;
import com.dm.cms.service.CmsAudioService;
import com.dm.cms.service.CmsChannelService;
import com.dm.cms.service.CmsContentService;
import com.dm.cms.service.CmsInterviewQuestionsService;
import com.dm.cms.service.CmsInterviewService;
import com.dm.cms.service.CmsNovelService;
import com.dm.cms.service.CmsQuestionnairesService;
import com.dm.cms.service.CmsSiteService;
import com.dm.cms.service.CmsTemplateService;
import com.dm.cms.service.CmsVideoService;
import com.dm.cms.service.CmsVoteService;
import com.dm.cms.util.PageUtil;
import com.dm.module.model.OrgPerson;
import com.dm.module.service.MicrocobolService;
import com.dm.module.service.OrgPersonService;
import com.dm.platform.model.Org;
import com.dm.platform.service.OrgService;
import com.dm.platform.util.DmDateUtil;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.RandomValidateCode;
import com.dm.platform.util.RequestUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.search.service.SearchConfigService;
import com.dm.websurvey.model.Leader;
import com.dm.websurvey.model.WebSurvey;
import com.dm.websurvey.service.LeaderService;
import com.dm.websurvey.service.WebSurveyService;
import com.github.pagehelper.PageInfo;

/**
 * Created by cgj on 2015/11/23.
 */
@Controller
@RequestMapping("/portal")
public class CmsPortalController {

	/*@Value("${projectName}")
	String projectName;*/

	/*@Value("${htmlMobileDir}")
	String htmlMobileFolder;

	@Value("${htmlDir}")
	String htmlFolder;*/
	@Value("${template.mobileBasePath}")
	String mobileFolder;
	@Value("${template.basePath}")
	String templateFolder;

	@Autowired
	protected CmsVideoService cmsVideoService;
	@Autowired
	protected CmsAudioService cmsAudioService;
	@Autowired
	protected CmsSiteService cmsSiteService;
	@Autowired
	protected CmsChannelService cmsChannelService;
	@Autowired
	protected CmsContentService cmsContentService;
	@Autowired
	protected CmsTemplateService cmsTemplateService;
	@Autowired
	protected CmsAttachmentService cmsAttachmentService;
	@Autowired
	protected CmsNovelService cmsNovelService;
	@Autowired
	SearchConfigService searchConfigService;
	@Autowired
	WebSurveyService webSurveyService;
	@Autowired
	private MicrocobolService microcobolService;
	@Autowired
	private CmsQuestionnairesService cmsQuestionnairesService;
	@Autowired
	private OrgPersonService orgPersonService;
	@Autowired
	LeaderService leaderService;
	@Autowired
	OrgService orgService;
	@Autowired
	private CmsVoteService cmsVoteService;
	@Autowired
	private CmsInterviewService cmsInterviewService;
	@Autowired
	private CmsInterviewQuestionsService cmsInterviewQServie;

	public static final String VILIDATECODE = "webSurveyValidateCode";

	private Logger log = LoggerFactory.getLogger(CmsPortalController.class);

	@RequestMapping("/{domain}/index.htm")
	public String site(Model model, @PathVariable("domain") String domain,
			Device device) {
		CmsSite cmsSite = cmsSiteService.findOneByDomain(domain);
		if (cmsSite == null) {
			return "404";
		}
		model.addAttribute("site", cmsSite);
		//model.addAttribute("htmlMobileFolder", htmlMobileFolder);
		//model.addAttribute("htmlFolder", htmlFolder);
		return getTemplatePath(cmsSite.getTemplateId(), device.isMobile());
	}

	/**
	 * 
	 * @param model
	 * @param code
	 *            1,县长，2书记,3镇或部门
	 * @return
	 */
	@RequestMapping(value = "/websurvey/form.htm", method = RequestMethod.GET)
	public String form(Model model, String code) // ,String leadId)
	{

		/*
		 * if(!StringUtils.isEmpty(leadId)) { Leader leader =
		 * leaderService.findOne(leadId); model.addAttribute("code",
		 * leader.getType()); model.addAttribute("leader", leader); }
		 */
		if (!StringUtils.isEmpty(code)) {
			if (code.equals("1")) {
				/*
				 * List<Leader> leaders = leaderService.findAll("1",null);
				 * Leader leader = new Leader(); if(leaders.size()>0) leader =
				 * leaders.get(0); model.addAttribute("leader", leader);
				 */
			} else if (code.equals("2")) {
				/*
				 * List<Leader> leaders = leaderService.findAll("2",null);
				 * Leader leader = new Leader(); if(leaders.size()>0) leader =
				 * leaders.get(0); model.addAttribute("leader", leader);
				 */
			} else if (code.equals("3")) {
				List<Org> orgs = orgService.listOrg(0, 1000,
						"where parent is not null and parent !=''");
				List list = new ArrayList();
				for (Org o : orgs) {
					Map map = new HashMap();
					map.put("id", o.getId().toString());
					map.put("name", o.getName());
					list.add(map);
				}
				model.addAttribute("orgs", list);
			} else {
				code = "1";
			}

		} else {
			code = "1";
		}
		model.addAttribute("code", code);

		return templateFolder + "/websurvey";
	}

	@RequestMapping("/leader/list")
	@ResponseBody
	public List<Leader> listLeader(Model model, String code) {
		if (code.equals("1")) {
			List<Leader> leaders = leaderService.findAll("1", null);
			return leaders;
		} else if (code.equals("2")) {
			List<Leader> leaders = leaderService.findAll("2", null);
			return leaders;
		} else {
			List<Leader> leaders = leaderService.findAll(null, null);
			return leaders;
		}
	}

	@RequestMapping("/leader/items")
	@ResponseBody
	public List<Map> leaderItems(Model model, String code) {
		List<Leader> leaders = new ArrayList<>();
		if (code.equals("1")) {
			leaders = leaderService.findAll("1", null);
		} else if (code.equals("2")) {
			leaders = leaderService.findAll("2", null);
		} else {
			leaders = leaderService.findAll(null, null);
		}
		List<Map> items = new ArrayList<Map>();
		for (Leader l : leaders) {
			Map item = new HashMap();
			item.put("text", l.getName());
			item.put("value", l.getId());
			items.add(item);
		}
		return items;
	}

	@RequestMapping(value = "/websurvey/form.htm", method = RequestMethod.POST)
	public String add(Model model, WebSurvey webSurvey,
			HttpServletRequest request, String viliCode) { // if(webSurvey.getCode())
		HttpSession session = request.getSession();
		String vilidateCode = session.getAttribute(VILIDATECODE) == null ? null
				: (String) session.getAttribute(VILIDATECODE);
		session.removeAttribute(VILIDATECODE);
		String title = webSurvey.getTitle();
		String content = webSurvey.getContent();
		model.addAttribute("websurvey", webSurvey);
		model.addAttribute("code", webSurvey.getCode());
		if (viliCode == null || vilidateCode == null
				|| !viliCode.equalsIgnoreCase(vilidateCode)) {
			if (webSurvey.getCode().equals("3")) {
				List<Org> orgs = orgService.listOrg(0, 1000,
						"where parent is not null and parent !=''");
				model.addAttribute("orgs", orgs);
			}
			model.addAttribute("msg", "验证码错误");
			return "/template/websurvey";
		}
		if (title == null || content == null) {
			if (webSurvey.getCode().equals("3")) {
				List<Org> orgs = orgService.listOrg(0, 1000,
						"where parent is not null and parent !=''");
				List list = new ArrayList();
				for (Org o : orgs) {
					Map map = new HashMap();
					map.put("id", o.getId().toString());
					map.put("name", o.getName());
					list.add(map);
				}
				model.addAttribute("orgs", list);
			}
			model.addAttribute("msg", "请填写内容");
			return "/template/websurvey";
		}
		if (title.equalsIgnoreCase("script")
				|| content.equalsIgnoreCase("script")) {
			if (webSurvey.getCode().equals("3")) {
				List<Org> orgs = orgService.listOrg(0, 500,
						"where parent is not null and parent !=''");
				model.addAttribute("orgs", orgs);
			}
			model.addAttribute("msg", "输入内容非法");
			return "/template/websurvey";
		}
		webSurvey.setIp(RequestUtil.getIpAddress(request));
		model.addAttribute("websurvey", webSurveyService.add(webSurvey));
		return "/template/success";
	}

	@RequestMapping("/websurvey/{channelId}_{pageNum}.htm")
	public String find(Model model,
			@PathVariable("channelId") Integer channelId,
			@PathVariable(value = "pageNum") Integer pageNum,
			WebSurvey webSurvey,
			@RequestParam(value = "param", required = false) String param,
			HttpServletRequest request) {
		CmsChannel cmsChannel = cmsChannelService.findOneById(channelId);
		if (cmsChannel == null)
			return "404";
		CmsSite cmsSite = cmsSiteService.findOneById(cmsChannel.getSiteId());
		model.addAttribute("superChannel", getSuperChannel(cmsChannel));
		model.addAttribute("own", channelId);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("site", cmsSite);
		model.addAttribute("channel", cmsChannel);
		//model.addAttribute("htmlFolder", htmlFolder);
		//model.addAttribute("htmlMobileFolder", htmlMobileFolder);
		////model.addAttribute("projectName", projectName);
		model.addAttribute("param", param);
		return "/template/jh-websuerveypage";
	}

	@RequestMapping("/search.htm")
	public String seach(Model model, Device device, String text) {
		CmsSite cmsSite = cmsSiteService.findOneByDomain("lanhai");
		if (cmsSite == null) {
			return "404";
		}
		model.addAttribute("site", cmsSite);
		model.addAttribute("own", 0);
		if (text == null) {
			text = "";
		}
		model.addAttribute("text", text);
		//model.addAttribute("htmlFolder", htmlFolder);
		if (device.isMobile()) {
			return mobileFolder + "/seach_page";
		}
		return templateFolder + "/seach_page";

	}

	@RequestMapping("/channel/{enName}/{channelId}_{pageNum}.htm")
	public String channel(Model model, Device device,
			@PathVariable("channelId") Integer channelId,
			@PathVariable("enName") String enName,
			@PathVariable(value = "pageNum") Integer pageNum,
			@RequestParam(value = "param", required = false) String param) {
		CmsChannel cmsChannel = cmsChannelService.findOneById(channelId);
		if (cmsChannel == null)
			return "404";
		CmsSite cmsSite = cmsSiteService.findOneById(cmsChannel.getSiteId());
		model.addAttribute("superChannel", getSuperChannel(cmsChannel));
		model.addAttribute("own", channelId);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("site", cmsSite);
		model.addAttribute("channel", cmsChannel);
		//model.addAttribute("htmlFolder", htmlFolder);
		//model.addAttribute("htmlMobileFolder", htmlMobileFolder);
		////model.addAttribute("projectName", projectName);
		model.addAttribute("param", param);
		return getTemplatePath(cmsChannel.getTemplateId(), device.isMobile());
	}

	private CmsChannel getSuperChannel(CmsChannel channel) {
		CmsChannel pChannel = this.cmsChannelService.findOneById(channel
				.getPid());
		if (pChannel == null) {
			return channel;
		}
		return getSuperChannel(pChannel);
	}

	@RequestMapping("/content/{contentId}.htm")
	public String content(Model model, Device device,
			@PathVariable("contentId") Integer contentId,
			RedirectAttributes arrt) {
		CmsContent cmsContent = cmsContentService.findOneById(contentId);
		CmsChannel cmsChannel = cmsChannelService.findOneById(cmsContent
				.getChannelId());
		model.addAttribute("superChannel", getSuperChannel(cmsChannel));
		CmsSite cmsSite = cmsSiteService.findOneById(cmsChannel.getSiteId());
		if (cmsContent.getContentType() != null
				&& cmsContent.getContentType().equals("10")) {
			Map doc = cmsContent.toDoc();
			model.addAttribute("doc", doc);
		} else
			model.addAttribute("cmsContent", cmsContent);
		//model.addAttribute("projectName", projectName);
		model.addAttribute("site", cmsSite);
		model.addAttribute("own", contentId);
		//model.addAttribute("htmlMobileFolder", htmlMobileFolder);
		//model.addAttribute("htmlFolder", htmlFolder);
		List<CmsAttachment> cmsAttachmentList = cmsContentService
				.findCmsAttachmentByCmsContentId(contentId);
		if (cmsAttachmentList.size() > 0) {
			model.addAttribute("cmsAttachments", cmsAttachmentList);
		}
		if (cmsContent == null)
			return "404";
		// return "/template/content";
		return getTemplatePath(cmsContent.getTemplateId(), device.isMobile());
	}

	@RequestMapping("/content_video/{videoId}.htm")
	public String videoShow(Model model, Device device,
			@PathVariable("videoId") Integer videoId) {
		//model.addAttribute("projectName", projectName);
		//model.addAttribute("htmlFolder", htmlFolder);
		CmsVideo cmsVideo = cmsVideoService.findOne(videoId);
		CmsChannel cmsChannel = cmsChannelService.findOneById(cmsVideo
				.getChannelId());
		model.addAttribute("superChannel", getSuperChannel(cmsChannel));
		CmsSite cmsSite = cmsSiteService.findOneById(cmsChannel.getSiteId());
		model.addAttribute("cmsVideo", cmsVideo);
		model.addAttribute("own", cmsVideo.getId());
		model.addAttribute("site", cmsSite);
		//model.addAttribute("htmlMobileFolder", htmlMobileFolder);
		return getTemplatePath(cmsVideo.getTemplateId(), device.isMobile());
	}

	@RequestMapping("/content_audio/{audioId}.htm")
	public String audioShow(Model model, Device device,
			@PathVariable("audioId") Integer audioId) {
		//model.addAttribute("projectName", projectName);
		//model.addAttribute("htmlFolder", htmlFolder);
		CmsAudio cmsAudio = cmsAudioService.findOne(audioId);
		CmsChannel cmsChannel = cmsChannelService.findOneById(cmsAudio
				.getChannelId());
		model.addAttribute("superChannel", getSuperChannel(cmsChannel));
		CmsSite cmsSite = cmsSiteService.findOneById(cmsChannel.getSiteId());
		model.addAttribute("cmsAudio", cmsAudio);
		model.addAttribute("own", cmsAudio.getId());
		model.addAttribute("site", cmsSite);
		//model.addAttribute("htmlMobileFolder", htmlMobileFolder);
		return getTemplatePath(cmsAudio.getTemplateId(), device.isMobile());
	}

	@RequestMapping("/content_novel/{novelId}.htm")
	public String novel(Model model, Device device,
			@PathVariable("novelId") Integer novelId, RedirectAttributes arrt) {
		CmsNovel novel = this.cmsNovelService.findById(novelId);
		if (novel == null)
			return "404";
		model.addAttribute("cmsNovel", novel);
		//model.addAttribute("projectName", projectName);
		model.addAttribute("own", novelId);
		CmsChannel cmsChannel = cmsChannelService.findOneById(novel
				.getChannelId());
		model.addAttribute("superChannel", getSuperChannel(cmsChannel));
		CmsSite cmsSite = cmsSiteService.findOneById(cmsChannel.getSiteId());
		//model.addAttribute("htmlFolder", htmlFolder);
		model.addAttribute("site", cmsSite);
		//model.addAttribute("htmlMobileFolder", htmlMobileFolder);
		return getTemplatePath(novel.getTemplateId(), device.isMobile());
	}

	private String getTemplatePath(Integer tempateId, boolean isMobile) {
		CmsTemplate cmsTemplate = cmsTemplateService.findOneById(tempateId);
		String template = cmsTemplate.getTemplatePath().replace(".ftl", "");
		if (isMobile) {
			template = templateFolder
					+ template.replace(templateFolder, mobileFolder);
		}
		return template;
	}

	@RequestMapping("/websurvey/findOne")
	public String findOne(Model model, WebSurvey webSurvey) {
		WebSurvey webSur = webSurveyService.findOne(webSurvey.getId());
		boolean isAllowedComment = false;
		if (webSur == null) {
			webSur = new WebSurvey();
			webSur.setTitle("查询编号有误!");
		}
		if (StringUtils.isNotEmpty(webSurvey.getPhone())) {
			isAllowedComment = true;
		}
		if (StringUtils.isNotEmpty(webSurvey.getPhone())){
			if(webSur.getPhone()!=null){
				if (!webSur.getPhone().equals(webSurvey.getPhone())) {
					webSur = new WebSurvey();
					webSur.setTitle("查询密码有误!");
					isAllowedComment = false;
				}
			}
		}
		model.addAttribute("webSurvey", webSur);
		model.addAttribute("isAllowedComment", isAllowedComment);
		return "/template/result";
	}

	@RequestMapping("/websurvey/isSatisfied")
	@ResponseBody
	public Object getLeader(Model model, String id, String isSatisfied) {
		if (id == null || id.equals("")) {
			return ResponseUtil.error();
		}
		WebSurvey webSur = webSurveyService.findOne(id);
		if (webSur == null) {
			return ResponseUtil.error();
		}
		if (webSur.getIsSatisfied() != null) {
			return ResponseUtil.success("已评价!");
		}
		webSur.setIsSatisfied(isSatisfied);
		this.webSurveyService.update(webSur);
		return ResponseUtil.success("评价成功!");
	}

	@RequestMapping("/leader/leaderfront")
	public String leaderfront(Model model, String id) {
		Leader leader = new Leader();
		if (StringUtils.isEmpty(id)) {
			List<Leader> leaders = leaderService.findAll(null, "县委");
			leader = leaders.get(0);

		} else {
			leader = leaderService.findOne(id);
			if (leader == null) {
				List<Leader> leaders = leaderService.findAll(null, "县委");
				leader = leaders.get(0);
			}
		}
		/*
		 * List<SearchResult> news = new ArrayList<SearchResult>();
		 * if(leader.getId()!=null){ try{ String name=leader.getName(); name =
		 * name.replace(" ",""); name="\""+name+"\""; Map m =
		 * this.searchConfigService.searchResults(leader.getName(),null, 1, 10,
		 * null, null, null,"#000", null); news =
		 * (List<SearchResult>)m.get("list"); }catch(RuntimeException e){ } }
		 * model.addAttribute("news", news);
		 */
		model.addAttribute("leader", leader);
		return "/template/leader";
	}

	/*@RequestMapping("/org/orgList")
	public String orgList(Model model, Integer pageNum, Integer pageSize) {
		pageNum = pageNum == null ? 1 : pageNum;
		pageSize = pageSize == null ? 15 : pageSize;
		List<Org> orgs = orgService.listOrg(pageNum - 1, pageSize,
				"where parent is not null");
		Long total = orgService.countMenuGrou();
		long totalPage = total / pageSize;
		long nextPage = 0;
		long prePage = 0;
		if (total % pageSize != 0) {
			totalPage++;
		}
		if (pageNum < totalPage) {
			nextPage = pageNum + 1;
		} else {
			nextPage = totalPage;
		}
		if (pageNum > 1) {
			prePage = pageNum - 1;
		} else {
			prePage = 1;
		}
		model.addAttribute("total", total);
		model.addAttribute("orgs", orgs);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("prePage", prePage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalPage", totalPage);
		return "/template/org_content";
	}*/
	@RequestMapping("/org/orgList")
	public String orgList(Model model, Integer pageNum, Integer pageSize) {
		pageNum = pageNum == null ? 1 : pageNum;
		pageSize = pageSize == null ? 15 : pageSize;
		PageInfo<OrgPerson> page = orgPersonService.findOrgPersonByPage(pageNum, pageSize, null);
		Long total = page.getTotal();
		long totalPage = total / pageSize;
		long nextPage = 0;
		long prePage = 0;
		if (total % pageSize != 0) {
			totalPage++;
		}
		if (pageNum < totalPage) {
			nextPage = pageNum + 1;
		} else {
			nextPage = totalPage;
		}
		if (pageNum > 1) {
			prePage = pageNum - 1;
		} else {
			prePage = 1;
		}
		List<Map> orgs = new ArrayList<Map>();
		for(OrgPerson o:page.getList()){
			Map map = new HashMap();
			map.put("name", o.getOrgName());
			map.put("orgDuty", o.getDuty());
			map.put("orgPerson",o.getPerson());
			orgs.add(map);
		}
		model.addAttribute("total", total);
		model.addAttribute("orgs", orgs);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("prePage", prePage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalPage", totalPage);
		return "/template/org_content";
	}

	@RequestMapping("/interview/{inteviewId}.htm")
	public String interiew(Model model,
			@PathVariable("inteviewId") Integer inteviewId) {
		CmsInterview c = this.cmsInterviewService.loadOne(inteviewId);
		//model.addAttribute("projectName", projectName);
		//model.addAttribute("htmlFolder", htmlFolder);
		//model.addAttribute("htmlMobileFolder", htmlMobileFolder);
		CmsChannel cmsChannel = cmsChannelService.findOneById(c.getChannelId());
		model.addAttribute("superChannel", getSuperChannel(cmsChannel));
		CmsSite cmsSite = cmsSiteService.findOneById(cmsChannel.getSiteId());
		model.addAttribute("site", cmsSite);
		model.addAttribute("own", inteviewId);
		model.addAttribute("cmsInterview", c);
		return "/template/jh-interview";
	}

	@RequestMapping("/vote/{voteId}.htm")
	public String vote(Model model, @PathVariable("voteId") Integer voteId) {
		//model.addAttribute("projectName", projectName);
		//model.addAttribute("htmlFolder", htmlFolder);
		//model.addAttribute("htmlMobileFolder", htmlMobileFolder);
		CmsVote webSur = this.cmsVoteService.findOne(voteId);
		CmsChannel cmsChannel = cmsChannelService.findOneById(webSur
				.getChannelId());
		model.addAttribute("superChannel", getSuperChannel(cmsChannel));
		CmsSite cmsSite = cmsSiteService.findOneById(cmsChannel.getSiteId());
		model.addAttribute("site", cmsSite);
		model.addAttribute("own", voteId);
		model.addAttribute("cmsVote", webSur);
		List<CmsVoteOption> potions = this.cmsVoteService.loadOpt(voteId);
		model.addAttribute("voteTimes", webSur.getFiled3());
		model.addAttribute("options", potions);
		return getTemplatePath(Integer.valueOf(webSur.getFiled2()), false);
	}

	@RequestMapping("/vote/{voteId}r.htm")
	public String voter(Model model, @PathVariable("voteId") Integer voteId) {
		//model.addAttribute("projectName", projectName);
		//model.addAttribute("htmlFolder", htmlFolder);
		//model.addAttribute("htmlMobileFolder", htmlMobileFolder);
		CmsVote webSur = this.cmsVoteService.findOne(voteId);
		CmsChannel cmsChannel = cmsChannelService.findOneById(webSur
				.getChannelId());
		model.addAttribute("superChannel", getSuperChannel(cmsChannel));
		CmsSite cmsSite = cmsSiteService.findOneById(cmsChannel.getSiteId());
		model.addAttribute("site", cmsSite);
		model.addAttribute("own", voteId);
		model.addAttribute("cmsVote", webSur);
		List<CmsVoteOption> potions = this.cmsVoteService.loadOpt(voteId);
		double count = 0;
		for (CmsVoteOption o : potions) {
			count += o.getClickTimes();
		}
		for (CmsVoteOption o : potions) {
			if(count==0){
				o.setFiled1("0.00%");
			}else{
			o.setFiled1(new DecimalFormat("0.00").format((double) (o
					.getClickTimes() / count * 100))
					+ "%");
			}
		}
		model.addAttribute("voteTimes", webSur.getFiled3());
		model.addAttribute("options", potions);
		return getTemplatePath(Integer.valueOf(webSur.getFiled2()), false)
				+ "-result";
	}

	@RequestMapping("/vote/click.do")
	@ResponseBody
	public Object sub(Integer voteId, String optionIds) {
		CmsVote o = cmsVoteService.findOne(voteId);
		if(o==null){
			return ResponseUtil.error();
		}
		Date start = DmDateUtil.StrToDate(o.getStartTime());
		Date end = DmDateUtil.StrToDate(o.getEndTime());
		Date now = new Date();
		if (end != null && now.after(end)) {
			return ResponseUtil.error("投票时间已过!");
		}
		if (start != null && now.before(start)) {
			return ResponseUtil.error("投票未开始!");
		}
		this.cmsVoteService.commitCheck(voteId, optionIds);
		return ResponseUtil.success("投票成功!");
	}

	@RequestMapping(value = "/search", produces = { "text/html;charset=UTF-8;",
			"application/json;" })
	@ResponseBody
	public Object search(
			@RequestParam(required = true, value = "text") String textValue,
			@RequestParam(required = false, value = "pageNum", defaultValue = "1") Integer pageNum,
			@RequestParam(required = false, value = "pageSize", defaultValue = "5") Integer pageSize,
			@RequestParam(required = false, value = "days") Integer days,
			@RequestParam(required = false, value = "sortField") String sortField,
			@RequestParam(required = false, value = "entity") String entity,
			String callback, Device device) {
		Map map = new HashMap();

		if (textValue == null || textValue.equals("")) {

			map.put("status", 0);
			map.put("mes", "请输入搜索关键词！");
			map.put("list", ListUtils.EMPTY_LIST);
			map.put("pageNum", pageNum);

			// return map;
			JSONObject jsonObject = JSONObject.fromObject(map);
			return callback + "(" + jsonObject.toString() + ")";
			// return callback+":({'status':'0','mes', '请输入搜索关键词！'})";
		}
		map = searchConfigService.searchResults(textValue, "", pageNum,
				pageSize, sortField, entity, days, device);
		map.put("pageNum", pageNum);
		// return map;
		JSONObject jsonObject = JSONObject.fromObject(map);
		// return callback+":({'status':'0','mes', '请输入搜索关键词！'})";
		// System.out.println(jsonObject.toString());
		return callback + "(" + jsonObject.toString() + ")";
	}
	@RequestMapping("/search_{pageNum}.html")
	public Object search(@RequestParam(required = false, value = "keywords") String textValue,
			Device device, 
			Model model,
			@PathVariable Integer pageNum,
			@RequestParam(required = false, value = "pageSize",defaultValue="20")Integer pageSize){
		CmsContent cms = new CmsContent();
		cms.setTitle(textValue);
		Map argMap = new HashMap();
		argMap.put("model", cms);
		CmsSite cmsSite = cmsSiteService.findOneById(1);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("site", cmsSite);
		PageInfo page= this.cmsContentService.findCmsContentByPage(pageNum, pageSize, argMap);
		model.addAttribute("page",PageConvertUtil.grid(page));
		CmsChannel  channel = new CmsChannel();
		channel.setId(0);
		channel.setUrl("/topiecms/portal/search_1.html");
		channel.setIsHtml(true);
		String pages = PageUtil.getInstance().channelPaginationList(channel,pageNum,page.getTotal(),pageSize).toString();
		model.addAttribute("textValue", textValue);
		model.addAttribute("paginationlist",pages);
		return "/template/my-search";
	}
	@RequestMapping("/searchText")
	public ModelAndView searchText(
			@RequestParam(required = false, value = "textValue") String textValue,
			@RequestParam(required = false, value = "pageNum", defaultValue = "1") Integer pageNum,
			@RequestParam(required = false, value = "pageSize", defaultValue = "10") Integer pageSize,
			@RequestParam(required = false, value = "sortField", defaultValue = "publishDate") String sortField,
			@RequestParam(required = false, value = "searchField", defaultValue = "") String searchField,
			@RequestParam(required = false, value = "days") Integer days,
			@RequestParam(required = false, value = "contentValue") String contentValue,
			@RequestParam(required = false, value = "entity") String entity,
			Device device, ModelAndView model) {
		pageNum = pageNum == null ? 1 : pageNum;
		pageSize = pageSize == null ? 10 : pageSize;
		long totalPage = 0L;
		if (textValue == null || textValue.equals("")) {
			Map map = new HashMap();
			map.put("list", ListUtils.EMPTY_LIST);
			map.put("totalPage", 1);
			map.put("pageNum", 1);
			map.put("perPage", 1);
			map.put("nextPage", 1);
			map.put("total", 0);
			map.put("status", 0);
			map.put("textValue", textValue);
			map.put("days", days == null ? 0 : days);
			map.put("title", searchField.contains("title"));
			map.put("content", searchField.contains("content"));
			model.addObject("result", map);
			model.setViewName("/template/jh-search");
			return model;
		}
		/*
		 * map.put("list", ListUtils.EMPTY_LIST); map.put("totalPage", 1);
		 * map.put("pageNum", 1); map.put("perPage", 1); map.put("nextPage", 1);
		 * map.put("total", 0); map.put("status",0);
		 */
		Map map = searchConfigService.searchResults(textValue, searchField,
				pageNum, pageSize, sortField, entity, days, device);
		map.put("days", days == null ? 0 : days);
		map.put("title", searchField.contains("title"));
		map.put("content", searchField.contains("content"));
		model.addObject("result", map);
		model.setViewName("/template/jh-search");
		log.debug("{}--contents", map.get("contents"));
		return model;
	}

	@RequestMapping("/interview/insertQ")
	@ResponseBody
	public Object insertQuestions(CmsInterviewQuestions record) {
		if (StringUtils.isEmpty(record.getContent())) {
			return ResponseUtil.success("请填写内容!");
		}
		if (StringUtils.isEmpty(record.getName())) {
			return ResponseUtil.success("请填写姓名!");
		}

		cmsInterviewQServie.insert(record);
		return ResponseUtil.success("谢谢参与!");
	}

	@RequestMapping("/interview/question")
	@ResponseBody
	public Object insertQuestions(CmsInterview record, ModelAndView model) {
		record = this.cmsInterviewService.loadOne(record.getId());
		model.addObject("cmsInterview", record);
		model.setViewName("template/jh-interview-question");
		return model;
	}

	@RequestMapping("/microcobol/page.htm")
	public Object microcobol(ModelAndView model) {
		/*
		 * Map record = this.microcobolService.selectAll();
		 * model.addObject("microcobols",record);
		 */
		model.setViewName("template/jh-weibo");
		return model;
	}

	@RequestMapping("/questionnaires/{id}.htm")
	public Object loadQuestionnaires(@PathVariable("id") Integer id,
			ModelAndView model) {
		CmsQuestionnaires que = this.cmsQuestionnairesService.loadWithVote(id);
		model.addObject("own", que);
		model.setViewName("template/jh-wsdc");
		return model;
	}
	@RequestMapping("/randomImage")
	public void randomImage(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			BufferedImage is = RandomValidateCode.getInstance().getRandcode(
					request, VILIDATECODE);
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "No-cache");
			response.setDateHeader("Expires", 0);
			response.setContentType("image/jpeg");
			ImageIO.write(is, "JPEG", response.getOutputStream()); // scaledImage1为BufferedImage，jpg为图像的类型
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*
	 * @RequestMapping("/channel/{enName}_{channelId}.htm") public String
	 * channel(Model model, @PathVariable("channelId") Integer channelId,
	 * 
	 * @PathVariable("enName") String enName,RedirectAttributes arrt ) {
	 * CmsChannel cmsChannel = cmsChannelService.findOneById(channelId);
	 * arrt.addFlashAttribute("cmsChannel", cmsChannel); CmsSite cmsSite =
	 * cmsSiteService.findOneById(cmsChannel.getSiteId()); String str =
	 * "/"+cmsSite.getDomain()+"/"+enName; String redirectUrl =
	 * "redirect:/portal"+str+".htm"; log.debug("重定向地址！{}",redirectUrl); if
	 * (cmsChannel == null) return "404"; return redirectUrl; }
	 * 
	 * @RequestMapping("/content/{contentId}.htm") public String content(Model
	 * model, @PathVariable("contentId") Integer contentId, RedirectAttributes
	 * arrt ) { model.addAttribute("basePath", getWholePath()); CmsContent
	 * cmsContent = cmsContentService.findOneById(contentId); CmsChannel
	 * cmsChannel = cmsChannelService.findOneById(cmsContent.getChannelId());
	 * CmsSite cmsSite = cmsSiteService.findOneById(cmsChannel.getSiteId());
	 * arrt.addFlashAttribute("cmsContent", cmsContent); String str =
	 * "/"+cmsSite.getDomain()+"/"+cmsChannel.getEnName()+"/"+contentId; String
	 * redirectUrl = "redirect:/portal"+str+".htm";
	 * log.debug("重定向地址！{}",redirectUrl); if (cmsContent == null) return "404";
	 * //return "/template/content"; return redirectUrl; }
	 * 
	 * @RequestMapping("/{domain}/{enName}") public String channel(Model model,
	 * 
	 * @PathVariable("domain") String domain,
	 * 
	 * @PathVariable("enName") String enName) { model.addAttribute("basePath",
	 * getWholePath()); CmsChannel cmsChannel =
	 * cmsChannelService.findOneByPortal(domain, enName); if (cmsChannel ==
	 * null) return "404"; return channelUrl(cmsChannel);
	 * 
	 * }
	 * 
	 * @RequestMapping("/{domain}/{enName}/{contentId}") public String
	 * content(Model model, @PathVariable("domain") String domain,
	 * 
	 * @PathVariable("enName") String enName, @PathVariable("contentId") Integer
	 * contentId) { model.addAttribute("basePath", getWholePath()); CmsContent
	 * cmsContent = cmsContentService.findOneByPortal(domain, enName,
	 * contentId); model.addAttribute("cmsContent", cmsContent);
	 * List<CmsAttachment> cmsAttachmentList =
	 * cmsContentService.findCmsAttachmentByCmsContentId(contentId);
	 * model.addAttribute("cmsAttachments", cmsAttachmentList); if (cmsContent
	 * == null) return "404"; //return "/template/content"; return
	 * contentUrl(cmsContent); }
	 */

	/*
	 * @RequestMapping("/{domain}/{enName}.htm") public String
	 * channelRedirect(Model model,CmsChannel cmsChannel,
	 * 
	 * @PathVariable("domain") String domain,@PathVariable("enName") String
	 * enName) { model.addAttribute("basePath", getWholePath()); //CmsChannel
	 * channel = cmsChannelService.findOneByPortal(domain, enName); if
	 * (cmsChannel == null) { return "404"; } model.addAttribute("basePath",
	 * getWholePath()); model.addAttribute("ipAddress", ipAddress);
	 * log.debug("ip地址{}",ipAddress); model.addAttribute("channel", cmsChannel);
	 * return getTemplatePath(cmsChannel.getTemplateId());
	 * 
	 * }
	 * 
	 * @RequestMapping("/{domain}/{enName}/{contentId}.htm") public String
	 * contentRedirect(Model model,CmsContent cmsContent,
	 * 
	 * @PathVariable("domain") String domain,@PathVariable("enName") String
	 * enName) { model.addAttribute("basePath", getWholePath()); //CmsChannel
	 * channel = cmsChannelService.findOneByPortal(domain, enName); if
	 * (cmsContent == null) { return "404"; } model.addAttribute("basePath",
	 * getWholePath()); model.addAttribute("ipAddress", ipAddress);
	 * log.debug("ip地址{}",ipAddress); model.addAttribute("cmsContent",
	 * cmsContent); return getTemplatePath(cmsContent.getTemplateId()); }
	 */
}
