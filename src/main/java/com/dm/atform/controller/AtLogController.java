package com.dm.atform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("atlog")
public class AtLogController {
	
	@RequestMapping("/page")
	public String page(Model model) {
		return "/atform/log/page";
	}
}
