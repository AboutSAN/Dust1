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
public class DetailParse {
	@Autowired
	private TourDAO dao;
/*	public static void main(String[] args) 
	{
		
		DetailParse dp = new DetailParse();
		dp.detailAllData();
	}*/
	public List<TourVO> detailAllData(String contentid)
	{
		List<TourVO> dlist=new ArrayList<TourVO>();
		BufferedReader br = null;
		
		try
		{
			String urlstr="http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=GCO2ATlyEUdlIoqhNkCM91V%2F1o7tWBOyIYbzdavdmvhULI%2B3Gn%2FSEvYrbqznMURBO1Oy7A05Yf8TtGkU8FyvDQ%3D%3D"
					+"&contentId="+contentid
					+"&defaultYN=Y&addrinfoYN=Y&overviewYN=Y&areacodeYN=Y&sigungucodeYN=Y&MobileOS=ETC&MobileApp=AppTest&_type=json";
			URL url=new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			String result = "";
			String line;
			while ((line = br.readLine()) != null) {
				result = result + line + "\n";
			}
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(result);
			
			// Top레벨 단계인 list 키를 가지고 데이터를 파싱합니다.
			JSONObject response = (JSONObject) obj.get("response");
			JSONObject body = (JSONObject) response.get("body");
			JSONObject items = (JSONObject) body.get("items");
			JSONObject item = (JSONObject) items.get("item");
			JSONObject detail;

			// 필요한 데이터만 가져오려고합니다.
			//for (int j = 0; j < item.size(); j++) {
			try {
				//detail = (JSONObject) item.get(0);
				String addr1 = (item.get("addr1").toString());
				String addr2 = (item.get("addr2").toString());
				//System.out.println(item.get("contentid").toString());
				int contentid1= Integer.parseInt(item.get("contentid").toString());
				String contenttypeid = (item.get("contenttypeid").toString());
				int areacode=Integer.parseInt(item.get("areacode").toString());
				int sigungucode=Integer.parseInt(item.get("sigungucode").toString());
				String homepage = (item.get("homepage").toString());
				String overview = (item.get("overview").toString());
				String title = (item.get("title").toString());
				System.out.println("=======================");

				System.out.println("주소1" + addr1);
				System.out.println("주소2" + addr2);
				System.out.println("콘텐츠" + contentid1);
				System.out.println("홈페이지" + homepage);
				System.out.println("개요" + overview);
				System.out.println("제목" + title);
				TourVO vo = new TourVO();
				vo.setAddr1(addr1);
				vo.setAddr2(addr2);
				vo.setTitle(title);
				vo.setContentid(contentid1);
				vo.setContenttypeid(contenttypeid);
				vo.setAreacode(areacode);
				vo.setSigungucode(sigungucode);
				vo.setHomepage(homepage);
				vo.setOverview(overview);
				dlist.add(vo);
				dao.DetailParseInsert(vo);

			} catch (Exception e) {
				e.printStackTrace();
			}

			br.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return dlist;

	}
}
