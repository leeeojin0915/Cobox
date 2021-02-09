package com.koreait.cobox.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminTheaterController {
	
	@GetMapping("/theater/registform")
	public String getRegist() {
		
		return "admin/theater/theater_regist";
	}

}