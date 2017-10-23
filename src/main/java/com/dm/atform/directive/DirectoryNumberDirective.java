package com.dm.atform.directive;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.dm.atform.service.AtTableService;
import com.dm.cms.model.TreeNode;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
 * 分类或表总个数 (type)DataResourceRecordDirective.java
 * @author Mr.Jin
 *
 */
public class DirectoryNumberDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(DirectoryNumberDirective.class);
	@Autowired
	private AtTableService tableService;
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		Object type = params.get("type");
		Object pid = params.get("pId");
		String t = type==null?null: type.toString();
		String pId = pid==null?null:pid.toString();
		Map map = new HashMap();
		map.put("status", "1");
		map.put("type",t);
		map.put("pId",pId);
		Long c=0l;
		if(pId==null){
			 c = tableService.countByArg(map);
		}else{
			c = getCountByPid(map);
		}
		
		env.setVariable("directoryNumber",ObjectWrapper.DEFAULT_WRAPPER.wrap(c));
		body.render(env.getOut());  
	}
	private Long getCountByPid(Map map) {
		List<TreeNode> list = tableService.getTree(map);
		Long c = Long.valueOf(list.size());
		for(TreeNode node:list){
			map.put("pId", node.getId());
			c += getCountByPid(map);
		}
		return c;
	}

}
