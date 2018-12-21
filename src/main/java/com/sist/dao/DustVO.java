package com.sist.dao;

public class DustVO {
	private String loc;
	private String coValue;
	private String o3Value;
	private String no2Value;
	private String pm10Value;
	private String pm10Grade;
	private String dataTime;

	public String getDataTime() {
		return dataTime;
	}
	public void setDataTime(String dataTime) {
		this.dataTime = dataTime;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getCoValue() {
		return coValue;
	}
	public void setCoValue(String coValue){
		this.coValue = coValue;
	}
	public String getO3Value() {
		return o3Value;
	}
	public void setO3Value(String o3Value) {
		this.o3Value = o3Value;
	}
	public String getNo2Value() {
		return no2Value;
	}
	public void setNo2Value(String no2Value) {
		this.no2Value = no2Value;
	}
	public String getPm10Value() {
		return pm10Value;
	}
	public void setPm10Value(String pm10Value) {
		this.pm10Value = pm10Value;
	}
	public String getPm10Grade() {
		return pm10Grade;
	}
	public void setPm10Grade(String pm10Grade) {
		this.pm10Grade = pm10Grade;
	}
	
	
}