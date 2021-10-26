package com.tripdiary.vo;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class WriteCmd {
	private int board_num;
	private int member_num;
	private String place;
	private String content;
	private Timestamp regdate;
	private int year;
	private int month;
	private int day;
	private int td_like_cnt;
	
	public WriteCmd() {
		// TODO Auto-generated constructor stub
	}

	public WriteCmd(int board_num, int member_num, String place, String content, Timestamp regdate, int year, int month,
			int day, int td_like_cnt) {
		super();
		this.board_num = board_num;
		this.member_num = member_num;
		this.place = place;
		this.content = content;
		this.regdate = regdate;
		this.year = year;
		this.month = month;
		this.day = day;
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

	public int getTd_like_cnt() {
		return td_like_cnt;
	}

	public void setTd_like_cnt(int td_like_cnt) {
		this.td_like_cnt = td_like_cnt;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}
	
	
	
	
}
