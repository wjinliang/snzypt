package com.dm.cms.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.solr.common.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dm.cms.model.CmsAttachmentOther;
import com.dm.cms.model.CmsVideo;
import com.dm.cms.service.CmsAttachmentOtherService;
import com.dm.cms.service.CmsVideoService;
import com.dm.cms.util.ConverVideo;
import com.dm.platform.util.FileUtil;
import com.dm.platform.util.ResponseUtil;

@Controller
@RequestMapping("/cms/attachmentOther")
public class CmsAttachmentOtherController {

	@Value("${resource.basePath}")
	String resourceBasePath;

	@Value("${htmlDir}")
	String htmlFolder;

	@Autowired
	CmsAttachmentOtherService cmsAttachmentOtherService;
	@Autowired
	CmsVideoService cmsVideoService;

	@RequestMapping("/singleUpload")
	public void singleUpload(
			@RequestParam(value = "file") MultipartFile multipartFile,
			String mediaType, HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse) throws IOException {
		httpServletResponse.setContentType("text/html;charset=UTF-8");
		PrintWriter out = httpServletResponse.getWriter();
		if (multipartFile == null || multipartFile.isEmpty()) {
			JSONObject jsonList = JSONObject.fromObject(ResponseUtil
					.error("请先上传附件"));
			out.write(jsonList.toString());
			out.flush();
			out.close();
			return ;
		}
		String fileType = multipartFile.getOriginalFilename()
                .substring(multipartFile.getOriginalFilename().lastIndexOf(".")+1);
            	String type="gif,jpg,jpeg,png,bmp,"+
                "swf,flv,"+
                "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb,"+
                "flv,mp4,doc,docx,xls,xlsx,ppt,txt,zip,rar,gz,bz2";
            	if(!type.contains(fileType))
            	{
            		JSONObject jsonList = JSONObject.fromObject(ResponseUtil.error("上传的文件格式不支持"));
            		out.write(jsonList.toString());
            		out.flush();
                    out.close();
            		return;
            	}
		if (!StringUtils.isEmpty(mediaType)
				&& (mediaType.equals("video") || mediaType.equals("novel") || mediaType
						.equals("audio"))) {
			String baseDir = System.getProperty("web.root");
			String projectName = httpServletRequest.getContextPath();
			String basePath = baseDir.substring(0,
					baseDir.indexOf(projectName.substring(1)) - 1);
			String urlPath = htmlFolder + resourceBasePath + "/" + mediaType
					+ "/images/";
			JSONObject jsonList = singleUploadImpl(multipartFile, basePath,
					urlPath);
			out.write(jsonList.toString());
		}
		out.flush();
		out.close();
	}

	public JSONObject singleUploadImpl(MultipartFile mutipartFile,
			String basePath, String urlPath) throws IOException {
		String newFileName = FileUtil.saveFileFromMultipartFileCreateNewName(
				mutipartFile, basePath + urlPath);
		String url = urlPath + newFileName;
		CmsAttachmentOther cmsAttachment = new CmsAttachmentOther();
		cmsAttachment.setAttachmentName(mutipartFile.getOriginalFilename());
		cmsAttachment.setAttachmentUrl(url);
		cmsAttachment.setFileSize(mutipartFile.getSize());
		cmsAttachment.setIsActive(true);
		cmsAttachmentOtherService.insert(cmsAttachment);
		Map map = ResponseUtil.success("上传成功");
		 Map cmsAttachmentt  = new HashMap();
	        cmsAttachmentt.put("id", cmsAttachment.getId());
	        cmsAttachmentt.put("attachmentName", cmsAttachment.getAttachmentName());
	        cmsAttachmentt.put("attachmentUrl", cmsAttachment.getAttachmentUrl());
	        map.put("attachment", cmsAttachmentt);
		JSONObject jsonList = JSONObject.fromObject(map);
		return jsonList;
	}

	@RequestMapping("/multipleUpload")
	public void MultipleUpload(
			@RequestParam(value = "files[]") MultipartFile[] multipartFiles,
			final String mediaType, HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse) throws IOException {
		httpServletResponse.setContentType("text/html;charset=UTF-8");
		PrintWriter out = httpServletResponse.getWriter();
		if (!StringUtils.isEmpty(mediaType)
				&& (mediaType.equals("video") || mediaType.equals("novel") || mediaType
						.equals("audio"))) {
			if (multipartFiles != null && multipartFiles.length > 0) {
				String baseDir = System.getProperty("web.root");
				String projectName = httpServletRequest.getContextPath();
				final String basePath = baseDir.substring(0,
						baseDir.indexOf(projectName.substring(1)) - 1);
				Map map = this.uploadFiles(multipartFiles, basePath, htmlFolder
						+ resourceBasePath + "/" + mediaType);
				// if(mediaType.equals("video")){//如果是视频转换格式
				// converVideo(map,basePath);
				// }
				out.write(JSONObject.fromObject(map).toString());
				out.flush();
				out.close();
			}
		}
	}

	/**
	 * 转换视频格式为flv
	 * 
	 * @param map
	 * @param basePath
	 */
	private void converVideo(Map map, final String basePath) {
		final String name = map.get("newFileName").toString();
		if (name.endsWith(".flv")) {// 不需要转换
			return;
		}
		final CmsAttachmentOther attachment = (CmsAttachmentOther) map
				.get("attachment");
		new Thread() {
			public void run() {
				String path = basePath + htmlFolder + resourceBasePath
						+ "/video/" + name;
				path = path.replace("/", File.separator);
				if (ConverVideo.getConverVideo(path).beginConver()) {
					String url = attachment.getAttachmentUrl().replace("video",
							"video/flv");
					url = url.substring(0, url.indexOf(".")) + ".flv";
					String name = attachment.getAttachmentName();
					name = name.substring(0, name.indexOf(".")) + ".flv";
					attachment.setAttachmentName(name);
					attachment.setAttachmentUrl(url);
					cmsAttachmentOtherService.update(attachment);
					String videoIds = cmsVideoService
							.selectVideoIdsByAttachmentId(attachment.getId());
					if (videoIds != null && !videoIds.equals("")) {
						for (String id : videoIds.split(",")) {
							CmsVideo cmsVideo = cmsVideoService.findOne(Integer
									.valueOf(id));
							if (cmsVideo != null) {
								cmsVideo.setVideoUrl(url);
								cmsVideoService.updateByPrimaryKey(cmsVideo);
							}
						}
					}
				}
			};
		}.start();

	}

	private Map uploadFiles(MultipartFile[] multipartFiles, String path,
			String urlPath) throws IOException {
		Map map = null;
		for (MultipartFile multipartFile : multipartFiles) {
			String fileType = multipartFile.getOriginalFilename()
	                .substring(multipartFile.getOriginalFilename().lastIndexOf(".")+1);
	            	String type="gif,jpg,jpeg,png,bmp,"+
	                "swf,flv,"+
	                "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb,"+
	                "flv,mp4,doc,docx,xls,xlsx,ppt,txt,zip,rar,gz,bz2";
	            	if(!type.contains(fileType))
	            	{
	            		
	            		map = ResponseUtil.success("上传格式不支持！");
	        			map.put("attachment",new CmsAttachmentOther());
	        			map.put("newFileName", "");
	        			return map;
	            	}
			String newFileName = FileUtil
					.saveFileFromMultipartFileCreateNewName(multipartFile, path
							+ urlPath);
			String url = urlPath + "/" + newFileName;
			CmsAttachmentOther cmsAttachment = new CmsAttachmentOther();
			cmsAttachment
					.setAttachmentName(multipartFile.getOriginalFilename());
			cmsAttachment.setAttachmentUrl(url);
			cmsAttachment.setFileSize(multipartFile.getSize());
			cmsAttachment.setIsActive(true);
			cmsAttachmentOtherService.insert(cmsAttachment);
			map = ResponseUtil.success("上传成功！");
			cmsAttachment.setAttachmentUrl("");
			map.put("attachment", cmsAttachment);
			map.put("newFileName", newFileName);
		}
		return map;
	}

	@RequestMapping("/detail")
	public @ResponseBody Object detail(
			@RequestParam(value = "attachmentId", required = true) Integer attachmentId) {
		CmsAttachmentOther cmsAttachment = cmsAttachmentOtherService
				.findOneById(attachmentId);
		Map result = new HashMap();
		Map data = new HashMap();
		data.put("id", cmsAttachment.getId());
		data.put("name", cmsAttachment.getAttachmentName());
		data.put("size", cmsAttachment.getFileSize());
		data.put("fileUrl", cmsAttachment.getAttachmentUrl());
		result.put("result", data);
		result.put("status", "1");
		return result;
	}

}
