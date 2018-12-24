package com.sist.tour;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public class TourDAO {
	@Autowired
	private TourParse dp;
	@Autowired
	private MongoTemplate mt;
		public void TourParseInsert(TourVO vo)
	{
			mt.insert(vo,"tour");
	}
	public void DetailParseInsert(TourVO vo)
	{
			mt.insert(vo,"detail");
	}

}
