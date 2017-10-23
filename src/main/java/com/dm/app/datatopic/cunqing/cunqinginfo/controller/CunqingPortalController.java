package com.dm.app.datatopic.cunqing.cunqinginfo.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.plexus.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dm.app.datatopic.cunqing.baseinfo.service.RegVillageInfoService;
import com.dm.app.datatopic.cunqing.constants.ModelPath;
import com.dm.app.datatopic.cunqing.cunqinginfo.model.TbBaseInfo;
import com.dm.app.datatopic.cunqing.cunqinginfo.service.CunqingService;
import com.dm.app.datatopic.cunqing.cunqinginfo.service.TbBaseInfoService;
import com.dm.app.datatopic.cunqing.cunqinginfo.service.impl.CunqingServiceImpl;
import com.dm.app.datatopic.jichushujuguanli.service.RegCountyService;
import com.dm.app.datatopic.model.RegVillage;
import com.dm.app.datatopic.model.ZzZwsc;
import com.dm.app.datatopic.model.ecahrt.KeyValue;
import com.dm.app.util.judge.ObjectUtils;
import com.dm.app.util.judge.SortUtil;
import com.dm.app.util.judge.StringUtils;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;
import com.dm.platform.util.ResponseUtil;
/**
 * @description  村情前台
 * @author huoge
 */
@Controller
@RequestMapping("portal")
public class CunqingPortalController {

	@Autowired
	CunqingServiceImpl cimp;
	@Autowired
	RegCountyService rimp;
	@Autowired
	private CmsSiteService siteService;
	@Value("${topic.villageinfo.crop.year}") 
	String topicVillageinfoCropYear;
	@Autowired
	private CunqingService cunqingService;
	@Autowired
	private TbBaseInfoService tbBaseInfoService;
	@Autowired
	private RegVillageInfoService regVillageInfoService;
	private final String ITEM_INFOLIST_PAGE="app/datatopic/cunqingtopic/iteminfolist";
	private final String VILLAGELIST_PAGE="app/datatopic/cunqingtopic/villagelist";
	private final String CUNQINGINFO_PAGE="template/sn_cunqing";
	/*	private final String CUNQINGINFO_PAGE="app/datatopic/cunqingtopic/cunqinginfo";
	 */	/*
	private final String ITEM_INFOLIST_PAGE="template/sn_iteminfolist";
	private final String VILLAGELIST_PAGE="template/sn_villagelist";*/
	@RequestMapping("cqpage") 
	public String page(){
		List<Map> list = rimp.getCunTongji(); 
		for(Map m:list){
			System.out.println("{");
			for(Iterator<String> i = m.keySet().iterator();i.hasNext();){
				String key = i.next();
				System.out.println(key+":"+m.get(key));
			}
			System.out.println("},");
		}
		return "app/cqpage";
	}

	/**
	 * @description 查询该行政村中各个项目的数量
	 * @author huoge
	 * @date 2017年2月16日
	 * @return
	 */
	@RequestMapping("ajax/findItemCountInVillage")
	@ResponseBody
	public Object findItemCountInVillage(HttpServletRequest request){
		String villageCode=request.getParameter("villageCode"); //获取该村唯一编码
		String tipItem=request.getParameter("tipItem"); //获取要查询的项目类标志。
		villageCode=new String(Base64.decodeBase64(villageCode.getBytes()));//获得解密后的
		tipItem=new String(Base64.decodeBase64(tipItem.getBytes()));//获得解密后的
		if(StringUtils.isEmpty(villageCode)){
			return ResponseUtil.error("请选择要查询的乡村！");
		}
		long count=0;
		String[] items = tipItem.split(",");
		for(String item:items){
			Class clazzname=null;
			try {
				clazzname = Class.forName("com.dm.app.datatopic.model."+item);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				return ResponseUtil.error(e.getMessage());
			}
			count += cunqingService.findItemCountInVillage(villageCode,clazzname);
		}
		KeyValue kv=new KeyValue();
		kv.setKey(tipItem);
		kv.setValue(count);
		return ResponseUtil.success(kv);
	}

	/**
	 * @description 查询该行政村中各个项目中的列表详情（ajax请求）
	 * @author huoge
	 * @date 2017年2月16日
	 * @return
	 */
	@RequestMapping("ajax/findItemInfoInVillage")
	@ResponseBody
	public Object findItemInfoInVillage(HttpServletRequest request){
		String villageCode=request.getParameter("villageCode"); //获取该村唯一编码
		String tipItem=request.getParameter("tipItem"); //获取要查询的项目class类标志字符串。
		villageCode=new String(Base64.decodeBase64(villageCode.getBytes()));//获得解密后的
		tipItem=new String(Base64.decodeBase64(tipItem.getBytes()));//获得解密后的
		if(StringUtils.isEmpty(villageCode)){
			return ResponseUtil.error("请选择要查询的乡村！");
		}

		List result=new ArrayList<>();
		String[] items = tipItem.split(",");
		for(String item:items){
			Class clazzname=null;
			try {
				clazzname = Class.forName(ModelPath.PATH_PREFIX+item); //根据该类的全限定名获取该类实例
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				return ResponseUtil.error(e.toString());
			}
			result = cunqingService.findItemInfoInVillage(villageCode,clazzname);
		}
		if(ObjectUtils.isNotNull(result)){
			return ResponseUtil.success(result);
		}
		return ResponseUtil.error("出现异常,未查询到结果");
	}
	/**
	 * @description 查询该行政村中各个项目中的列表详情(直接请求)
	 * @author huoge
	 * @date 2017年2月21日
	 * @param request
	 * @return
	 */
	@RequestMapping("view/findItemInfoInVillage")
	public ModelAndView findItemInfoInVillageview(HttpServletRequest request){
		ModelAndView model = new ModelAndView(); 
		String villageCode=request.getParameter("villageCode"); //获取该村唯一编码
		String tipItem=request.getParameter("tipItem"); //获取要查询的项目class类标志字符串。
		villageCode=new String(Base64.decodeBase64(villageCode.getBytes()));//获得解密后的
		tipItem=new String(Base64.decodeBase64(tipItem.getBytes()));//获得解密后的
		List result=new ArrayList<>();
		if(tipItem.equals("KjsfhJbxx")){
			result=cunqingService.findKjsfhInfo(villageCode);
			model.addObject("items"+tipItem+"infolist", result);
		}else if(tipItem.equals("NfscJbxx")){
			result=cunqingService.findNfscInfo(villageCode);
			model.addObject("items"+tipItem+"infolist", result);
		}else{
			String[] items = tipItem.split(",");
			for(String item:items){
				Class clazzname=null;
				try {
					clazzname = Class.forName(ModelPath.PATH_PREFIX+item); //根据该类的全限定名获取该类实例
					System.out.println(clazzname);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				List results = cunqingService.findItemInfoInVillage(villageCode,clazzname);
				model.addObject("items"+item+"infolist", results);
			}
		}
		model.setViewName(ITEM_INFOLIST_PAGE);
		return model;
	}

	/**
	 * @description 通过名字模糊查询符合条件的村子列表(ajax请求)
	 * @author huoge
	 * @date 2017年2月16日
	 * @return
	 */
	@RequestMapping("ajax/findVillageByName")
	@ResponseBody
	public Object findVillageByName(HttpServletRequest request){
		String villageName=request.getParameter("villageName"); //获取该村名称
		if(StringUtils.isEmpty(villageName)){
			return ResponseUtil.error("请选择要查询的乡村！");
		}
		List result=new ArrayList<>();
		result = cunqingService.findVillageByName(villageName);
		if(ObjectUtils.isNotNull(result)){
			return ResponseUtil.success(result);
		}
		return ResponseUtil.error("出现异常,未查询到结果");
	}
	/**
	 * @description 通过名字模糊查询符合条件的村子列表(直接请求)
	 * @author huoge
	 * @date 2017年2月16日
	 * @return
	 */
	@RequestMapping("view/findVillageByName")
	@ResponseBody
	public ModelAndView findVillageByNameview(HttpServletRequest request){
		ModelAndView model = new ModelAndView();
		String villageName=request.getParameter("villageName"); //获取该村名称
		List result=new ArrayList<>();
		result = cunqingService.findVillageByName(villageName);
		model.addObject("villagelist", result);
		model.setViewName(VILLAGELIST_PAGE);
		return model;
	}
	/**
	 * @description 通过村子唯一编码查询村子基本信息
	 * @author huoge
	 * @date 2017年2月19日
	 * @param request
	 * @return
	 */
	@RequestMapping("findVillageInfoByCode")
	@ResponseBody
	public Object findVillageInfoByCode(HttpServletRequest request){
		String villageCode=request.getParameter("villageCode"); //获取该村编码
		villageCode=new String(Base64.decodeBase64(villageCode.getBytes()));//获得解密后的
		if(StringUtils.isEmpty(villageCode)){
			return ResponseUtil.error("请选择要查询的乡村！");
		}
		Map map = new HashMap<>();
		RegVillage village=cunqingService.findVillageInfoByCode(villageCode);
		Double mj = village.getMj();
		if(mj!=null && mj!=0){
			double   f   =   mj/1000000;  
			BigDecimal   b   =   new   BigDecimal(f);  
			double   f1   =   b.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue();  
			village.setMj(f1);
		}
		double plantmj=cunqingService.findPlantArea(villageCode);
		double animalmj=cunqingService.findAnimalArea(villageCode);
		Map result=cunqingService.findForestArea(villageCode);
		//民俗旅游村 简介
		String jianJie = cunqingService.getXclyJj(villageCode);
		if(!org.springframework.util.StringUtils.hasText(jianJie)){
			jianJie="暂无简介"; 
		}

		village.setPlantMj(plantmj);
		village.setAnimalMj(animalmj);
		village.setResult(result);
		map.put("village", village);
		map.put("xclyJj", jianJie);

		if(ObjectUtils.isNotNull(village)){
			return ResponseUtil.success(map);
		}
		return ResponseUtil.error("出现异常,未查询到结果");
	}

	/**
	 * @description 村子中蔬菜和粮食作物的统计(异步请求方式)
	 * @author huoge
	 * @date 2017年2月19日
	 * @param request
	 * @return
	 */
	@RequestMapping("ajax/findCropInfo")
	@ResponseBody
	public Object findCropInfo(HttpServletRequest request){
		String villageCode=request.getParameter("villageCode"); //获取该村编码
		String cropType=request.getParameter("cropType"); //蔬菜种类
		villageCode=new String(Base64.decodeBase64(villageCode.getBytes()));//获得解密后的
		cropType=new String(Base64.decodeBase64(cropType.getBytes()));//获得解密后的
		if(cropType.trim().equals("shucai")){
			cropType="蔬菜";
		}else if(cropType.trim().equals("liangjing")){
			cropType="粮经";
		}else if(cropType.trim().equals("guopin")){
			cropType="果品";
		}else if(cropType.trim().equals("qitazuowu")){
			cropType="其他";
		}
		String nf=request.getParameter("nf"); //统计年份
		Map params=new HashMap<>();
		params.put("XZC_CODE", villageCode);
		params.put("SC_LB", cropType);
		params.put("NF", nf);
		List result=cunqingService.findItemByParams(params, ZzZwsc.class);
		if(ObjectUtils.isNull(result)){
			return ResponseUtil.error("出现异常,未查询到结果");
		}
		else{
			return ResponseUtil.success(result);
		}
	}

	/**
	 * @description 获取实用人才数量
	 * @author huoge
	 * @date 2017年3月8日
	 * @param request
	 * @return
	 */
	@RequestMapping("ajax/findTalentsCount")
	@ResponseBody
	public Object findTalentsCount(HttpServletRequest request){
		String villageCode=request.getParameter("villageCode"); //获取该村编码
		villageCode=new String(Base64.decodeBase64(villageCode.getBytes()));//获得解密后的
		long count=tbBaseInfoService.findTbBaseInfoCountByVillageCode(villageCode);
		KeyValue kv=new KeyValue();
		kv.setValue(count);
		return ResponseUtil.success(kv);
	} 
	/**
	 * @description 获取实用人才数量
	 * @author huoge
	 * @date 2017年3月8日
	 * @param request
	 * @return
	 */
	@RequestMapping("view/findTalentsInfo")
	public ModelAndView findTalentsInfo(HttpServletRequest request){
		ModelAndView model = new ModelAndView();
		String villageCode=request.getParameter("villageCode"); //获取该村编码
		villageCode=new String(Base64.decodeBase64(villageCode.getBytes()));//获得解密后的
		List<TbBaseInfo> tbbaseinfos=tbBaseInfoService.findTbBaseInfoByVillageCode(villageCode);
		Map ta_classification,ta_education,ta_hukou,ta_nation,ta_politics,ta_techposition,ta_trainingtype,ta_worktype=new HashMap<>();
		for(int i=0;i<tbbaseinfos.size();i++){
			TbBaseInfo tbbaseinfo=tbbaseinfos.get(i);

			ta_classification=tbBaseInfoService.findByCondition("h_TA_ClassiFication", "ClassiFication_ID",Integer.parseInt(tbbaseinfo.getClassiFicationId()));
			tbbaseinfo.setClassiFicationName(ta_classification.get("ClassiFication_Name").toString());

			ta_education=tbBaseInfoService.findByCondition("h_TA_Education", "Education_ID", Integer.parseInt(tbbaseinfo.getEducationId()));
			tbbaseinfo.setEducationName(ta_education.get("Education_Name").toString());

			ta_hukou=tbBaseInfoService.findByCondition("h_TA_Hukou", "Hukou_ID", Integer.parseInt(tbbaseinfo.getHukouId()));
			tbbaseinfo.setHukouName(ta_hukou.get("Hukou_Name").toString());

			ta_nation=tbBaseInfoService.findByCondition("h_TA_Nation", "Nation_ID", Integer.parseInt(tbbaseinfo.getNationId()));
			tbbaseinfo.setNationName(ta_nation.get("Nation_Name").toString());

			ta_politics=tbBaseInfoService.findByCondition("h_TA_Politics", "Politics_ID", Integer.parseInt(tbbaseinfo.getPoliticsId()));
			tbbaseinfo.setPoliticsName(ta_politics.get("Politics_Name").toString());

			ta_techposition=tbBaseInfoService.findByCondition("h_TA_Techposition", "Techposition_ID", Integer.parseInt(tbbaseinfo.getTechpositionID()));
			tbbaseinfo.setTechpositionName(ta_techposition.get("Techposition_Name").toString());

			ta_trainingtype=tbBaseInfoService.findByCondition("h_TA_TrainingType", "TrainingType_ID", Integer.parseInt(tbbaseinfo.getTraingTypeId()));
			tbbaseinfo.setTraingTypeName(ta_trainingtype.get("TrainingType_Name").toString());

			/*ta_worktype=tbBaseInfoService.findByCondition("h_TA_WorkType", "WorkType_ID",tbbaseinfo.getWorkTypeId());
			tbbaseinfo.setWorkTypeName(ta_worktype.get("WorkType_Name").toString());*/
		}

		model.addObject("tbbaseinfosList", tbbaseinfos);
		model.setViewName(ITEM_INFOLIST_PAGE);
		return model;
	}



	/**
	 * @description 获取作物数量
	 * @author huoge
	 * @date 2017年3月8日
	 * @param request
	 * @return
	 */
	@RequestMapping("ajax/findCropCount")
	@ResponseBody
	public Object findCropCount(HttpServletRequest request){
		String villageCode=request.getParameter("villageCode"); //获取该村编码
		String cropType=request.getParameter("cropType"); //蔬菜种类
		String nf=request.getParameter("nf"); //统计年份
		villageCode=new String(Base64.decodeBase64(villageCode.getBytes()));//获得解密后的
		cropType=new String(Base64.decodeBase64(cropType.getBytes()));//获得解密后的
		nf=new String(Base64.decodeBase64(nf.getBytes()));//获得解密后的
		if(cropType.trim().equals("shucai")){
			cropType="蔬菜";
		}else if(cropType.trim().equals("liangjing")){
			cropType="粮经";
		}else if(cropType.trim().equals("guopin")){
			cropType="果品";
		}else if(cropType.trim().equals("qitazuowu")){
			cropType="其他";
		}

		Map params=new HashMap<>();
		params.put("XZC_CODE", villageCode);
		params.put("SC_LB", cropType);
		params.put("NF", nf);
		long count=cunqingService.findItemCountByParams(params, ZzZwsc.class);
		KeyValue kv=new KeyValue();
		kv.setValue(count);
		return ResponseUtil.success(kv);
	}
	/**
	 * @description 村子中蔬菜和粮食作物的统计(视图请求方式)
	 * @author huoge
	 * @date 2017年2月19日
	 * @param request
	 * @return
	 */
	@RequestMapping("view/findCropInfo")
	public ModelAndView findCropInfoView(HttpServletRequest request){
		ModelAndView model = new ModelAndView();
		String villageCode=request.getParameter("villageCode"); //获取该村编码
		String cropType=request.getParameter("cropType"); //蔬菜种类
		String nf=request.getParameter("nf"); //统计年份
		villageCode=new String(Base64.decodeBase64(villageCode.getBytes()));//获得解密后的
		cropType=new String(Base64.decodeBase64(cropType.getBytes()));//获得解密后的
		nf=new String(Base64.decodeBase64(nf.getBytes()));//获得解密后的
		if(cropType.trim().equals("shucai")){
			cropType="蔬菜";
		}else if(cropType.trim().equals("liangjing")){
			cropType="粮经";
		}else if(cropType.trim().equals("guopin")){
			cropType="果品";
		}else if(cropType.trim().equals("qitazuowu")){
			cropType="其他"; 
		}
		Map params=new HashMap<>();
		params.put("XZC_CODE", villageCode);
		params.put("SC_LB", cropType);
		params.put("NF", nf);
		List result=cunqingService.findItemByParams(params, ZzZwsc.class);
		model.addObject("itemsZzZwscinfolist", result);
		model.setViewName(ITEM_INFOLIST_PAGE);
		return model;
	}



	/*	/**
	 * @description 初始化并跳转村情各项指标界面
	 * @author huoge
	 * @date 2017年2月20日
	 * @param request
	 * @return
	 *//*
	@RequestMapping("initItemCountPage")
	public String initItemCountPage(HttpServletRequest request){
	   String tipItems="CsJbxx,DanjiJbxx,SnqyJbxx,ScyzcJbxx,GyJbxx,HhjdJbxx,JyscJbxx,KjsfhJbxx,KjsfyqJbxx,MpJbxx,NainiuJbxx,NfscJbxx,NyjstgzJbxx,ScyzcJbxx,SnqyJbxx,SyjyqyJbxx,TzqyJbxx,WlwsdjsJbxx,XqlzcJbxx";
	    request.setAttribute("tipItems", tipItems);
	    return "app/datatopic/cunqingtopic/cunqinginfo";
	}*/
	/**
	 * @description 初始化并跳转村情各项指标界面()
	 * @author huoge
	 * @date 2017年2月20日
	 * @param request 
	 * @return 
	 */
	@RequestMapping("initItemCountPage")
	public String initItemCountPage(HttpServletRequest request){
		//String tipItems="NykjAnyzJbxx,NykjYcjyzdJbxx,NykjSzjyJbxx,NykjXtygzzJbxx,NjfwzzJbxx,Yayzcbxx,RouniuyzJbxx,YangyzJbxx,SczsqyyzJbxx,DwwsfysJbxx,DwzldwJbxx,CsJbxx,DanjiJbxx,RoujiyzJbxx,SnqyJbxx,ScyzcJbxx,GggyJbxx,GyJbxx,HhjdJbxx,JyscJbxx,KjsfhJbxx,KjsfyqJbxx,MpJbxx,NainiuJbxx,NfscJbxx,NyjstgzJbxx,ScyzcJbxx,SnqyJbxx,SyjyqyJbxx,TzqyJbxx,WlwsdjsJbxx,XqlzcJbxx";
		StringBuffer tipItems=new StringBuffer();
		//畜牧水产
		tipItems.append("Yayzcbxx,") //羊养殖场
		.append("SlqyyzJbxx,")   //饲料企业
		.append("YangyzJbxx,") //羊养殖场
		.append("ShengzhuJbxx,") //生猪养殖场
		.append("YzcJbxx,") //养殖场
		.append("SczsqyyzJbxx,")//水产追溯企业
		.append("DwwsfysJbxx,")//动物卫生防疫所
		.append("DwzldwJbxx,")//动物诊疗单位
		.append("DanjiJbxx,")//蛋鸡养殖场
		.append("RoujiyzJbxx,")//肉鸡养殖场
		.append("ScyzcJbxx,")//水产养殖场
		.append("NainiuJbxx,")//奶牛养殖场
		.append("XqlzcJbxx,")//畜禽良种场
		.append("TzqyJbxx,")//屠宰企业
		.append("SyjyqyJbxx,")//兽药经营企业
		.append("RouniuyzJbxx,")//肉牛养殖场
		.append("XmjgJbxx,");//畜牧相关机构
		//种植生产
		tipItems.append("GggyJbxx,")//观光果园
		.append("ZzSpbase,")//种植基地
		.append("GyJbxx,")//果园基地
		.append("HhjdJbxx,")//花卉基地
		.append("MpJbxx,")//苗圃基地
		.append("SnqyJbxx,")//涉农企业
		.append("TsNcpJbxx/CmsYcypShier,");//特色农产品

		//市场资源
		tipItems.append("NfscJbxx,")//农副市场
		.append("JyscJbxx,")//经营市场
		.append("CsJbxx,");//百货超市

		//农业科技
		tipItems.append("NykjAnyzJbxx,")//爱农驿
		.append("SsnyJbxx,")//设施农业
		.append("NykjYcjyzdJbxx,")//远程教育站点
		.append("NykjSzjyJbxx,")//数字家园
		.append("NykjXtygzzJbxx,")//协调员工作站
		.append("NjfwzzJbxx,")//农机服务组织
		.append("WlwsdjsJbxx,")//物联网示范点
		.append("NyjstgzJbxx,")//农业技术推广站
		.append("KjsfyqJbxx,")//科技示范园区
		.append("KjsfhJbxx,");//科技示范户

		//自然资源
		tipItems.append("NatureSoil,")//土壤资源
		.append("NatureNyd,")//农用地资源
		.append("NatureFnyd,");//非农用地资源
		//乡村旅游
		tipItems.append("XclyLyc,")//民俗旅游村
		.append("XclyLyh,")//民俗旅游户
		.append("XclyNyYq,");//休闲农业园区
		//新农村建设
		tipItems.append("XncJsJbxx");//新农村建设

		request.setAttribute("topicVillageinfoCropYear", topicVillageinfoCropYear);
		request.setAttribute("tipItems", tipItems.toString());
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return CUNQINGINFO_PAGE;
	}


	/**
	 * @description 查询各村存在指标项的数量
	 * @author huoge
	 * @date 2017年4月26日
	 * @param request 
	 * @return 
	 */
	@RequestMapping("ajax/staticItemsCount")
	@ResponseBody
	public Object  staticItemsCount(HttpServletRequest request){
		StringBuffer tipItems=new StringBuffer();
		//乡村旅游
		tipItems.append("XclyLyc,")//民俗旅游村
		.append("XclyLyh,")//民俗旅游户
		.append("XclyNyYq,");//休闲农业园区
		//畜牧水产
		tipItems.append("Yayzcbxx,") //羊养殖场
		.append("SlqyyzJbxx,")   //饲料企业
		.append("YangyzJbxx,") //养殖场
		.append("SczsqyyzJbxx,")//水产追溯企业
		.append("DwwsfysJbxx,")//动物卫生防疫所
		.append("DwzldwJbxx,")//动物诊疗单位
		.append("DanjiJbxx,")//蛋鸡养殖场
		.append("RoujiyzJbxx,")//肉鸡养殖场
		.append("ScyzcJbxx,")//水产养殖场
		.append("NainiuJbxx,")//奶牛养殖场
		.append("XqlzcJbxx,")//畜禽良种场
		.append("TzqyJbxx,")//屠宰企业
		.append("SyjyqyJbxx,")//兽药经营企业
		.append("RouniuyzJbxx,");//肉牛养殖场
		//种植生产
		tipItems.append("GggyJbxx,")//观光果园
		.append("ZzSpbase,")//种植基地
		.append("GyJbxx,")//果园基地
		.append("HhjdJbxx,")//花卉基地
		.append("MpJbxx,")//苗圃基地
		.append("SnqyJbxx,")//涉农企业
		.append("TsNcpJbxx,");//特色农产品

		//市场资源
		tipItems.append("NfscJbxx,")//农副市场
		.append("JyscJbxx,")//经营市场
		.append("CsJbxx,");//百货超市

		//农业科技
		tipItems.append("NykjAnyzJbxx,")//爱农驿
		.append("SsnyJbxx,")//设施农业
		.append("NykjYcjyzdJbxx,")//远程教育站点
		.append("NykjSzjyJbxx,")//数字家园
		.append("NykjXtygzzJbxx,")//协调员工作站
		.append("NjfwzzJbxx,")//农机服务组织
		.append("WlwsdjsJbxx,")//物联网示范点
		.append("NyjstgzJbxx,")//农业技术推广站
		.append("KjsfyqJbxx,")//科技示范园区
		.append("KjsfhJbxx,");//科技示范户

		//自然资源
		tipItems.append("NatureSoil,")//土壤资源
		.append("NatureNyd,")//农用地资源
		.append("NatureFnyd,");//非农用地资源

		//新农村建设
		tipItems.append("XncJsJbxx");//新农村建设

		String []items=tipItems.toString().split(",");
		List<RegVillage> allVillageList= regVillageInfoService.getAllVillage();
		Map villageCount=new HashMap<>();

		for(int n=0;n<allVillageList.size();n++){
			RegVillage village=allVillageList.get(n);
			long number=0;
			if(null!=village.getCode()&&!"".equals(village.getCode())){
				String villageCode=village.getCode().trim(); //获取该村唯一编码
				long tourismCount=getCount(villageCode,"XclyLyc"); //判断是否是民俗旅游村
				if(tourismCount>0){  //如果是民俗旅游村
					for(int i=0;i<items.length;i++){
						String tipItem=items[i]; //获取要查询的项目类标志。
						long count=getCount(villageCode,tipItem);
						if(count>0){
							++number;
						}
					}
					if(number>8){ //满足民俗旅游的
						villageCount.put(villageCode, number);
						System.out.println("村名："+village.getFullname()+",指标数："+number);
					}
				}
			}
		}
		return ResponseUtil.success(SortUtil.sortMap(villageCount));
	}

	private long getCount(String villageCode,String tipItem){
		long count=0;
		Class clazzname=null;
		try {
			clazzname = Class.forName("com.dm.app.datatopic.model."+tipItem);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		count = cunqingService.findItemCountInVillage(villageCode,clazzname);
		return count;
	}



}
