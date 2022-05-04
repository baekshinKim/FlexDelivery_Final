package com.project.fd.admin.weather.model;

public class AdminWeatherVO {
	private int weatherNo;
	private String weatherName;
	
	public int getWeatherNo() {
		return weatherNo;
	}
	public void setWeatherNo(int weatherNo) {
		this.weatherNo = weatherNo;
	}
	public String getWeatherName() {
		return weatherName;
	}
	public void setWeatherName(String weatherName) {
		this.weatherName = weatherName;
	}
	
	@Override
	public String toString() {
		return "WeatherVO [weatherNo=" + weatherNo + ", weatherName=" + weatherName + "]";
	}
	
	
}
