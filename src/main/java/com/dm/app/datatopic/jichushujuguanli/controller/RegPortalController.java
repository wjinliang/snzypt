package com.dm.app.datatopic.jichushujuguanli.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.jichushujuguanli.model.RegCounty;
import com.dm.app.datatopic.jichushujuguanli.model.RegTown;
import com.dm.app.datatopic.jichushujuguanli.model.RegVillage;
import com.dm.app.datatopic.jichushujuguanli.service.BaseInfoService;
import com.dm.app.datatopic.jichushujuguanli.service.NjfuzzJbxxService;
import com.dm.app.datatopic.jichushujuguanli.service.RegCountyService;
import com.dm.app.datatopic.jichushujuguanli.service.RegOuterCountyService;
import com.dm.app.datatopic.jichushujuguanli.service.RegTownService;
import com.dm.app.datatopic.jichushujuguanli.service.RegVillageService;
import com.dm.app.datatopic.jichushujuguanli.service.SnqyJbxxService;
import com.dm.app.datatopic.jichushujuguanli.service.ZydpstZZTryfService;
import com.dm.cms.model.TreeNode;
import com.dm.platform.util.ResponseUtil;
import com.dm.platform.util.SearchConditionUtil;

@Controller
@RequestMapping("portal")
public class RegPortalController {
	
	@Autowired
	private RegCountyService service;
	@Autowired
	private RegOuterCountyService outerCountyService;
	@Autowired
	private RegTownService townService;
	@Autowired
	private RegVillageService villageService;
	@Autowired
	private NjfuzzJbxxService njfuzzJbxxService;
	@Autowired
	private SnqyJbxxService snqyJbxxService;
	@Autowired
	private BaseInfoService baseInfoService;
	@Autowired
	private ZydpstZZTryfService zydpstZZTryfService;
	
	@RequestMapping("datapage")
	public String page(){
		return "app/frontpage";
	}
	
	@RequestMapping("regtree")
	@ResponseBody
	public List<TreeNode> tree(){
		List<TreeNode> tree= new ArrayList<TreeNode>();
		List<RegCounty> countys = this.service.findAll();
		//List<RegOuterCounty> outerCountys = this.outerCountyService.findAll();
		List<RegTown> towns = this.townService.findAll();
		List<RegVillage> villages = this.villageService.findAll();
		int cSize = countys.size();
		//int oSize = outerCountys.size();
		int vSize = villages.size();
		int tSize = towns.size();
		for(int i=0;i<cSize;i++){
			RegCounty r = countys.get(i);
			TreeNode t = new TreeNode();
			t.setId(r.getMc());
			t.setpId(null);
			t.setName(r.getMc());
			t.setI("0");
			tree.add(t);
		}
		/*for(int i=0;i<oSize;i++){
			RegOuterCounty r = outerCountys.get(i);
			TreeNode t = new TreeNode();
			t.setId(r.getMc());
			t.setpId(null);
			t.setI("0");
			t.setName(r.getMc());
			tree.add(t);
		}*/
		for(int i=0;i<vSize;i++){
			RegVillage r = villages.get(i);
			TreeNode t = new TreeNode();
			t.setId(r.getMc());
			t.setpId(r.getSzXz());
			t.setName(r.getMc());
			t.setI("2");
			tree.add(t);
		}
		for(int i=0;i<tSize;i++){
			RegTown r = towns.get(i);
			TreeNode t = new TreeNode();
			t.setId(r.getMc());
			t.setpId(r.getSzQx());
			t.setName(r.getMc());
			t.setI("1");
			tree.add(t);
		}
		
		return tree;
	}
	/**
	 * 农机服务组织【基本信息】(ZH_NJFWZZ_JBXX)
	 */
	@RequestMapping("njffinfo")
	@ResponseBody
	public Object njffinfo(HttpServletRequest request){
		Map searchMap = SearchConditionUtil.packageSearchCondion(request);
		List list = this.njfuzzJbxxService.findAll(searchMap);
		if(list.size()==0){
			return ResponseUtil.error("未找到相关信息");
		}
		return ResponseUtil.success(list);
	}
	/**
	 * 涉农企业【经营情况】(ZH_SNQY_JYQK)
	 */
	@RequestMapping("snqyinfo")
	@ResponseBody
	public Object snqyinfo(HttpServletRequest request){
		Map searchMap = SearchConditionUtil.packageSearchCondion(request);
		List list = this.snqyJbxxService.findAll(searchMap);
		if(list.size()==0){
			return ResponseUtil.error("未找到相关信息");
		}
		return ResponseUtil.success(list);
	}
	/**
	 * 负责人
	 */
	@RequestMapping("fzrinfo")
	@ResponseBody
	public Object fzrinfo(HttpServletRequest request){
		Map searchMap = SearchConditionUtil.packageSearchCondion(request);
		List list = baseInfoService.findAll(searchMap);
		if(list.size()==0){
			return ResponseUtil.error("未找到相关信息");
		}
		return ResponseUtil.success(list);
	}
	/**
	 *区县
	 */
	@RequestMapping("countyinfo")
	@ResponseBody
	public Object countyinfo(HttpServletRequest request){
		Map searchMap = SearchConditionUtil.packageSearchCondion(request);
		searchMap.put("MC", searchMap.get("QX_MC"));
		searchMap.remove("QX_MC");
		List list = this.service.findAll(searchMap);
		if(list.size()==0){
			return ResponseUtil.error("未找到相关信息");
		}
		return ResponseUtil.success(list);
	}
	/**
	 乡镇
	 */
	@RequestMapping("towninfo")
	@ResponseBody
	public Object towninfo(HttpServletRequest request){
		Map searchMap = SearchConditionUtil.packageSearchCondion(request);
		searchMap.put("MC", searchMap.get("XZ_MC"));
		searchMap.remove("XZ_MC");
		List list = this.townService.findAll(searchMap);
		if(list.size()==0){
			return ResponseUtil.error("未找到相关信息");
		}
		return ResponseUtil.success(list);
	}
	/**
	 *行政村
	 */
	@RequestMapping("villageinfo")
	@ResponseBody
	public Object villageinfo(HttpServletRequest request){
		Map searchMap = SearchConditionUtil.packageSearchCondion(request);
		searchMap.put("MC", searchMap.get("XZC_MC"));
		searchMap.remove("XZC_MC");
		List list = this.villageService.findAll(searchMap);
		if(list.size()==0){
			return ResponseUtil.error("未找到相关信息");
		}
		return ResponseUtil.success(list);
	}
	/**
	 *土壤信息
	 *m_ZYDP_ST_ZZ_TRYF
	 */
	@RequestMapping("turanginfo")
	@ResponseBody
	public Object turanginfo(HttpServletRequest request){
		Map searchMap = SearchConditionUtil.packageSearchCondion(request);
		searchMap.put("SZ_XZC", searchMap.get("XZC_MC"));
		searchMap.remove("XZC_MC");
		List list = this.zydpstZZTryfService.findAll(searchMap);
		if(list.size()==0){
			return ResponseUtil.error("未找到相关信息");
		}
		return ResponseUtil.success(list);
	}
}
