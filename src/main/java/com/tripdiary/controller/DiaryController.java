package com.tripdiary.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tripdiary.service.EmblemService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class DiaryController {
	
	private EmblemService emblemService;
	
	@Autowired
	public DiaryController(EmblemService emblemService) {
		this.emblemService = emblemService;
	}

	
	@RequestMapping(value = "/diary", method = RequestMethod.GET)
	public String diary(Model model, int memberNum) {
		emblemService.emblemGet(memberNum);
		model.addAttribute("memberNum", memberNum);
		model.addAttribute("emblem", emblemService.emblemSelect());
		model.addAttribute("actCnt", emblemService.getActCnt(memberNum));
		return "/diary";
	}
	
	@RequestMapping(value = "/getEmblem", method = RequestMethod.GET)
	public String getEmblem(HttpSession session, int emblemNum) {
		int memberNum = (int) session.getAttribute("memberNum");
		System.out.println(memberNum);
		return "/diary";
	}
	
	
}
