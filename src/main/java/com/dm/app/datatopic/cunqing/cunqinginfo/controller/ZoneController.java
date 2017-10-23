package com.dm.app.datatopic.cunqing.cunqinginfo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.plexus.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dm.app.datatopic.cunqing.constants.ModelPath;
import com.dm.app.datatopic.cunqing.cunqinginfo.service.ZoneService;
import com.dm.app.util.judge.ObjectUtils;
import com.dm.app.util.judge.StringUtils;
import com.dm.platform.util.ResponseUtil;

/**
 * @description  用于地区选择业务
 * @author huoge
 */
@Controller
@RequestMapping("portal")
public class ZoneController {
	@Autowired
	private ZoneService zoneService;
	
	/**
	 * @description 查询所有区县
	 * @author huoge
	 * @date 2017年2月21日
	 * @param request
	 * @return
	 */
	@RequestMapping("ajax/findAllCounty")
	@ResponseBody
	public Object findAllCounty(HttpServletRequest request){
		List allcountylist=zoneService.findAllCounty();
		
		return ResponseUtil.success(allcountylist);
	} 
	
	/**
	 * @description 根据区县编码查询该区县下的所有乡镇
	 * @author huoge
	 * @date 2017年2月21日
	 * @param request
	 * @return
	 */
	@RequestMapping("ajax/findTownByQxCode")
	@ResponseBody
	public Object findTownByQxCode(HttpServletRequest request){
		String qxCode=request.getParameter("qxCode"); //获取该村唯一编码
		qxCode=new String(Base64.decodeBase64(qxCode.getBytes()));//获得解密后的
		if(StringUtils.isEmpty(qxCode)){
			return ResponseUtil.error("请选择要查询的区县！");
		}
		List result=new ArrayList<>();
		result = zoneService.findTownByQxCode(qxCode);
		if(ObjectUtils.isNotNull(result)){
			return ResponseUtil.success(result);
		}
		return ResponseUtil.error("出现异常,未查询到结果");
	}
	
	/**
	 * @description 根据乡镇编码查询该乡镇下的所有村子
	 * @author huoge
	 * @date 2017年2月21日
	 * @param request
	 * @return
	 */
	@RequestMapping("ajax/findVillageByXzCode")
	@ResponseBody
	public Object findVillageByXzCode(HttpServletRequest request){
		String xzCode=request.getParameter("xzCode"); //获取该村唯一编码
		xzCode=new String(Base64.decodeBase64(xzCode.getBytes()));//获得解密后的
		if(StringUtils.isEmpty(xzCode)){
			return ResponseUtil.error("请选择要查询的区县！");
		}
		List result=new ArrayList<>();
		result = zoneService.findVillageByXzCode(xzCode);
		if(ObjectUtils.isNotNull(result)){
			return ResponseUtil.success(result);
		}
		return ResponseUtil.error("出现异常,未查询到结果");
	}
	
	
	
}
