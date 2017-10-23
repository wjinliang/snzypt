package com.dm.cms.service.impl;

import com.dm.cms.model.CmsAttachment;
import com.dm.cms.service.CmsAttachmentService;
import com.dm.cms.sqldao.CmsAttachmentMapper;
import com.dm.platform.util.FileUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * Created by cgj on 2015/12/3.
 */
@Service
public class CmsAttachmentServiceImpl implements CmsAttachmentService {
    @Autowired CmsAttachmentMapper cmsAttachmentMapper;
    @Value("${projectName}") String projectName;
    @Value("${htmlDir}") String htmlFolder;

    @Override public int insertCmsAttachment(CmsAttachment cmsAttachment) {
       return cmsAttachmentMapper.insertSelective(cmsAttachment);
    }

    @Override public void updateCmsAttachment(CmsAttachment cmsAttachment) {
        cmsAttachmentMapper.updateByPrimaryKeySelective(cmsAttachment);
    }

    @Override public void deleteCmsAttachment(int cmsAttachmentId) {
        cmsAttachmentMapper.deleteByPrimaryKey(cmsAttachmentId);
    }

    @Override public CmsAttachment findOneById(int cmsAttachmentId) {
        return cmsAttachmentMapper.selectByPrimaryKey(cmsAttachmentId);
    }

	@Override
	public void deleteByIdWithLocalFile(Integer id) {
		CmsAttachment c = this.findOneById(id);
		if(c!=null){
			String url = c.getAttachmentUrl();
			String baseDir = System.getProperty("web.root"); 
            String path = baseDir.substring(0, baseDir.indexOf(projectName) - 1)+htmlFolder
                    + url.split(htmlFolder)[1];
            FileUtil.deleteFile(path);
			this.cmsAttachmentMapper.deleteByPrimaryKey(id);
		}
		
	}
    
}
