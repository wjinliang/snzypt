package com.dm.search.service.impl;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.apache.commons.collections.ListUtils;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrQuery.ORDER;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.dm.platform.util.ConfigUtil;
import com.dm.platform.util.ResponseUtil;
import com.dm.search.model.SearchConfig;
import com.dm.search.model.SearchResult;
import com.dm.search.service.SearchConfigService;
import com.dm.search.sqldao.SearchConfigMapper;

@Service
public class SearchConfigServiceImpl implements SearchConfigService {

	private Logger log = LoggerFactory.getLogger(SearchConfigServiceImpl.class);

	@Autowired
	SearchConfigMapper searchConfigMapper;

	@Override
	public SearchConfig findConfig(String id) {
		return searchConfigMapper.selectByPrimaryKey(id);
	}

	public String formatDateToNow(Integer days) throws ParseException {
		SimpleDateFormat time0 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat time1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat time2 = new SimpleDateFormat("HH:mm:ss");
		// return
		// date.getYear()+"-"+date.getMonth()+"-"+date.getDay()+"T"+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();

		Calendar c = Calendar.getInstance();
		c.setTime(time0.parse(time1.format(c.getTime()) + " 23:59:59"));
		Date date = c.getTime();
		String dateNow = time1.format(date) + "T" + time2.format(date) + "Z";
		c.setTime(time0.parse(time1.format(c.getTime()) + " 23:59:59"));
		c.add(Calendar.DATE, -days);
		date = c.getTime();
		return "[" + time1.format(date) + "T" + time2.format(date) + "Z"
				+ " TO " + dateNow + "]";
	}

	/*
	 * @Override public Map searchResults(String textValue, Integer pageNum,
	 * Integer pageSize, String sortField, String titleValue, String
	 * contentValue, String entity) { SearchConfig searchConfig =
	 * searchConfigMapper .selectByPrimaryKey("123"); List<CmsContent>
	 * CmsContents = new ArrayList<CmsContent>(); SolrClient solrClient = new
	 * HttpSolrClient(searchConfig.getIpAddress() + "/solr/cms_core"); Map map =
	 * new HashMap(); if (!connectSolr(solrClient)) { map.put("status", "1");
	 * return map; } SolrQuery query = new SolrQuery(); query.setQuery("text:" +
	 * textValue); String[] field = { "id", "content", "title", "origin",
	 * "publishDate", "displayName", "url" }; if
	 * (!StringUtils.isEmpty(titleValue)) { query.addFilterQuery("title:" +
	 * textValue); } if (!StringUtils.isEmpty(contentValue)) {
	 * query.addFilterQuery("content:" + textValue); } //
	 * query.addFilterQuery("cat:electronics","store:amazon.com");
	 * query.setFields(field); query.setStart(pageNum); if
	 * (!StringUtils.isEmpty(sortField)) { query.setSort(sortField, ORDER.desc);
	 * } else { // query.setSort("publishDate", ORDER.desc); } try {
	 * query.addFacetField("publishDate",formatDateToNow(1)); } catch
	 * (ParseException e1) { // TODO Auto-generated catch block
	 * e1.printStackTrace(); } query.setRows(pageSize);
	 * query.setHighlight(searchConfig.getHighlight() == null ? false :
	 * searchConfig.getHighlight()); query.addHighlightField("title");
	 * query.addHighlightField("content");
	 * 
	 * query.setHighlightSimplePre("<font color='" +
	 * searchConfig.getHighlightcolor() + "'>");
	 * query.setHighlightSimplePost("</font>");
	 * 
	 * query.setHighlightSnippets(searchConfig.getSnippets());// 结果分片数，默认为1
	 * query.setHighlightFragsize(searchConfig.getSnippetsNum()); //
	 * query.set("defType", "edismax");
	 * 
	 * QueryResponse response = null; try {
	 * 
	 * response = solrClient.query(query); } catch (SolrServerException e) { //
	 * TODO Auto-generated catch block log.debug(e.getMessage()); } catch
	 * (IOException e) { // TODO Auto-generated catch block e.printStackTrace();
	 * } SolrDocumentList results = response.getResults();
	 * 
	 * List<CmsContent> items = new ArrayList<CmsContent>(); Map<String,
	 * Map<String, List<String>>> highlightMap = response .getHighlighting();
	 * 
	 * for (SolrDocument solrDocument : results) { CmsContent content = new
	 * CmsContent(); String id = solrDocument.getFieldValue("id").toString(); //
	 * content.setId(Integer.valueOf(id)); try { String datestr =
	 * solrDocument.getFieldValue("publishDate") .toString(); SimpleDateFormat
	 * sdf = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");
	 * sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
	 * content.setPublishDate(sdf.parse(datestr)); //
	 * content.setPublishDate(convert
	 * (((Date)solrDocument.getFieldValue("publishDate")))); } catch
	 * (ParseException e) { // TODO Auto-generated catch block
	 * log.error(e.getMessage()); } String idOrAttachmentId =
	 * solrDocument.getFieldValue("id") .toString();
	 * content.setId(Integer.valueOf(idOrAttachmentId.split("_")[0])); //
	 * content
	 * .setId(Integer.valueOf(solrDocument.getFieldValue("id").toString()));
	 * content.setTitle(solrDocument.getFieldValue("title").toString());
	 * content.setUrl(solrDocument.getFieldValue("url").toString());
	 * List<String> contents = highlightMap.get(id).get("content"); List<String>
	 * titles = highlightMap.get(id).get("title"); if (contents != null &&
	 * contents.size() > 0) { content.setContentText(""); for (int i = 0; i <
	 * contents.size(); i++) { if (searchConfig.getSnippets() < i) { break; }
	 * content.setContentText(content.getContentText() + contents.get(i) +
	 * "……");
	 * 
	 * } } else { content.setContentText(solrDocument.getFieldValue("content")
	 * .toString()); } if (titles != null && titles.size() > 0) {
	 * content.setTitle(""); for (int i = 0; i < titles.size(); i++) { if
	 * (searchConfig.getSnippets() < i) { break; } if (titles != null &&
	 * titles.size() > 0) { content.setTitle(content.getTitle() + titles.get(i)
	 * + "……"); } else { content.setTitle(solrDocument.getFieldValue("title")
	 * .toString()); } } } else {
	 * content.setTitle(solrDocument.getFieldValue("title").toString()); }
	 * items.add(content); }
	 * 
	 * long total = response.getResults().getNumFound(); map.put("status", "0");
	 * map.put("contents", items); map.put("total", total); return map; }
	 */

	public boolean connectSolr(SolrClient solrClient) {

		try {
			solrClient.ping();
		} catch (SolrServerException e) {
			// TODO Auto-generated catch block
			log.debug(e.getMessage());
			return false;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			log.debug(e.getMessage());
			return false;
		}
		return true;
	}

	@Override
	public boolean insertOrUpdate(SearchConfig searchConfig) {
		if (searchConfig.getId() != null && !searchConfig.getId().equals("")) {
			searchConfigMapper.updateByPrimaryKey(searchConfig);
		} else {
			searchConfigMapper.insertSelective(searchConfig);
		}
		return true;
		// TODO Auto-generated method stub
	}

	public Date convert(Date date) throws ParseException

	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
		String dateStr = sdf.format(date);
		return sdf.parse(dateStr);
	}
	
	/*public static void main(String[] args) {
		new SearchConfigServiceImpl().searchResults("金湖", "content,title", 1, 10, null, null, null, null);
	}*/
	@Override
	public Map searchResults(String textValue,String colum, Integer pageNum,
			Integer pageSize, String sortField, String entity, Integer days,
			Device device) {
		return this.searchResults(textValue, colum, pageNum, pageSize, sortField, entity, days,null, device);
	}
	@Override
	public Map searchResults(String textValue,String colum, Integer pageNum,
			Integer pageSize, String sortField, String entity, Integer days,String highlight,
			Device device) {
		/*if (!StringUtils.hasText(entity)) {
			entity = "cmsContent";
		}*/
		/*if (entity.length() < 3)
			entity = "cmsContent";*/
		SearchConfig searchConfig = searchConfigMapper
			.selectByPrimaryKey("123");
		/*SearchConfig searchConfig =new SearchConfig();
		searchConfig.setIpAddress("http://10.2.30.17:8080");
		searchConfig.setSnippets(1);
		searchConfig.setSnippetsNum(5);*/
		SolrClient solrClient = new HttpSolrClient(searchConfig.getIpAddress()
				+ "/solr/cms_core");
		if (!connectSolr(solrClient)) {
			Map map = ResponseUtil.error();
			map.put("list", ListUtils.EMPTY_LIST);
			map.put("totalPage", 1);
			map.put("pageNum", 1);
			map.put("perPage", 1);
			map.put("nextPage", 1);
			map.put("total", 0);
			map.put("status",0);
			map.put("textValue", textValue);
			return map;
		}
		String highlightTitle = "title";
		String highlightContent = "content";
		String highlightActor = "origin";
		/*if (entity.equals("cmsContent")) {
			highlightTitle = "title";
			highlightContent = "content";
			highlightActor = "origin";
		}
		if (entity.equals("cmsAudio")) {
			highlightActor = "singer";
		}
		if (entity.equals("cmsVideo")) {
			highlightActor = "director";
		}*/
		SolrQuery query = new SolrQuery();
		String[] field = { "id", highlightTitle, highlightContent,
				highlightActor, "publishDate", "displayName", "url",
				"image_url" };
		query.setFields(field);
		String ent = "*";
		if(entity!=null&&!entity.equals(""))
			ent = entity;
		if (days != null){
			query.addFilterQuery("id:" + "*_" + ent
					+ " AND publishDate:[NOW/DAY-" + days + "DAY TO *]");
		}else{
			query.addFilterQuery("id:" + "*_" + ent);
		}
		String queryString =escapeQueryChars(textValue);
		String q = "text:" + queryString;
		if(colum==null || colum.equals("")){
			q = "content:" + queryString+" OR title:"+queryString;
		}else{
			String[] list = colum.split(",");
			q = "";
			int i = 0;
			for(String qt:list){
				if(i>0){
					q+=" OR ";
				}
				q += qt+":" + queryString;
				i++;
			}
		}
		query.setQuery(q);
		
		query.setStart((pageNum - 1) * pageSize);
		/*if (sortField != null) {
			String[] order = sortField.split("_");
			if (order.length == 2) {
				if (order[1].equals("asc")) {
					query.setSort(order[0], ORDER.asc);
				} else {
					query.setSort(order[0], ORDER.desc);
				}
			}
		}*/
		query.setSort("publishDate", ORDER.desc);
		query.setRows(pageSize);
		String color = searchConfig.getHighlightcolor();
		if(highlight!=null){
			color = highlight;
		}
			query.setHighlight(searchConfig.getHighlight() == null ? false
					: searchConfig.getHighlight());
			if (!query.getHighlight()) {
				// return ;
			}
			query.addHighlightField(highlightTitle);
			query.addHighlightField(highlightContent);
			query.addHighlightField(highlightActor);
			
			query.setHighlightSimplePre("<font color='"
					+ color + "'>");
			query.setHighlightSimplePost("</font>");
			
			query.setHighlightSnippets(searchConfig.getSnippets());// 结果分片数，默认为1
			query.setHighlightFragsize(searchConfig.getSnippetsNum());
		

		// query.set("defType", "edismax");

		QueryResponse response = null;
		try {

			response = solrClient.query(query);
		} catch (SolrServerException e) {
			// TODO Auto-generated catch block
			log.debug(e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SolrDocumentList results = response.getResults();

		List<SearchResult> list = new ArrayList<SearchResult>();
		Map<String, Map<String, List<String>>> highlightMap = response
				.getHighlighting();

		for (SolrDocument solrDocument : results) {
			SearchResult searchResult = new SearchResult();
			String idOrAttachmentId = solrDocument.getFieldValue("id")
					.toString();
			searchResult.setId(Integer.valueOf(idOrAttachmentId.split("_")[0]));
			searchResult.setChannel((String) solrDocument
					.getFieldValue("displayName"));
			Date datestr = (Date) solrDocument.getFieldValue("publishDate");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
			searchResult.setPublishDate(sdf.format(datestr));
			searchResult.setTitle((String) solrDocument
					.getFieldValue(highlightTitle));
			searchResult.setUrl(solrDocument.getFieldValue("url").toString());
			List<String> contents = highlightMap.get(idOrAttachmentId).get(
					highlightContent);
			List<String> titles = highlightMap.get(idOrAttachmentId).get(
					highlightTitle);
			List<String> actors = highlightMap.get(idOrAttachmentId).get(
					highlightActor);
			searchResult.setContent(formatValue(contents, searchConfig,
					solrDocument, highlightContent));
			searchResult.setTitle(formatValue(titles, searchConfig,
					solrDocument, highlightTitle));
			searchResult.setActor(formatValue(actors, searchConfig,
					solrDocument, highlightActor));
			list.add(searchResult);
		}
		long num = results.getNumFound();
		Map map = ResponseUtil.success();
		long totalPage = num / pageSize;
		if (totalPage == 0) {
			totalPage = 1;
		} else if ((num % pageSize) > 0) {
			totalPage += 1;
		}
		if (device != null) {
			if (device.isMobile()) {
				String PCFolder = ConfigUtil.getConfigContent("cms", "htmlDir");
				String mobileFolder = ConfigUtil.getConfigContent("cms",
						"htmlMobileDir");
				for (SearchResult s : list) {
					s.setUrl(s.getUrl().replace(PCFolder,
							PCFolder + mobileFolder));
				}
			}
		}
		/*for(SearchResult s: list){
		System.out.println("content===="+s.getContent());
		System.out.println("title===="+s.getTitle());
		}*/
		long perPage=1l;
		if(pageNum-1>1){
			perPage = pageNum-1;
		}
		long nextPage=1l;
		if(pageNum+1 <= totalPage){
			nextPage = pageNum+1;
		}
		map.put("totalPage", totalPage);
		map.put("pageNum", pageNum);
		map.put("perPage", perPage);
		map.put("nextPage", nextPage);
		map.put("total", num);
		map.put("status",1);
		map.put("list", list);
		map.put("textValue", textValue);
		log.debug("{}--list", list);
		
		return map;
	}
	public static String escapeQueryChars(String s) {  
	    StringBuilder sb = new StringBuilder();  
	    for (int i = 0; i < s.length(); i++) {  
	      char c = s.charAt(i);  
	      // These characters are part of the query syntax and must be escaped  
	      if (c == '\\' || c == '+' || c == '-' || c == '!'  || c == '(' || c == ')' || c == ':'  
	        || c == '^' || c == '[' || c == ']' || c == '\"' || c == '{' || c == '}' || c == '~'  
	        || c == '*' || c == '?' || c == '|' || c == '&'  || c == ';' || c == '/'  
	        || Character.isWhitespace(c)) {  
	        sb.append('\\');  
	      }  
	      sb.append(c);  
	    }  
	    return sb.toString();  
	  } 
	/*@Override
	public Map searchResults(String textValue, Integer pageNum,
			Integer pageSize, String sortField, String entity, Integer days,
			Device device) {
		if (!StringUtils.hasText(entity)) {
			entity = "cmsContent";
		}
		if (entity.length() < 3)
			entity = "cmsContent";
		SearchConfig searchConfig = searchConfigMapper
				.selectByPrimaryKey("123");
		SolrClient solrClient = new HttpSolrClient(searchConfig.getIpAddress()
				+ "/solr/cms_core");
		if (!connectSolr(solrClient)) {
			Map map = ResponseUtil.error();
			map.put("list", ListUtils.EMPTY_LIST);
			map.put("totalPage", 1);
			map.put("pageNum", 1);
			map.put("total", 0);
			return map;
		}
		String highlightTitle = "name";
		String highlightContent = "introduce";
		String highlightActor = "author";
		if (entity.equals("cmsContent")) {
			highlightTitle = "title";
			highlightContent = "content";
			highlightActor = "origin";
		}
		if (entity.equals("cmsAudio")) {
			highlightActor = "singer";
		}
		if (entity.equals("cmsVideo")) {
			highlightActor = "director";
		}
		SolrQuery query = new SolrQuery();
		String[] field = { "id", highlightTitle, highlightContent,
				highlightActor, "publishDate", "displayName", "url",
				"image_url" };
		query.setFields(field);
		String ent = entity.toLowerCase().substring(3);
		if (days != null)
			query.addFilterQuery("id:" + "*_" + ent
					+ " AND publishDate:[NOW/DAY-" + days + "DAY TO *]");
		else
			query.addFilterQuery("id:" + "*_" + ent);
		query.setQuery("text:" + textValue);
		query.setStart((pageNum - 1) * pageSize);
		if (sortField != null) {
			String[] order = sortField.split("_");
			if (order.length == 2) {
				if (order[1].equals("asc")) {
					query.setSort(order[0], ORDER.asc);
				} else {
					query.setSort(order[0], ORDER.desc);
				}
			}
		}
		query.setRows(pageSize);
		query.setHighlight(searchConfig.getHighlight() == null ? false
				: searchConfig.getHighlight());
		if (!query.getHighlight()) {
			// return ;
		}

		query.addHighlightField(highlightTitle);
		query.addHighlightField(highlightContent);
		query.addHighlightField(highlightActor);

		query.setHighlightSimplePre("<font color='"
				+ searchConfig.getHighlightcolor() + "'>");
		query.setHighlightSimplePost("</font>");

		query.setHighlightSnippets(searchConfig.getSnippets());// 结果分片数，默认为1
		query.setHighlightFragsize(searchConfig.getSnippetsNum());
		// query.set("defType", "edismax");

		QueryResponse response = null;
		try {

			response = solrClient.query(query);
		} catch (SolrServerException e) {
			// TODO Auto-generated catch block
			log.debug(e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SolrDocumentList results = response.getResults();

		List<SearchResult> list = new ArrayList<SearchResult>();
		Map<String, Map<String, List<String>>> highlightMap = response
				.getHighlighting();

		for (SolrDocument solrDocument : results) {
			SearchResult searchResult = new SearchResult();
			String idOrAttachmentId = solrDocument.getFieldValue("id")
					.toString();
			searchResult.setId(Integer.valueOf(idOrAttachmentId.split("_")[0]));
			searchResult.setChannel((String) solrDocument
					.getFieldValue("displayName"));
			Date datestr = (Date) solrDocument.getFieldValue("publishDate");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
			searchResult.setPublishDate(sdf.format(datestr));
			searchResult.setTitle((String) solrDocument
					.getFieldValue(highlightTitle));
			searchResult.setUrl(solrDocument.getFieldValue("url").toString());
			List<String> contents = highlightMap.get(idOrAttachmentId).get(
					highlightContent);
			List<String> titles = highlightMap.get(idOrAttachmentId).get(
					highlightTitle);
			List<String> actors = highlightMap.get(idOrAttachmentId).get(
					highlightActor);
			searchResult.setContent(formatValue(contents, searchConfig,
					solrDocument, highlightContent));
			searchResult.setTitle(formatValue(titles, searchConfig,
					solrDocument, highlightTitle));
			searchResult.setActor(formatValue(actors, searchConfig,
					solrDocument, highlightActor));
			list.add(searchResult);
		}
		long num = results.getNumFound();
		Map map = ResponseUtil.success();
		long totalPage = num / pageSize;
		if (totalPage == 0) {
			totalPage = 1;
		} else if ((num % pageSize) > 0) {
			totalPage += 1;
		}
		if (device != null) {
			if (device.isMobile()) {
				String PCFolder = ConfigUtil.getConfigContent("cms", "htmlDir");
				String mobileFolder = ConfigUtil.getConfigContent("cms",
						"htmlMobileDir");
				for (SearchResult s : list) {
					s.setUrl(s.getUrl().replace(PCFolder,
							PCFolder + mobileFolder));
				}
			}
		}
		map.put("totalPage", totalPage);
		map.put("pageNum", pageNum);
		map.put("total", num);
		map.put("list", list);
		log.debug("{}--list", list);
		return map;
	}*/

	private String formatValue(List<String> contents,
			SearchConfig searchConfig, SolrDocument solrDocument, String key) {
		String content = "";
		if (contents != null && contents.size() > 0) {

			for (int i = 0; i < contents.size(); i++) {
				if (searchConfig.getSnippets() < i) {
					break;
				}
				content = contents.get(i);
				if (((String) solrDocument.getFieldValue(key)).length() > 20)
					content += "……";
			}
		} else {
			content = (String) solrDocument.getFieldValue(key);
		}
		return content;
	}

}
