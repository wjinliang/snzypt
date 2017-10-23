package com.dm.cms.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.dm.cms.model.CmsMessage;
import com.dm.cms.model.CmsReply;
import com.dm.cms.service.CmsMessageService;
import com.dm.cms.sqldao.CmsMessageMapper;
import com.dm.cms.sqldao.CmsReplyMapper;
import com.dm.platform.util.UUIDUtils;
import com.dm.platform.util.UserAccountUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class CmsMessageServiceImpl implements CmsMessageService{
	@Autowired
	private CmsMessageMapper cmsMessageMapper;
	@Value("${cmsMessageIsNeedCheck}")
	private Boolean cmsMessageIsNeedCheck;
	@Autowired
	private CmsReplyMapper replyMapper;

	@Override
	public PageInfo<CmsMessage> findCmsMessageByPage(Integer pageNum,
			Integer pageSize, CmsMessage cmsMessage) {
		Map map = new HashMap();
		map.put("model", cmsMessage);
		PageHelper.startPage(pageNum, pageSize);
		List<CmsMessage> list = this.cmsMessageMapper.selectByArgMap(map);
		PageInfo<CmsMessage> page =  new PageInfo<CmsMessage>(list);
		return page;
	}

	@Override
	public PageInfo<CmsMessage> findCmsMessageByPageInfo(Integer pageNum,
			Integer pageSize, CmsMessage cmsMessage) {
		Map map = new HashMap();
		map.put("model", cmsMessage);
		PageHelper.startPage(pageNum, pageSize);
		List<CmsMessage> list = this.cmsMessageMapper.selectByArgMap(map);
		PageInfo<CmsMessage> page =  new PageInfo<CmsMessage>(list);
		List<CmsMessage> msgs = page.getList();
		for(CmsMessage m:msgs){
			m.setCmsReplys(replyMapper.selectByMsgId(m.getId()));
		}
		return page;
	}
	@Override
	public void insert(CmsMessage cmsMessage) {
		if(cmsMessageIsNeedCheck){
			cmsMessage.setStatus(CmsMessage.STATUS_NEW);
		}else{
			cmsMessage.setStatus(CmsMessage.STATUS_PUBLISH);
		}
		String id = UUIDUtils.getUUID16();
		cmsMessage.setId(id);
		cmsMessage.setCreateTime(new Date());
		cmsMessage.setIsRead(false);
		cmsMessage.setIsReplied(false);
		this.cmsMessageMapper.insertSelective(cmsMessage);
		
	}

	@Override
	public void delete(String ids) {
		if(ids!=null && !ids.equals("")){
			String[] id = ids.split(",");
			for(String i:id){
				if(!i.equals("")){
					CmsMessage record = new CmsMessage();
					record.setId(i);
					record.setStatus(CmsMessage.STATUS_DELETE);
					this.cmsMessageMapper.updateByPrimaryKeySelective(record);
				}
			}
		}
		
	}

	@Override
	public void updateRead(String id, Boolean isread) {
		CmsMessage record = new CmsMessage();
		record.setId(id);
		record.setIsRead(isread);
		this.cmsMessageMapper.updateByPrimaryKeySelective(record);
		
	}

	@Override
	public void updateStatus(String id, String status ) {
		CmsMessage record = new CmsMessage();
		record.setId(id);
		record.setIsRead(CmsMessage.ISREAD_YES);
		record.setStatus(status);
		this.cmsMessageMapper.updateByPrimaryKeySelective(record);
		
	}

	@Override
	public CmsMessage loadOneInfo(String msgId) {
		CmsMessage message = this.cmsMessageMapper.selectByPrimaryKey(msgId);
		message.setCmsReplys(this.replyMapper.selectByMsgId(msgId));
		message.setIsRead(CmsMessage.ISREAD_YES);
		this.cmsMessageMapper.updateByPrimaryKey(message);
		return message;
	}

	@Override
	public boolean reply(CmsReply cmsReply) {
		CmsMessage msg = this.cmsMessageMapper.selectByPrimaryKey(cmsReply.getMsgId());
		msg.setIsRead(CmsMessage.ISREAD_YES);
		msg.setIsReplied(true);
		this.cmsMessageMapper.updateByPrimaryKey(msg);
		cmsReply.setReplyDatetime(new Date());
		cmsReply.setReplyUserId(UserAccountUtil.getInstance().getCurrentUserId());
		this.replyMapper.insert(cmsReply);
		return true;
	}

	
	
}
