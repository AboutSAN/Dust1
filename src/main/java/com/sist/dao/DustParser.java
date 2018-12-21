package com.sist.dao;

import java.io.*;
import java.util.*;
import java.net.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
public class DustParser {
	
	@Autowired
	private DustDAO dao;
	public static void main(String[] args)
	{
		DustParser dp=new DustParser();
		dp.dustAllData();

	}
	public List<DustVO> dustAllData()
	{
		List<DustVO> list1=new ArrayList<DustVO>();
		BufferedReader br = null;
		/*ApplicationContext app=
				new ClassPathXmlApplicationContext("app.xml");
		DustParser d=app.getBean("dustParser",DustParser.class);*/
		try
		{	
			String sn[]={"강남구","서초구","송파구","용산구","양천구","성동구","마포구","강동구","광진구","중구","동작구","영등포구","종로구","강서구","서대문구","동대문구","관악구","성북구","은평구","구로구","노원구","강북구","중랑구","금천구","도봉구"};
			for(String loc:sn)
			{
				
				String urlstr="http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty?stationName="+loc+"&dataTerm=daily&pageNo=1&numOfRows=10&ServiceKey=VL8GwfRWWLnj5bdd6sUo2tOeV%2F0JVIkkLyNzR9loCVmbMA2w0miz5vBNs8mrfKJTPoVn3FaaDDTuDYP9sh0Ohw%3D%3D&ver=1.3&_returnType=json";
				URL url = new URL(urlstr);
				HttpURLConnection urlconnection = (HttpURLConnection)url.openConnection();
				urlconnection.setRequestMethod("GET");
				br=new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
				String result="";
				String line;
				while((line=br.readLine())!=null)
				{
					result=result+line+"\n";
				}
				System.out.println(loc);
				//System.out.println(result);
				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject) parser.parse(result);
				
				// Top레벨 단계인 list 키를 가지고 데이터를 파싱합니다.
				JSONArray list = (JSONArray) obj.get("list");
				JSONObject dust; 
				
				// 필요한 데이터만 가져오려고합니다.
			   for(int i=0;i<list.size();i++)
			   {
	          dust=(JSONObject)list.get(i);
	          String so2Value = (dust.get("so2Value").toString()); //실수로된 값과 정수로된 값이 둘다 있어서 실수로 통일했습니다.
	          String coValue = (dust.get("coValue").toString()); 
	          String o3Value = (dust.get("o3Value").toString()); 
	          String no2Value = (dust.get("no2Value").toString());
	          String pm10Value= (dust.get("pm10Value").toString());
	          String pm10Grade = (dust.get("pm10Grade").toString());
	          String dataTime = (dust.get("dataTime").toString());
	          
	          System.out.print("   dataTime : "+ dataTime);
	          System.out.print("   일산화탄소 농도 : "+ coValue);
	          System.out.print("   오존 농도 : "+ o3Value);
	          System.out.print("   이산화질소 농도 : "+ no2Value);
	          System.out.print("   미세먼지(PM10) 농도 : "+ pm10Value);
	          System.out.print("   미세먼지(PM10) 지수 : "+ pm10Grade);
	          System.out.println();
	          
	          DustVO vo=new DustVO();
	          vo.setLoc(loc);
	          vo.setDataTime(dataTime);
	          vo.setCoValue(so2Value);
	          vo.setCoValue(coValue);
	          vo.setO3Value(o3Value);
	          vo.setNo2Value(no2Value);
	          vo.setPm10Value(pm10Value);
	          vo.setPm10Grade(pm10Grade);
	          
	          dao.dustInsert(vo);
			   }
	        }
	          br.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		 return list1;
	}
}