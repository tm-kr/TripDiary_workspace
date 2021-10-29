package com.tripdiary.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tripdiary.service.DiaryService;
import com.tripdiary.vo.GetEmblem;

@Controller
public class DiaryController {
	
	private DiaryService emblemService;
	
	@Autowired
	public DiaryController(DiaryService emblemService) {
		this.emblemService = emblemService;
	}

	
	@RequestMapping(value = "/diary", method = RequestMethod.GET)
	public String diary(Model model, int memberNum) {
		// ���߿� memblemNum ���� ������ ���� cmd �� �����ٸ� ����� ��� jsp �����ϱ�!
		
/*		[
	  	    {
	  	      title  : test,
	  	      start  : '20211003'
	  	    },
	  	 	 {
	  	      title  : '������',
	  	      start  : '2021-10-12'
	  	    },
	  	  ]*/
		String calendar = "["
				+ "{ "
				+ "title : '������',"
				+ " start : '20211006'"
				+ " }"
				+ "]";
				
		
		model.addAttribute("calendar", calendar);
		model.addAttribute("memberNum", memberNum);
		model.addAttribute("haveEmblem", emblemService.haveEmblem(memberNum));
		model.addAttribute("emblem", emblemService.selectEmblem());
		model.addAttribute("actCnt", emblemService.getActCnt(memberNum));
		return "/diary";
	}
	
	
	@RequestMapping(value = "/getEmblem", method = RequestMethod.POST)
	public String getEmblem(GetEmblem getEmblem, Model model) {
		emblemService.getEmblem(getEmblem);
		model.addAttribute("url", "/diary?memberNum=");
		return "/return/forward";
	}
	
	
}
