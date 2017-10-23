package com.dm.atform.directive;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.dm.atform.model.AtTable;
import com.dm.atform.service.AtTableService;
import com.dm.cms.model.CmsChannel;
import com.dm.cms.model.submodel.SubCmsChannel;
import com.dm.cms.util.PageUtil;
import com.dm.platform.util.ConfigUtil;
import com.dm.platform.util.SqlParam;
import com.github.pagehelper.PageInfo;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
/**
 * 获取分类 表信息列表
 * @author Mr.Jin
 *
 */
public class AtTableListDirective implements TemplateDirectiveModel{

	private Logger log  = LoggerFactory.getLogger(AtTableListDirective.class);
	@Autowired
	private AtTableService tableService;
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		Object type = params.get("type");
		String sort = params.get("sort")==null?"seq_asc":params.get("sort").toString();
		String t = type==null?null:type.toString();
		String pid = params.get("pId")==null?null:params.get("pId").toString();
		String gridName = params.get("gridName")==null?null:params.get("gridName").toString();
		String projectName = ConfigUtil.getConfigContent("cms","projectName");
		String url = "/"+projectName+"/portal/data/grid/"+pid+"_1.htm";
		AtTable record = new AtTable();
		String tableId = pid;
		record.setType(t);
		record.setStatus("1");
		if(StringUtils.hasText(gridName)){
			record.setpId(null);
			tableId=null;
			url+="?param="+gridName;
		}
		record.setGridName(gridName);
		Integer pageNum = params.get("pageNum")==null?1:Integer.valueOf(params.get("pageNum").toString());
		Integer pageSize = params.get("pageSize")==null?1000:Integer.valueOf(params.get("pageSize").toString());
		Map map =new SqlParam().autoParam(record, sort,pageNum,pageSize);
		PageInfo<AtTable> page = this.tableService.findByArg(map,tableId);
 
		List<AtTable> list = page.getList();
		env.setVariable("tables",ObjectWrapper.DEFAULT_WRAPPER.wrap(list));
		env.setVariable("tablesStr",ObjectWrapper.DEFAULT_WRAPPER.wrap(JSONArray.fromObject(list).toString()));
		CmsChannel channel = new SubCmsChannel();
		channel.setIsHtml(false);
//		return "/"+projectName+"/portal/channel/"+enName+"/"+id+"_"+1+".htm";
		channel.setUrl(url);
		Long total = page.getTotal();
		env.setVariable("pagination", ObjectWrapper.DEFAULT_WRAPPER
				.wrap(PageUtil.getInstance().channelPagination(channel,
						pageNum, total, pageSize)));
		env.setVariable("paginationMobile", ObjectWrapper.DEFAULT_WRAPPER
				.wrap(PageUtil.getInstance().channelMobilePagination(channel, pageNum, total, pageSize)));
		env.setVariable("paginationlist",
		        ObjectWrapper.DEFAULT_WRAPPER.wrap(PageUtil.getInstance().channelPaginationList(channel,pageNum,total,pageSize)));
	
		body.render(env.getOut());  
	}

}
