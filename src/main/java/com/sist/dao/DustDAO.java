package com.sist.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.stereotype.Repository;


@Repository
@Scope("prototype")
public class DustDAO {
	@Autowired
	private DustParser dp;
	@Autowired
	private MongoTemplate mt;
	
	public void dustInsert(DustVO vo)
	{
		mt.getCollection("dust").drop();
		mt.createCollection("dust");
		List<DustVO> list=dp.dustAllData();
		for(DustVO vo1:list)
		{
			mt.insert(vo1,"dust");
		}
		
		//mt.insert(vo,"dust");
	}
	public DustVO guDustData(String guname)
	{
		DustVO vo = new DustVO();
		
		BasicQuery query = new BasicQuery("{loc:'"+guname+"'}");
		vo = mt.findOne(query, DustVO.class,"dust");
		System.out.println("여기까진 잘 됬니?");
		System.out.println("vo의 값:"+vo.getCoValue()+","+vo.getNo2Value()+","+vo.getO3Value()+","+vo.getPm10Grade()+","+vo.getPm10Value());
		return vo;
	}
	public String mentMaker(int grade)
	{
		String result = "";
		
		if(grade == 1)
		{
			result = "지금은 맑음이에요~ 너무너무 좋아요 밖으로 뛰어나가요~";
		}
		else if(grade ==2)
		{
			result="지금은 보통이에요~ 마스크만 끼고 밖으로 나가요~";
		}
		else if(grade ==3)
		{
			result="지금은 나쁨이에요~ 마스크를 끼고 집에 있어야해요~";
		}
		else if(grade ==4)
		{
			result="지금은 나쁨 OF 나쁨! 매우 나쁨이에요~ 산소 호흡기가 필요해요~";
		}
		
		return result;
	}
}





