package com.tripdiary.vo;

public class GetEmblem {
	private int memberNum;
	private int emblemNum;
	public GetEmblem() {
		// TODO Auto-generated constructor stub
	}
	public GetEmblem(int memberNum, int emblemNum) {
		super();
		this.memberNum = memberNum;
		this.emblemNum = emblemNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getEmblemNum() {
		return emblemNum;
	}
	public void setEmblemNum(int emblemNum) {
		this.emblemNum = emblemNum;
	}
	
	
}