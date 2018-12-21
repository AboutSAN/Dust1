package com.sist.twitter;

import twitter4j.StallWarning;
import twitter4j.Status;
import twitter4j.StatusDeletionNotice;
import twitter4j.StatusListener;

public class TwitterManager implements StatusListener{

	@Override
	public void onException(Exception e) {
		// TODO Auto-generated method stub
		e.printStackTrace();
	}

	@Override
	public void onDeletionNotice(StatusDeletionNotice arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onScrubGeo(long arg0, long arg1) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onStallWarning(StallWarning arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	//정상 수행했을 때
	public void onStatus(Status status) {
		// TODO Auto-generated method stub
		System.out.println("@"+status.getUser().getScreenName()+"\n"
								+status.getText());
		//status.getCreatedAt() 언제 만든지
		//status.getFavoriteCount() 좋아요 개수
	}

	@Override
	public void onTrackLimitationNotice(int arg0) {
		// TODO Auto-generated method stub
		
	}
	
}
