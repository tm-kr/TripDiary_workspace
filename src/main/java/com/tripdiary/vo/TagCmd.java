package com.tripdiary.vo;

import java.util.List;

import org.springframework.stereotype.Component;

public class TagCmd {
	private List<String> tag;
	private int board_num;
	
	public TagCmd() {
		// TODO Auto-generated constructor stub
	}

	public TagCmd(List<String> tag, int board_num) {
		super();
		this.tag = tag;
		this.board_num = board_num;
	}

	public List<String> getTag() {
		return tag;
	}

	public void setTag(List<String> tag) {
		this.tag = tag;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	
	
	
}
