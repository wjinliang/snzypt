package com.dm.cms.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dm.cms.model.CmsTemplate;
import com.dm.cms.model.CmsTemplateConfig;
import com.dm.cms.service.CmsTemplateConfigService;
import com.dm.cms.service.CmsTemplateService;
import com.dm.platform.util.FileUtil;
import com.dm.platform.util.PageConvertUtil;
import com.dm.platform.util.RequestUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SearchConditionUtil;
import com.github.pagehelper.PageInfo;

/**
 * Created by cgj on 2015/11/22.
 */

@Controller
@RequestMapping("/cms/template")
public class CmsTemplateController {
	@Value("${template.basePath}")
	String templateBasePath;
	@Autowired
	CmsTemplateService cmsTemplateService;
	@Autowired
	CmsTemplateConfigService cmsTemplateConfigService;
	

	@RequestMapping("/page")
	public String page(ModelAndView model) {
		return "/cms/template/page";
	}

	@RequestMapping("/list")
	public @ResponseBody
	Object findSites(
			@RequestParam(value = "pageNum", required = false) Integer pageNum,
			@RequestParam(value = "pageSize", required = false) Integer pageSize,
			@RequestParam(value = "template", required = false) CmsTemplate template,
			@RequestParam(value = "sort", required = false) String sort) {
		PageInfo<CmsTemplate> page = cmsTemplateService.findCmsTemplate(
				pageNum, pageSize, template);
		return PageConvertUtil.grid(page);
	}

	@RequestMapping("/load")
	public @ResponseBody
	Object load(
			@RequestParam(value = "templateId", required = true) Integer templateId) {
		CmsTemplate cmsTemplate = cmsTemplateService.findOneById(templateId);
		return cmsTemplate;
	}

	@RequestMapping("/insertOrUpdate")
	public @ResponseBody
	Object insertOrUpdate(CmsTemplate template) {
		if (template.getId() == null) {
			insert(template);
		} else {
			update(template);
		}
		return ResponseUtil.success();
	}

	private void insert(CmsTemplate template) {
		cmsTemplateService.insertCmsTemplate(template);
	}

	private void update(CmsTemplate template) {
		cmsTemplateService.updateCmsTemplate(template);
	}

	@RequestMapping("/delete")
	public @ResponseBody
	Object delete(
			@RequestParam(value = "templateId", required = true) String templateId) {
		if (StringUtils.isNotBlank(templateId)) {
			String[] id = templateId.split(",");
			for (String cmsTemplateId : id) {
				cmsTemplateService.deleteCmsTemplate(Integer
						.valueOf(cmsTemplateId));
			}
		}
		return ResponseUtil.success();
	}

	@RequestMapping(value = "/upload", method = { RequestMethod.POST })
	public @ResponseBody
	Object upload(HttpServletRequest httpServletRequest,
			@RequestParam(value = "file", required = false) MultipartFile file) {
		try {
			try {
				String realFileName = file.getOriginalFilename();
				if (!realFileName.endsWith(".ftl")) {
					return ResponseUtil.error("格式必须是.ftl");
				}
				if (file.getSize() > (26 * 1024 * 2014)) {
					return ResponseUtil.error("附件大小必须小于6M");
				}
				String templateContextPath = httpServletRequest.getSession()
						.getServletContext().getRealPath(templateBasePath);
				String fileName = FileUtil.saveFileFromMultipartFile(file,
						templateContextPath);
				String finalPath = templateBasePath + "/" + fileName;
				Map map = new HashMap();
				map.put("status", 1);
				map.put("path", finalPath);
				return map;
			} catch (Exception e) {
				e.printStackTrace();
				return ResponseUtil.error("异常");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseUtil.error();
		}
	}

	@RequestMapping("/selects")
	public @ResponseBody
	Object selects(HttpServletRequest request) {
		Map<String, Object> searchMap = SearchConditionUtil
				.packageSearchCondion(request);
		List<CmsTemplate> list = cmsTemplateService
				.findCmsTemplateList(searchMap);
		List<Map> selects = new ArrayList<Map>();
		for (CmsTemplate cmsTemplate : list) {
			Map select = new HashMap();
			select.put("value", cmsTemplate.getId());
			select.put("text", cmsTemplate.getTemplateName());
			selects.add(select);
		}
		return selects;
	}

	@RequestMapping("/saveFtl")
	@ResponseBody
	public Object saveFtl(@RequestParam("templateId") Integer id,
			@RequestParam("content") String content) {
		cmsTemplateService.updateFtl(id, content);
		return ResponseUtil.success();
	}

	@RequestMapping("/loadFtl/{templateId}")
	@ResponseBody
	public Object loadFtl(@PathVariable(value = "templateId") Long templateId) {
		Map map = new HashMap();
		try {
			CmsTemplate t = this.cmsTemplateService.findOneById(templateId
					.intValue());
			String filePath = t.getTemplatePath();
			String realPath = RequestUtil.getRealPath(filePath);
			// byte[] templateBlob = FileUtil.getBytesFromPath(realPath);
			File file = new File(realPath);
			StringBuffer sb = new StringBuffer();
			if (file.isFile() && file.exists()) {
				InputStreamReader read = new InputStreamReader(
						new FileInputStream(file), "utf8");
				BufferedReader br = new BufferedReader(read);
				String lineTXT = null;
				while ((lineTXT = br.readLine()) != null) {
					sb.append(lineTXT);
					sb.append("\n ");
				}
				read.close();
			}
			map.put("templateId", templateId);
			map.put("content", sb);
			return map;
		} catch (Exception e) {
			// e.printStackTrace();
			map.put("result", false);
			return map;
		}
	}

	@RequestMapping("/download/{templateId}")
	public void download(HttpServletRequest httpServletRequest,
			HttpServletResponse response,
			@PathVariable(value = "templateId") Long templateId) {
		try {
			CmsTemplate t = this.cmsTemplateService.findOneById(templateId
					.intValue());
			response.setCharacterEncoding("utf-8");
			response.setContentType("multipart/form-data");
			String[] name = t.getTemplatePath().split("/");
			response.setHeader("Content-Disposition", "attachment;fileName="
					+ new String(name[name.length - 1].getBytes("gbk"),
							"iso-8859-1"));

			String filePath = t.getTemplatePath();
			String realPath = RequestUtil.getRealPath(filePath);
			// byte[] templateBlob = FileUtil.getBytesFromPath(realPath);
			File file = new File(realPath);
			InputStream inputStream = new FileInputStream(file);
			OutputStream os = response.getOutputStream();
			byte[] b = new byte[1024];
			int length;
			while ((length = inputStream.read(b)) > 0) {
				os.write(b, 0, length);
			}
			inputStream.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/confpage")
	public String confpage() {
		return "/cms/template/confpage";
	}

	@RequestMapping("loadconf")
	@ResponseBody
	public Object loadConf(@RequestParam(value="siteId",required=false)Integer siteId,
			@RequestParam(value="channelId",required=false)Integer channelId) {
		CmsTemplateConfig config = cmsTemplateConfigService.load(siteId,channelId);
		return config;
	}

	@RequestMapping("set")
	@ResponseBody
	public Object set(CmsTemplateConfig config) {
		if(config.getSiteId()!=null){
			this.cmsTemplateConfigService.insertOrUpdateBySiteId(config);
		}
		if(config.getChannelId()!=null){
			this.cmsTemplateConfigService.insertOrUpdateByChannelId(config);
		}
		return ResponseUtil.success();
	}
}
