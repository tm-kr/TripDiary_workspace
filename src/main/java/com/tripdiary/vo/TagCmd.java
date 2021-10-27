package com.tripdiary.vo;

import java.util.List;

import org.springframework.stereotype.Component;

public class TagCmd {
	private List<String> tag;
	
	public TagCmd() {
		// TODO Auto-generated constructor stub
	}
	
	public TagCmd(List<String> tag) {
		super();
		this.tag = tag;
	}

	public List<String> getTag() {
		return tag;
	}

	public void setTag(List<String> tag) {
		this.tag = tag;
	}
	
	
}
