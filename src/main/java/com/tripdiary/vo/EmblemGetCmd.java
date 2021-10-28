package com.tripdiary.vo;

public class EmblemGetCmd {
	private int emblemNum;
	private int memberNum;
	
	public EmblemGetCmd() {
		// TODO Auto-generated constructor stub
	}

	public EmblemGetCmd(int emblemNum, int memberNum) {
		super();
		this.emblemNum = emblemNum;
		this.memberNum = memberNum;
	}

	public int getEmblemNum() {
		return emblemNum;
	}

	public void setEmblemNum(int emblemNum) {
		this.emblemNum = emblemNum;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	
}
