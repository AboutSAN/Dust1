package com.sist.twitter;

import twitter4j.FilterQuery;
import twitter4j.TwitterStream;
import twitter4j.TwitterStreamFactory;

public class TwitterMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TwitterStream ts = new TwitterStreamFactory().getInstance();
		TwitterManager tm = new TwitterManager();
		ts.addListener(tm);
		String[] names = {"미세먼지"};
		FilterQuery fq = new FilterQuery();
		fq.track(names);
		ts.filter(fq);
	}

}
