package com.sist.dust1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("main.do")
	public String main_page()
	{
		return "main";
	}
	
	@RequestMapping("map.do")
	public String main_map()
	{
		return "map"; 
	}
	@RequestMapping("gudetail.do")
	public String main_detail()
	{
		return "main/gudetail";
	}
}
