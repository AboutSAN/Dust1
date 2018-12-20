package com.sist.dust1;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
/*
 *   MVC 구조 
 *   Controller : Front Controller (요청받기) = DispatcherServlet
 *                   *.do 
 *   Model : 기능 처리 (프로그래머)
 *           ========================== @Controller
 *                .jsp , .do
 *             1) 파일 이동 = forward => request를 전송
 *             2) 파일 이동 = redirect => request의 정보가 필요없는 경우 
 *             ========================== Ajax,Jquery : @RestController
 *             3) 문자열 전송 (스크립트,JSON) 전송 
 *                
 *   View 
 *   
 *      = 자바   (1.8)
 *      = 오라클 (11g)
 *     = HTML (5)
 *     = jquery (3)
 *     = Bootstrap (3)
 *     = Hadoop (2.7.3)
 *     = R (3.4.4)
 *     = 
 */
import java.util.*;
import com.sist.dao.*;
import java.net.*;
@Controller
public class BoardController {
   // BoardDAO객체를 얻어 온다
	@Autowired
	private BoardDAO dao;
	
	
	@RequestMapping("list.do")
	public String board_list(String page,Model model)
	{
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		List<BoardVO> list=dao.boardListData(curpage);
		int totalpage=dao.boardTotalPage();
		// 전송 (list.jsp)
		model.addAttribute("list", list);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		return "board/list";
	}
	// insert창만 변경
	@RequestMapping("insert.do")
	public String board_insert()
	{
		return "board/insert";
	}
	
	@RequestMapping("insert_ok.do")
	public String board_insert_ok(BoardVO vo)
	{
		 dao.boardInsert(vo);
		 return "redirect:list.do";
	}
	
	@RequestMapping("detail.do")
	public String board_detail(int no,Model model)
	{
		//model => request(데이터를 jsp로 전송할 때 사용)
		BoardVO vo=dao.boardDetailData(no);
		model.addAttribute("vo", vo);
		
		try
		{
			FileWriter fw=new FileWriter("/home/sist/data/board.txt");
			fw.write(vo.getContent());
			fw.close();
			// 파일 만들기 
		}catch(Exception ex){}
		
		
		return "board/detail";
	}
	
	@RequestMapping("update.do")
	public String board_update(int no,Model model)
	{
		BoardVO vo=dao.boardUpdateData(no);
		model.addAttribute("vo", vo);
		return "board/update";
	}
	
	@RequestMapping("delete.do")
	public String board_delete(int no,Model model)
	{
		model.addAttribute("no", no);
		return "board/delete";
	}
	
	@RequestMapping("json_list.do")
	public String json_list(Model model)
	{
		try
		{
			URL url=new URL("http://localhost:8080/board/main/json.do");
			HttpURLConnection conn=(HttpURLConnection)url.openConnection();
			String data="";
			if(conn!=null)
			{
				BufferedReader br=new BufferedReader(
						new InputStreamReader(conn.getInputStream(), "UTF-8"));
				while(true)
				{
					
					String s=br.readLine();
					if(s==null)
						break;
					data+=s;
					
				}
				br.close();
			}
			System.out.println(data);
			List<AddressVO> list=addressAllData(data);
			model.addAttribute("list", list);
		}catch(Exception ex){}
		return "board/addr";
	}
	
	public List<AddressVO> addressAllData(String json)
	{
		
		List<AddressVO> list=new ArrayList<AddressVO>();
		try
		{
		JSONParser parser = new JSONParser();
		JSONObject root=(JSONObject)parser.parse(json);
		JSONArray arr=(JSONArray)root.get("addrList");
		System.out.println("arr:"+arr);
		for(int i=0;i<arr.size();i++)
		{
			JSONObject o=(JSONObject)arr.get(i);
			System.out.println("o:"+o);
			AddressVO vo=new AddressVO();
			System.out.println((String)o.get("name"));
			vo.setName((String)o.get("name"));
			vo.setAddr((String)o.get("addr"));
			long l=(Long)o.get("age");
			System.out.println("l="+l);
			vo.setAge((int)l);
			System.out.println("=================");
			System.out.println(vo.getName()+" "+vo.getAddr()+" "+vo.getAge());
			list.add(vo);
		}
		}catch(Exception ex){ex.printStackTrace();}
		return list;
	}
	
}








