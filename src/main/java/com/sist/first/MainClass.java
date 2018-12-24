package com.sist.first;

import java.io.FileReader;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.sist.tour.DetailParse;

import java.util.*;
@Component
public class MainClass {
	@Autowired
	private DetailParse dp;
	@Autowired
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext app=new ClassPathXmlApplicationContext("app.xml");
		MainClass mc=app.getBean("mainClass",MainClass.class);
		try
		{  
			    /*List<CategoryVO> list=mc.mgr.categoryAllData();
			    for(CategoryVO vo:list)
			    {
			    	mc.dao.foodInsert(vo);
			    }*/
			    mc.dp.detailAllData("126508");  
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}

}
