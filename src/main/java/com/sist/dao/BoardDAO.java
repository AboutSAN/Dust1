package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import java.text.SimpleDateFormat;
import java.util.*;
@Repository
public class BoardDAO {
   @Autowired
   private MongoTemplate mt;
   public List<BoardVO> boardListData(int page)
   {
	   List<BoardVO> list=new ArrayList<BoardVO>();
	   Query query=new Query();// {} ,{} ,{} ==> 조건 (WHERE)
	   int rowSize=10;
	   int skip=(rowSize*page)-rowSize; 
	   /*
	    *   0
	    *   -
	    *   -
	    *   9
	    *   10
	    *   -
	    *   -
	    *   19
	    */
	   query.skip(skip).limit(rowSize);
	   query.with(new Sort(Sort.Direction.DESC,"no"));
	   // order by
	   list=mt.find(query, BoardVO.class,"board");
	   return list;
   }
   
   public void boardInsert(BoardVO vo)
   {
	   Query query=new Query();
	   //////////////////////////////////////////////////////////////////
	   query.with(new Sort(Sort.Direction.DESC,"no"));
	   BoardVO fvo=mt.findOne(query, BoardVO.class,"board");
	   ////////////////// SELECT MAX(no) FROM board
	   String regdate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	   if(fvo!=null)
	   {
	     vo.setNo(fvo.getNo()+1);
	   }
	   else
	   {
		   vo.setNo(1);
	   }
	   vo.setRegdate(regdate);
	   vo.setHit(0);
	   // 몽고디비에 추가 
	   mt.insert(vo,"board");
	   
   }
   public BoardVO boardDetailData(int no)
   {
	   BoardVO vo=new BoardVO();
	   BasicQuery query=new BasicQuery("{no:"+no+"}");
	   vo=mt.findOne(query, BoardVO.class,"board");
	   ////////////////////////////////////////////////////////
	   Update update=new Update();
	   update.set("hit", vo.getHit()+1);
	   mt.updateFirst(query, update,"board");
	   
	   vo=mt.findOne(query, BoardVO.class,"board");
	   ////////////////////////////////////////////////////////조회수 증가 
	   return vo;
   }
   
   // 총페이지 
   public int boardTotalPage()
   {
	    Query query=new Query();
	    // 테이블에서 총갯수 얻기 
	    int count=(int)mt.count(query, "board");
	    System.out.println("count="+count);
	    int total=(int)(Math.ceil(count/10.0));
	    System.out.println("total="+total);
	    return total;
   }
   public BoardVO boardUpdateData(int no)
   {
	   BoardVO vo=new BoardVO();
	   BasicQuery query=new BasicQuery("{no:"+no+"}");
	   vo=mt.findOne(query, BoardVO.class,"board");
	   return vo;
   }
   
   public boolean boardUpdateOk(BoardVO vo)
   {
	   boolean bCheck=false;
	   BasicQuery query=new BasicQuery("{no:"+vo.getNo()+"}");
	   BoardVO fvo=mt.findOne(query, BoardVO.class,"board");
	   if(fvo.getPwd().equals(vo.getPwd()))
	   {
		   bCheck=true;
		   // 수정 
		   Update update=new Update();
		   update.set("name", vo.getName());
		   update.set("subject", vo.getSubject());
		   update.set("content", vo.getContent());
		   mt.updateFirst(query, update, "board");
	   }
	   return bCheck;
   }
   
   public boolean boardDeleteOk(int no,String pwd)
   {
	   boolean bCheck=false;
	   BasicQuery query=new BasicQuery("{no:"+no+"}");
	   BoardVO fvo=mt.findOne(query, BoardVO.class,"board");
	   if(fvo.getPwd().equals(pwd))
	   {
		   bCheck=true;
		   mt.remove(query, "board");
	   }
	   return bCheck;
   }
}










