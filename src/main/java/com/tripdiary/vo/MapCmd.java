package com.tripdiary.vo;

public class MapCmd {
	private int memberNum;
	private double markerLng;
	private double markerLat;
	
	public MapCmd() {
		// TODO Auto-generated constructor stub
	}
	
	public MapCmd(int memberNum, double markerLng, double markerLat) {
		super();
		this.memberNum = memberNum;
		this.markerLng = markerLng;
		this.markerLat = markerLat;
	}

	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public double getMarkerLng() {
		return markerLng;
	}
	public void setMarkerLng(double markerLng) {
		this.markerLng = markerLng;
	}
	public double getMarkerLat() {
		return markerLat;
	}
	public void setMarkerLat(double markerLat) {
		this.markerLat = markerLat;
	}
	
	
	
}
