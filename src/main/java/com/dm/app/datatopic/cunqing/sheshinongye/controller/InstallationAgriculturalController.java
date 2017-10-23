package com.dm.app.datatopic.cunqing.sheshinongye.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.dm.app.datatopic.cunqing.sheshinongye.service.InstallationAgricultural;
import com.dm.cms.model.CmsSite;
import com.dm.cms.service.CmsSiteService;



@Controller
@RequestMapping("portal")
public class InstallationAgriculturalController {
	@Autowired
	CmsSiteService siteService;
	@Autowired
	InstallationAgricultural installationAgricultural;
	@RequestMapping("ajax/sheshistatistics")
	@ResponseBody
	public List<Map<String,String>> getPlantData(){
		List<Map<String,String>> list=installationAgricultural.getNumbers();
		return list;
	}
	@RequestMapping("sheshistaticstics")
	public String initVillageCountPage(HttpServletRequest request){
		CmsSite site = this.siteService.findOneById(1); 
		request.setAttribute("site", site);
		request.setAttribute("own", 2);
		return "template/sn_topic_installationagricultural";
	}
}
