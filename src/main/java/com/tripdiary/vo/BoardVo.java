package com.tripdiary.vo;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class BoardVo {
	private int board_num;
	private int member_num;
	private String place;
	private String content;
	private Timestamp regdate;
	private Date tripdate;
	private int td_like_cnt;
	
	public BoardVo() {
		// TODO Auto-generated constructor stub
	}
	
	public BoardVo(int board_num, int member_num, String place, String content, Timestamp regdate, Date tripdate,
			int td_like_cnt) {
		super();
		this.board_num = board_num;
		this.member_num = member_num;
		this.place = place;
		this.content = content;
		this.regdate = regdate;
		this.tripdate = tripdate;
		this.td_like_cnt = td_like_cnt;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Date getTripdate() {
		return tripdate;
	}

	public void setTripdate(Date tripdate) {
		this.tripdate = tripdate;
	}

	public int getTd_like_cnt() {
		return td_like_cnt;
	}

	public void setTd_like_cnt(int td_like_cnt) {
		this.td_like_cnt = td_like_cnt;
	}
	
	
	
	
}
