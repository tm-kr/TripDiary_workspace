package com.tripdiary.vo;

public class BoardListVO {
	private String tripdate;
	private int tdLikeCnt;
	private String boardFileName;
	private String nickname;
	private String profileFileName;
	
	public BoardListVO() {
		// TODO Auto-generated constructor stub
	}

	public BoardListVO(String tripdate, int tdLikeCnt, String boardFileName, String nickname, String profileFileName) {
		super();
		this.tripdate = tripdate;
		this.tdLikeCnt = tdLikeCnt;
		this.boardFileName = boardFileName;
		this.nickname = nickname;
		this.profileFileName = profileFileName;
	}

	public String getTripdate() {
		return tripdate;
	}

	public void setTripdate(String tripdate) {
		this.tripdate = tripdate;
	}

	public int getTdLikeCnt() {
		return tdLikeCnt;
	}

	public void setTdLikeCnt(int tdLikeCnt) {
		this.tdLikeCnt = tdLikeCnt;
	}

	public String getBoardFileName() {
		return boardFileName;
	}

	public void setBoardFileName(String boardFileName) {
		this.boardFileName = boardFileName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfileFileName() {
		return profileFileName;
	}

	public void setProfileFileName(String profileFileName) {
		this.profileFileName = profileFileName;
	}
	
}
