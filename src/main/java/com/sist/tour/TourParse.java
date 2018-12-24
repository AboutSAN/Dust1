package com.sist.tour;
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

@Component
public class TourParse {

	@Autowired
	private TourDAO dao;
	public static void main(String[] args) {
		ApplicationContext app=new ClassPathXmlApplicationContext("app.xml");
		TourParse d=app.getBean("tourParse",TourParse.class);
		d.tourAllData();
	}
	public List<TourVO> tourAllData()
	{
		// 지역코드 :1
		/*
		 * http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=GCO2ATlyEUdlIoqhNkCM91V%2F1o7tWBOyIYbzdavdmvhULI%2B3Gn%2FSEvYrbqznMURBO1Oy7A05Yf8TtGkU8FyvDQ%3D%3D&contentTypeId=15
		 * &areaCode=1&sigunguCode=8&MobileOS=ETC&MobileApp=AppTest
		 */
		List<TourVO> tlist=new ArrayList<TourVO>();
		BufferedReader br = null;
		/*ApplicationContext app=new ClassPathXmlApplicationContext("app.xml");
		TourParse d=app.getBean("tourParse",TourParse.class);*/
		
		
			for (int i = 1; i < 26; i++) {
				
				try{
					String c[]={"12","14","15","25","28","32","38","39"};
					for (String type:c)
					{
					String urlstr="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=VL8GwfRWWLnj5bdd6sUo2tOeV%2F0JVIkkLyNzR9loCVmbMA2w0miz5vBNs8mrfKJTPoVn3FaaDDTuDYP9sh0Ohw%3D%3D&contentTypeId="+type+"&areaCode=1&sigunguCode="+i+"&MobileOS=ETC&MobileApp=AppTest&_type=json";
					// contenttypeid = (12=관광지),(14=문화시설),(15=축제/공연/행사),(25=여행코스),(28=레포츠),(32=숙박),(38=쇼핑),(39=음식)
					URL url = new URL(urlstr);
					HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
					//urlconnection.setRequestMethod("GET");
					br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
					StringBuffer result = new StringBuffer();
					String line;
					while ((line = br.readLine()) != null) {
						result.append(line + "\n");
					}
					//System.out.println(result);
					//System.out.println("-------------");
					JSONParser parser = new JSONParser();
					JSONObject obj = (JSONObject) parser.parse(result.toString());
                   System.out.println("obj="+obj);
					// Top레벨 단계인 list 키를 가지고 데이터를 파싱합니다.
					JSONObject response = (JSONObject) obj.get("response");
					JSONObject body = (JSONObject) response.get("body");
					JSONObject items = (JSONObject) body.get("items");
					JSONArray item = (JSONArray) items.get("item");
					JSONObject tour;

					// 필요한 데이터만 가져오려고합니다.
					for (int j = 0; j < item.size(); j++) {
						try{
						tour = (JSONObject) item.get(j);
						String addr1 = (tour.get("addr1").toString());
						int contentid=Integer.parseInt(tour.get("contentid").toString());
						String contenttypeid=(tour.get("contenttypeid").toString());
					   int areacode=Integer.parseInt(tour.get("areacode").toString());
						int sigungucode=Integer.parseInt(tour.get("sigungucode").toString());
						String title = (tour.get("title").toString());
						String firstimage = (tour.get("firstimage").toString());
						String firstimage2 = (tour.get("firstimage2").toString());
						System.out.println("=======================");

						System.out.println("주소" + addr1);
						System.out.println("contentid"+contentid);
						System.out.println("contenttypeid"+contenttypeid);
						System.out.println("areacode"+areacode);
						System.out.println("sigungucode"+sigungucode);
						System.out.println("제목" + title);
						System.out.println("이미지"+firstimage);
						System.out.println("이미지"+firstimage2);
						
						TourVO vo = new TourVO();
						vo.setAddr1(addr1);
						vo.setContentid(contentid);
						vo.setContenttypeid(contenttypeid);
						vo.setAreacode(areacode);
						vo.setSigungucode(sigungucode);
						vo.setTitle(title);
						vo.setFirstimage(firstimage);
						vo.setFirstimage2(firstimage2);
						tlist.add(vo);
						dao.TourParseInsert(vo);
						}catch (Exception e) {
							/*System.out.println("작은 캐치");*/
						}
					}
				br.close();
					}
				}catch(Exception ex)
				{
					ex.printStackTrace();
				}
		
		}
			
			return tlist;
			
	}
}