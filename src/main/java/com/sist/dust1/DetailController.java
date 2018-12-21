package com.sist.dust1;

import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sist.dao.*;
@Controller
public class DetailController {
	@Autowired
	private DustDAO dao;
	@RequestMapping("gudetail.do")
	public String main_detail(Model model,String guname)
	{
		if(guname==null)
			guname="강남구";
		DustVO vo = dao.guDustData(guname);
		double result = Double.parseDouble(vo.getPm10Value())/100;
		System.out.println("result:"+result);
		String input = String.valueOf(result);
		//vo.setPm10Value(input);
		String value="["+vo.getCoValue()+","+vo.getO3Value()+","+vo.getNo2Value()+","+input+"]";
		String state = dao.mentMaker(Integer.parseInt(vo.getPm10Grade()));
		model.addAttribute("state",state);
		model.addAttribute("value",value);
		model.addAttribute("vo",vo);
		return "main/gudetail";
	}
}
