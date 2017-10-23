package com.dm.cms.controller;


import com.dm.cms.dto.FileDto;
import com.dm.example.dto.JstreeNode;
import com.dm.platform.util.*;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.*;

/**
 * Created by cgj on 2015/12/8.
 */
//@Controller 
//@RequestMapping("/cms/fileManager") 
public class CmsFileManagerController {
    @Value("${resource.basePath}") String resourceBasePath;
    @Value("${projectName}") String projectName;

    @RequestMapping("/page") public String page(Model model) {
        return "/cms/file_manager/page";
    }

    @RequestMapping("/folder") public @ResponseBody Object folder(
        HttpServletRequest httpServletRequest,
        @RequestParam(value = "rootPath", required = true, defaultValue = "") String rootPath,
        @RequestParam(value = "targetPath", required = true) String targetPath) {
        String wholeRealPath =
            httpServletRequest.getSession().getServletContext().getRealPath(rootPath);
        if (StringUtils.isNotBlank(targetPath)) {
            wholeRealPath += ("/" + targetPath);
        }
        List<FileDto> list = new ArrayList<FileDto>();
        File file = new File(wholeRealPath);
        if (file.isDirectory()) {
            File[] subFiles = file.listFiles();
            if (subFiles.length > 0) {
                for (File subFile : subFiles) {
                    FileDto fileDto = new FileDto();
                    fileDto.setName(subFile.getName());
                    fileDto.setIsDirectory(subFile.isDirectory());
                    fileDto.setPath(subFile.getPath());
                    list.add(fileDto);
                }
            }
        }
        Collections.sort(list);
        return list;
    }

    @RequestMapping(value = "/createFolder", method = RequestMethod.POST) public @ResponseBody
    Object createFolder(HttpServletRequest httpServletRequest,
        @RequestParam(value = "dirPath", required = true) String dirPath) {
        String wholeRealPath =
            httpServletRequest.getSession().getServletContext().getRealPath(dirPath);
        FileTool.mkdir(wholeRealPath);
        return ResponseUtil.success();
    }

    @RequestMapping(value = "/rename", method = RequestMethod.POST) public @ResponseBody
    Object rename(HttpServletRequest httpServletRequest,
        @RequestParam(value = "folderPath", required = true) String folderPath,
        @RequestParam(value = "oldName", required = true) String oldName,
        @RequestParam(value = "newName", required = true) String newName) {
        String wholeRealPath =
            httpServletRequest.getSession().getServletContext().getRealPath(folderPath);
        String type = oldName.substring(oldName.lastIndexOf("."));
        //String ntype= newName.substring(newName.lastIndexOf("."));
        String newName1 = newName.substring(0,newName.lastIndexOf(".")>0?newName.lastIndexOf("."):newName.length());
        String newNametype=newName1+type;
        return FileTool.renameFile(wholeRealPath, oldName, newNametype);
    }

    @RequestMapping(value = "/deleteFolder", method = RequestMethod.POST) public @ResponseBody
    Object deleteFolder(HttpServletRequest httpServletRequest,
        @RequestParam(value = "dirPath", required = true) String dirPath) {
        String wholeRealPath =
            httpServletRequest.getSession().getServletContext().getRealPath(dirPath);
        FileTool.delFolder(wholeRealPath);
        return ResponseUtil.success();
    }

    @RequestMapping(value = "/deleteFile", method = RequestMethod.POST) public @ResponseBody
    Object deleteFile(HttpServletRequest httpServletRequest,
        @RequestParam(value = "filePath", required = true) String filePath) {
        String wholeRealPath =
            httpServletRequest.getSession().getServletContext().getRealPath(filePath);
        FileTool.delFile(wholeRealPath);
        return ResponseUtil.success();
    }

    //@RequestMapping("/download")
    public void downloadFile(HttpServletResponse response, HttpServletRequest httpServletRequest,
        @RequestParam(value = "folderPath", required = true) String folderPath,
        @RequestParam(value = "fileName", required = true) String fileName)
        throws UnsupportedEncodingException {
        response.setCharacterEncoding("utf-8");
        try {
        OutputStream os = response.getOutputStream();
        os.write("下载未开放".getBytes());
        os.flush();
        if(1==1)
        return ;
        response.setContentType("multipart/form-data");
        response.setHeader("Content-Disposition",
            "attachment;fileName=" + new String(fileName.getBytes("gbk"), "iso-8859-1"));
            String wholeRealPath = httpServletRequest.getSession().getServletContext()
                .getRealPath(folderPath + "/" + fileName);
            File file = new File(wholeRealPath);
            InputStream inputStream = new FileInputStream(file);
            //OutputStream os = response.getOutputStream();
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

    @RequestMapping("/upload") public @ResponseBody Object singleUpload(
        @RequestParam(value = "file") MultipartFile multipartFile,
        @RequestParam(value = "folderPath", required = true) String folderPath,
        HttpServletRequest httpServletRequest) throws IOException {
        if (multipartFile == null || multipartFile.isEmpty()) {
            return ResponseUtil.error("请先上传附件");
        }
        String fileType = multipartFile.getOriginalFilename()
                .substring(multipartFile.getOriginalFilename().lastIndexOf(".")+1);
            	String type="gif,jpg,jpeg,png,bmp,css,js,bak"+
                "swf,flv,"+
                "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb,"+
                "flv,mp4,doc,docx,xls,xlsx,ppt,txt,zip,rar,gz,bz2";
            	if(!type.contains(fileType))
            	{
            		return ResponseUtil.error("上传不支持该格式");
            		
            	}
        String wholePath =
            httpServletRequest.getSession().getServletContext().getRealPath(folderPath);
        FileUtil.saveFileFromInputStream(multipartFile.getInputStream(), wholePath,
            multipartFile.getOriginalFilename());
        return ResponseUtil.success();
    }

    @RequestMapping(value = "/zip", method = RequestMethod.POST) public @ResponseBody Object zip(
        HttpServletRequest httpServletRequest,
        @RequestParam(value = "folderPath", required = true) String folderPath,
        @RequestParam(value = "name", required = true) String name,
        @RequestParam(value = "zipName", required = true) String zipName) {
        String wholeRealPath =
            httpServletRequest.getSession().getServletContext().getRealPath(folderPath);
        String[] fileOrFolderNames = name.split(",");
        ZipCompressor zc = new ZipCompressor(wholeRealPath + "/" + zipName + ".zip");
        if (fileOrFolderNames.length == 1) {
            zc.compress(wholeRealPath + "/" + name);
        } else {
            List<String> list = Arrays.asList(fileOrFolderNames);
            List<String> pathList = new ArrayList<>();
            for (String fileOrFolderName : list) {
                fileOrFolderName = wholeRealPath + "/" + fileOrFolderName;
                pathList.add(fileOrFolderName);
            }
            zc.compress(pathList);
        }
        return ResponseUtil.success();
    }

    @RequestMapping(value = "/unCompress", method = RequestMethod.POST) public @ResponseBody
    Object unCompress(HttpServletRequest httpServletRequest,
        @RequestParam(value = "folderPath", required = true) String folderPath,
        @RequestParam(value = "name", required = true) String name) throws Exception {
        String wholeRealPath =
            httpServletRequest.getSession().getServletContext().getRealPath(folderPath);
        if (name.toLowerCase().endsWith(".rar")) {
            CompressFile.unRarFile(wholeRealPath + "/" + name, wholeRealPath);
        } else if (name.toLowerCase().endsWith(".zip")) {
            CompressFile.unZipFiles(wholeRealPath + "/" + name, wholeRealPath);
        } else {
            ResponseUtil.error("文件格式不正确！");
        }
        return ResponseUtil.success();
    }

    @RequestMapping(value = "/jstreeJson", method = RequestMethod.GET) @ResponseBody
    public Object json(HttpServletRequest httpServletRequest,
        @RequestParam(value = "parent", required = false) String parent) {
        String baseDir = "/";
        if (StringUtils.isNotBlank(parent)) {
            parent = parent.equals("#") ? "" : parent;
            baseDir += parent;
        }
        String wholeRealPath =
            httpServletRequest.getSession().getServletContext().getRealPath(baseDir);
        List<JstreeNode> list = new ArrayList<>();
        File file = new File(wholeRealPath);
        if (file.isDirectory()) {
            File[] subFiles = file.listFiles();
            if (subFiles.length > 0) {
                for (File subFile : subFiles) {
                    JstreeNode jstreeNode = new JstreeNode(subFile,parent,projectName);
                    list.add(jstreeNode);
                }
            }
        }
        Collections.sort(list);
        return list;
    }

}
