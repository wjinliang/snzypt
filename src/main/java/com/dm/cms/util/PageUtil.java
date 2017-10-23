package com.dm.cms.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.dm.cms.model.CmsChannel;

public class PageUtil {
	private static final String HTM =".htm";
	private static final String HTML =".html";
	private static PageUtil instance = new PageUtil();
	private PageUtil(){
	}
	public static PageUtil getInstance(){
		return instance;
	}
	
	
	
	public String channelPagination(CmsChannel channel,int thispage,long totalcount,int pagesize) {
		Boolean isHtml = channel.getIsHtml();
		String url = channel.getUrl();
		Integer totalpage = (int) (totalcount / pagesize);
		if (totalcount % pagesize != 0) {
			totalpage++;
		}
		String extendName = HTM ;
		if(isHtml!=null && isHtml)
		{
			extendName = HTML;
		}
		if(url.indexOf("?")!=-1){
			String param = url.substring(url.indexOf("?"));
			extendName+=param;
		}
		String lastUrl = url.substring(0, url.indexOf(HTM)-1)+totalpage+extendName;
		StringBuffer sb = new StringBuffer();
		sb.append("<div class=\"text-right new-page\"><span class=\"new-page-pd\"><span class=\"color-green\">");
		
		if(totalpage==0){
			sb.append("0/0</span>&nbsp;页</span>,"
		+" <span class=\"new-page-pd\">共&nbsp;<span class=\"color-green\">0</span>&nbsp;条记录</span>");
		}else{
			sb.append((thispage)+"/"+totalpage+"</span>&nbsp;页</span>"
		+"<span class=\"new-page-pd\">共&nbsp;<span class=\"color-green\">"+totalcount+"</span>&nbsp;条记录</span>");
		}
		
		if(thispage==1){
			sb.append("<a href='javascript:;' class='btn btn-link'>首页</a>");
			sb.append("<a href='javascript:;' class='btn btn-link'>上一页</a>");
		}else{
			int newPage = thispage-1;
			String href;
			if(newPage==1){
			 href = url;
			}
			else
			{
				 href = url.substring(0, url.indexOf(extendName)-1);
				 href = href + newPage+extendName;
			}
			sb.append("<a class='btn btn-link' href='"+url+"'>首页</a>");
			sb.append("<a class='btn btn-link' href="+href+">上一页</a>");
		}
		//sb = getChannelPaginationLis(cId,isHtml,htmlDir,sb,thispage,totalpage);
		if((thispage==totalpage)||(totalpage==0)){
			sb.append("<a  href='javascript:;' class='btn btn-link'>下一页</a>");
			sb.append("<a  href='javascript:;' class='btn btn-link'>尾页</a>");
		}else{
			int newPage = thispage+1;
			String href;
			if(newPage==1){
				href = url;
			}else{
				href = url.substring(0, url.indexOf(HTM)-1);
				href = href +newPage+extendName;
			}
			sb.append("<a class='btn btn-link' href="+href+">下一页</a>");
			sb.append("<a class='btn btn-link' href="+lastUrl+">尾页</a>");
		}
		sb.append("</div>");
		return sb.toString();
	}
	
	public String channelMobilePagination(CmsChannel channel,int thispage,long totalcount,int pagesize) {
		Boolean isHtml = channel.getIsHtml();
		String url = channel.getUrl();
		Integer totalpage = (int) (totalcount / pagesize);
		if (totalcount % pagesize != 0) {
			totalpage++;
		}
		String extendName = HTM ;
		if(isHtml!=null && isHtml)
		{
			extendName = HTML;
		}
		if(url.indexOf("?")!=-1){
			String param = url.substring(url.indexOf("?"));
			extendName+=param;
		}
		String lastUrl = url.substring(0, url.indexOf(HTM)-1)+totalpage+extendName;
		StringBuffer sb = new StringBuffer();
		if(thispage==1){
			sb.append("<a href='javascript:;' class='page_disable'>首页</a>");
			sb.append("<a href='javascript:;' class='page_disable'>上一页</a>");
		}else{
			int newPage = thispage-1;
			String href;
			if(newPage==1){
			 href = url;
			}
			else
			{
				 href = url.substring(0, url.indexOf(HTM)-1);
				 href = href + newPage+extendName;
			}
			sb.append("<a  href='"+href+"'>首页</a>");
			sb.append("<a  href="+url+">上一页</a>");
		}
		//sb = getChannelPaginationLis(cId,isHtml,htmlDir,sb,thispage,totalpage);
		if((thispage==totalpage)||(totalpage==0)){
			sb.append("<a  href='javascript:;' class='page_disable'>下一页</a>");
			sb.append("<a  href='javascript:;' class='page_disable'>尾页</a>");
		}else{
			int newPage = thispage+1;
			String href;
			if(newPage==1){
				href = url;
			}else{
				href = url.substring(0, url.indexOf(HTM)-1);
				href = href +newPage+extendName;
			}
			sb.append("<a href="+href+">下一页</a>");
			sb.append("<a href="+lastUrl+">尾页</a>");
		}
		return sb.toString();
	}
	
	/*private List<Map> getSubChannelPaginationList(CmsChannel channel,List<Map> list,int thispage, int totalpage){
		int start;
		int end;
		String url = channel.getUrl();
		if(totalpage<5){
			start = 1;
			end = totalpage;
		}else{
			if(thispage<3){
				start = 1;
				end = 5;
			}else{
				if(thispage<totalpage-2){
					start = thispage-2;
					end = thispage+2;
				}else{
					start = totalpage-4;
					end = totalpage;
				}
			}
		}
		if(start>1){
			Map map = new HashMap();
			map.put("active", "0");
			map.put("disabled", "1");
			map.put("href", "javascript:;");
			map.put("text", "...");
			list.add(map);
		}
		for(int i=start;i<=end;i++){
			String href = "";
			if(i==1){
				href =url;
			}else{
				href = url.substring(0, url.indexOf(extendName)-1);
				href = href +i+extendName;
			}
			if(i==thispage){
				Map map = new HashMap();
				map.put("active", "1");
				map.put("disabled", "0");
				map.put("href", "javascript:;");
				map.put("text", i);
				list.add(map);
			}else{
				Map map = new HashMap();
				map.put("active", "0");
				map.put("disabled", "0");
				map.put("href", href);
				map.put("text", i);
				list.add(map);
			}
		}
		if(end<totalpage){
			Map map = new HashMap();
			map.put("active", "0");
			map.put("disabled", "1");
			map.put("href", "javascript:;");
			map.put("text", "...");
			list.add(map);
		}
		return list;
	} 
	
	
	public List<Map> channelPaginationList(CmsChannel channel,int thispage,long totalcount,int pagesize) {
		String cId = channel.getId().toString();
		boolean isHtml = channel.getIsHtml();
		Integer totalpage = (int) (totalcount / pagesize);
		if (totalcount % pagesize != 0) {
			totalpage++;
		}
		String url = channel.getUrl();
		String lastUrl = url.substring(0, url.indexOf(extendName)-1)+totalpage+extendName;
		List<Map> list = new ArrayList<Map>();
		if(thispage==1){
			Map map = new HashMap();
			map.put("disabled", "1");
			map.put("active", "0");
			map.put("href", "javascript:;");
			map.put("text", "首页");
			list.add(map);
		}else{
			int newPage = thispage-1;
			String href;
			if(newPage==1){
				href = url;
			}else{
				 href = url.substring(0, url.indexOf(extendName)-1);
				 href = href + newPage+extendName;
			}
			Map map = new HashMap();
			map.put("disabled", "0");
			map.put("active", "0");
			map.put("href", url);
			map.put("text", "首页");
			list.add(map);
			
			Map map2 = new HashMap();
			map2.put("disabled", "0");
			map2.put("active", "0");
			map2.put("href", href);
			map2.put("text", "上一页");
			list.add(map2);
			
		}
		list = getSubChannelPaginationList(channel,list,thispage,totalpage);
		if((thispage==totalpage)||(totalpage==0)){
			Map map2 = new HashMap();
			map2.put("disabled", "1");
			map2.put("active", "0");
			map2.put("href", "javascript:;");
			map2.put("text", "尾页");
			list.add(map2);
			
		}else{
			int newPage = thispage+1;
			String href;
			if(newPage==1){
				href = url;
			}else{
				href = url.substring(0, url.indexOf(extendName)-1);
				href = href +newPage+extendName;
			}
			Map map = new HashMap();
			map.put("disabled", "0");
			map.put("active", "0");
			map.put("href", href);
			map.put("text", "下一页");
			list.add(map);
			Map map2 = new HashMap();
			map2.put("active", "0");
			map2.put("disabled", "0");
			map2.put("href", lastUrl);
			map2.put("text", "尾页");
			list.add(map2);
		}
		return list;
	}*/
	private StringBuffer getSubChannelPaginationList(CmsChannel channel,List<Map> list,StringBuffer sb,int thispage, int totalpage){
		int start;
		int end;
		String url = channel.getUrl();
		Boolean isHtml = channel.getIsHtml();
		String extendName = HTM ;
		if(isHtml!=null && isHtml)
		{
			extendName = HTML;
		}
		if(url.indexOf("?")!=-1){
			String param = url.substring(url.indexOf("?"));
			extendName+=param;
		}
		if(totalpage<5){
			start = 1;
			end = totalpage;
		}else{
			if(thispage<3){
				start = 1;
				end = 5;
			}else{
				if(thispage<totalpage-2){
					start = thispage-2;
					end = thispage+2;
				}else{
					start = totalpage-4;
					end = totalpage;
				}
			}
		}
		if(start>1){
			sb.append("<a href='javascript:;'>...</a>");
		}
		for(int i=start;i<=end;i++){
			String href = "";
			if(i==1){
				href =url;
			}else{
				href = url.substring(0, url.indexOf(HTM)-1);
				href = href +i+extendName;
			}
			if(i==thispage){
				sb.append("<a href='"+href+"' class='active new-btn'>"+i+"</a>");
			}else{
				sb.append("<a href='"+href+"' class='new-btn'>"+i+"</a>");
			}
		}
		if(end<totalpage){
			sb.append("<a href='javascript:;class='new-btn'>...</a>");
		}
		return sb;
	} 
	
	
   
	public StringBuffer channelPaginationList(CmsChannel channel,int thispage,long totalcount,int pagesize) {
		Boolean isHtml = channel.getIsHtml();
		Integer totalpage = (int) (totalcount / pagesize);
		String url = channel.getUrl();
		if (totalcount % pagesize != 0) {
			totalpage++;
		}
		String extendName = HTM ;
		if(isHtml!=null && isHtml)
		{
			extendName = HTML;
		}
		if(url.indexOf("?")!=-1){
			String param = url.substring(url.indexOf("?"));
			extendName+=param;
		}
		String lastUrl = url.substring(0, url.indexOf(HTM)-1)+totalpage+extendName;
		
		StringBuffer sb = new StringBuffer();
		sb.append("<div class='new-page pdb10'>");
		sb.append("<span class='new-page-pd'> 页数&nbsp;&nbsp;&nbsp;<span class='border-orange'>"+thispage+"/"+totalpage+"</span></span>");
		sb.append("<span class='new-page-pd'> 总和&nbsp;&nbsp;&nbsp;<span class='border-orange'>"+totalcount+"</span></span>");
		List<Map> list = new ArrayList<Map>();
		if(thispage==1){
			sb.append("<a class='new-btn' href='javascript:;'>&nbsp;</a>");
		}else{
			int newPage = thispage-1;
			String href;
			if(newPage==1){
				href = url;
			}else{
				 href = url.substring(0, url.indexOf(HTM)-1);
				 href = href + newPage+extendName;
			}
			sb.append("<a class='new-btn' href='"+url+"'>&nbsp;</a>");
			
		}
		sb = getSubChannelPaginationList(channel,list,sb,thispage,totalpage);
		if((thispage==totalpage)||(totalpage==0)){
			sb.append("<a class='new-btn' href='javascript:;'>&nbsp;</a>");
		}else{
			int newPage = thispage+1;
			String href;
			if(newPage==1){
				href = url;
			}else{
				href = url.substring(0, url.indexOf(HTM)-1);
				href = href +newPage+extendName;
			}
			sb.append("<a class='new-btn' href='"+lastUrl+"'>&nbsp;</a>");
		}
		sb.append("</div>");
		return sb;
	}
	public StringBuffer channelPaginationList1(CmsChannel channel,int thispage,long totalcount,int pagesize) {
		Boolean isHtml = channel.getIsHtml();
		Integer totalpage = (int) (totalcount / pagesize);
		String url = channel.getUrl();
		if (totalcount % pagesize != 0) {
			totalpage++;
		}
		String extendName = HTM ;
		if(isHtml!=null && isHtml)
		{
			extendName = HTML;
		}
		if(url.indexOf("?")!=-1){
			String param = url.substring(url.indexOf("?"));
			extendName+=param;
		}
		String lastUrl = url.substring(0, url.indexOf(HTM)-1)+totalpage+extendName;
		
		StringBuffer sb = new StringBuffer();
		sb.append("<div id='pagination'>");
		List<Map> list = new ArrayList<Map>();
		if(thispage==1){
			sb.append("<a href='javascript:;' class='page_disable'>首页</a>");
		}else{
			int newPage = thispage-1;
			String href;
			if(newPage==1){
				href = url;
			}else{
				 href = url.substring(0, url.indexOf(HTM)-1);
				 href = href + newPage+extendName;
			}
			sb.append("<a  href='"+href+"'>首页</a>");
			sb.append("<a  href="+href+">上一页</a>");
		}
		sb = getSubChannelPaginationList(channel,list,sb,thispage,totalpage);
		if((thispage==totalpage)||(totalpage==0)){
			sb.append("<a  href='javascript:;' class='page_disable'>尾页</a>");
		}else{
			int newPage = thispage+1;
			String href;
			if(newPage==1){
				href = url;
			}else{
				href = url.substring(0, url.indexOf(HTM)-1);
				href = href +newPage+extendName;
			}
			sb.append("<a  href='"+href+"'>下一页</a>");
			sb.append("<a  href='"+lastUrl+"'>尾页</a>");
		}
		sb.append("</div>");
		return sb;
	}
	
	
}