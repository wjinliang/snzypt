package com.dm.app.app.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.cunqing.constants.ModelPath;
import com.dm.app.datatopic.cunqing.cunqinginfo.model.TbBaseInfo;
import com.dm.app.datatopic.cunqing.cunqinginfo.service.CunqingService;
import com.dm.app.datatopic.cunqing.cunqinginfo.service.TbBaseInfoService;
import com.dm.app.datatopic.cunzhuangguhua.model.CountryPic;
import com.dm.app.datatopic.cunzhuangguhua.service.CountryPicService;
import com.dm.app.datatopic.model.RegVillage;
import com.dm.app.datatopic.model.ecahrt.KeyValue;
import com.dm.app.util.judge.ObjectUtils;
import com.dm.app.util.judge.StringUtils;
import com.dm.platform.util.ResponseUtil;

@Controller
@RequestMapping("/portal/app")
public class AppController {
	
	@Autowired
	private CunqingService cunqingService;
	@Autowired
	private TbBaseInfoService tbBaseInfoService;
	
	@RequestMapping("{page}.htm")
	public String page(@PathVariable("page") String page){
		return "template/app_"+page;
	}
	
	@RequestMapping("getVillage")
	@ResponseBody
	public Object getVillage( String name){
		if(StringUtils.isEmpty(name))return ResponseUtil.success(new String[]{});
		List<RegVillage> regVillageList = cunqingService.findVillageByName(name);
		for(RegVillage v:regVillageList){
			v.setMc(v.getSzQx()+v.getSzXz()+v.getMc());
		}
		return ResponseUtil.success(regVillageList);
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
		//villageCode=new String(Base64.decodeBase64(villageCode.getBytes()));//获得解密后的
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
	 * @description 查询该行政村中各个项目的数量
	 * @author huoge
	 * @date 2017年2月16日
	 * @return
	 */
	@RequestMapping("findItemCountInVillage")
	@ResponseBody
	public Object findItemCountInVillage(HttpServletRequest request){
		String villageCode=request.getParameter("villageCode"); //获取该村唯一编码
		String tipItem=request.getParameter("tipItem"); //获取要查询的项目类标志。
		//villageCode=new String(Base64.decodeBase64(villageCode.getBytes()));//获得解密后的
		//tipItem=new String(Base64.decodeBase64(tipItem.getBytes()));//获得解密后的
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
	@RequestMapping("findItemInfoInVillage")
	@ResponseBody
	public Object findItemInfoInVillage(HttpServletRequest request){
		String villageCode=request.getParameter("villageCode"); //获取该村唯一编码
		String tipItem=request.getParameter("tipItem"); //获取要查询的项目class类标志字符串。
		//villageCode=new String(Base64.decodeBase64(villageCode.getBytes()));//获得解密后的
		//tipItem=new String(Base64.decodeBase64(tipItem.getBytes()));//获得解密后的
		if(StringUtils.isEmpty(villageCode)){
			return ResponseUtil.error("请选择要查询的乡村！");
		}
		if(tipItem.equals("Talents")){//特殊情况 实用人才数据
			return ResponseUtil.success(getTalents(villageCode));
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
	
	private List getTalents(String villageCode){
		List<TbBaseInfo> tbbaseinfos=tbBaseInfoService.findTbBaseInfoByVillageCode(villageCode);
		/*Map ta_classification,ta_education,ta_hukou,ta_nation,ta_politics,ta_techposition,ta_trainingtype,ta_worktype=new HashMap<>();
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

			ta_worktype=tbBaseInfoService.findByCondition("h_TA_WorkType", "WorkType_ID",tbbaseinfo.getWorkTypeId());
			tbbaseinfo.setWorkTypeName(ta_worktype.get("WorkType_Name").toString());
		}*/
		return tbbaseinfos;
	}
	
	@Autowired
	private CountryPicService countryPicService;
	
	@RequestMapping("byname")
	@ResponseBody
	public Object byname(String name){
		List<CountryPic> list = this.countryPicService.findListByCunName(name);
		return ResponseUtil.success(list);
	}
	
}
