package com.dm.cms.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.dm.cms.model.CmsAttachmentOther;
import com.dm.cms.service.CmsAttachmentOtherService;
import com.dm.cms.sqldao.CmsAttachmentOtherMapper;
import com.dm.platform.util.FileUtil;


@Service
public class CmsAttachmentOtherServiceImpl implements CmsAttachmentOtherService {
	
	@Autowired CmsAttachmentOtherMapper cmsAttachmentOtherMapper;
	 @Value("${projectName}") String projectName;
	 @Value("${htmlDir}") String htmlFolder;
	
	@Override
    public int insert(CmsAttachmentOther cmsAttachmentOther)
    {
    	return cmsAttachmentOtherMapper.insertSelective(cmsAttachmentOther);
    }

	@Override
	public CmsAttachmentOther findOneById(Integer attachmentId) {
		return cmsAttachmentOtherMapper.selectByPrimaryKey(attachmentId);
	}
	
	@Override
	public void delete(Integer attachmentId) {
		CmsAttachmentOther c = this.findOneById(attachmentId);
		if(c!=null){
			String url = c.getAttachmentUrl();
			String baseDir = System.getProperty("web.root"); 
            String path = baseDir.substring(0, baseDir.indexOf(projectName) - 1)+htmlFolder
                    + url.split(htmlFolder)[1];
            FileUtil.deleteFile(path);
			this.cmsAttachmentOtherMapper.deleteByPrimaryKey(attachmentId);
		}
		
	}

	@Override
	public int update(CmsAttachmentOther attachment) {
		this.cmsAttachmentOtherMapper.updateByPrimaryKeySelective(attachment);
		return 0;
	}
	
}
