package com.sist.dust1;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.*;
// Update,Delete => 스크립트 
// sendRedirect => request의 데이터를 전송할 수 있다
@RestController 
public class BoardRestController {
	@Autowired
	private BoardDAO dao;
    @RequestMapping("update_ok.do")
    public String board_update_ok(BoardVO vo)
    {
    	String result="";
    	boolean bCheck=dao.boardUpdateOk(vo);
    	if(bCheck==true)
    	{
    		result="<script>"
    			   +"location.href=\"detail.do?no="+vo.getNo()+"\";"
    				+"</script>";
    	}
    	else
    	{
    		result="<script>"
     			   +"alert(\"비밀번호거 틀립니다!!\");"
    				+"history.back();"
     				+"</script>";
    	}
    	return result;
    }
    
    @RequestMapping("delete_ok.do")
    public String board_delete_ok(int no,String pwd)
    {
    	String result="";
    	boolean bCheck=dao.boardDeleteOk(no, pwd);
    	if(bCheck==true)
    	{
    		result="<script>"
    			   +"location.href=\"list.do\""
    			   +"</script>";
    	}
    	else
    	{
    		result="<script>"
     			   +"alert(\"Password Fail!!\");"
    				+"history.back();"
     				+"</script>";
    	}
    	return result;
    }
    @RequestMapping("json.do")
    public String main_json(Model model)
    {
    	 String[] name={"Hong","Shim","Lee","Kim","Kang"};
    	 String[] addr={"서울","부산","제주","경기","인천"};
    	 int[] age={25,34,20,30,23};
    	 JSONObject obj=new JSONObject();
    	 JSONArray arr=new JSONArray();
    	 
    	 for(int i=0;i<name.length;i++)
    	 {
    		 JSONObject o=new JSONObject();
    		 o.put("name", name[i]);
    		 o.put("addr", addr[i]);
    		 o.put("age", age[i]);
    		 arr.add(o);
    	 }
    	 obj.put("addrList", arr);
    	 return obj.toJSONString();
    }
}






