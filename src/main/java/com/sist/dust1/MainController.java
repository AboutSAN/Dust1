package com.sist.dust1;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.DustDAO;
import com.sist.dao.DustParser;
import com.sist.dao.DustVO;


@Controller
public class MainController {
	@Autowired
	private DustDAO dDao;
	
	@Autowired
	DustParser dp;
	
	@RequestMapping("main.do")
	public String main_page(String gu,Model model, DustVO vo)
	{
		//dp.dustAllData();
		
		String[] guList_1 = { "전체", "강서", "양천", "구로", "마포", "영등포", "금천",
			    "은평", "서대문", "동작", "관악", "종로", "중구", "용산", "서초", "강북",
			    "성북", "도봉", "동대문", "성동", "강남", "노원", "중랑", "광진", "송파",
			    "강동" };
	   if(gu==null)
		   gu="4";
	   String[] guList = new String[26];
		for (int i = 1; i <= 25; i++) {
			if (gu.equals(Integer.toString(i))) {
				guList[i] = "image/map/gu_" + i + "_on.png";
			} else {
				guList[i] = "image/map/gu_" + i + "_off.png";
			}
		}
	   model.addAttribute("guList", guList);
	   
	   dDao.dustInsert(vo);
	   
	   return "main";
	}
	
	
	/*@RequestMapping("gudetail.do")
	public String main_detail()
	{
		return "main/gudetail";
	}*/
}
