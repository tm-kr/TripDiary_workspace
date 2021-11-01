package com.tripdiary.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tripdiary.service.DiaryService;
import com.tripdiary.vo.GetEmblemCmd;

@Controller
public class DiaryController {
	
	private DiaryService diaryService;
	
	@Autowired
	public DiaryController(DiaryService diaryService) {
		this.diaryService = diaryService;
	}

	
	@RequestMapping(value = "/diary", method = RequestMethod.GET)
	public String diary(Model model, int memberNum) {
		
		// ���߿� memblemNum ���� ������ �ٸ� cmd �� �����ٸ� ����� ��� jsp �����ϱ�!
		model.addAttribute("mapCmd", diaryService.getMap(memberNum));
		model.addAttribute("calendar", diaryService.getDate(memberNum));
		model.addAttribute("profile", diaryService.getProfile(memberNum));
		model.addAttribute("memberNum", memberNum);
		model.addAttribute("haveEmblem", diaryService.haveEmblem(memberNum));
		model.addAttribute("emblem", diaryService.selectEmblem());
		model.addAttribute("actCnt", diaryService.getActCnt(memberNum));
		return "/diary";
	}
	
	
	@RequestMapping(value = "/getEmblem", method = RequestMethod.POST)
	public String getEmblem(GetEmblemCmd getEmblem, Model model) {
		diaryService.getEmblem(getEmblem);
		model.addAttribute("url", "/diary?memberNum=");
		return "/return/forward";
	}
	
	@RequestMapping(value = "/profileUpdate", method = RequestMethod.POST)
	public String profileUpdate(MultipartHttpServletRequest mpRequest, Model model, int memberNum, String message) throws Exception {
		
    	// ���¸޼����� ����ִٸ� ��ȯ
    	if(message.equals("")) {
    		model.addAttribute("msg", "���¸޼����� �Է����ּ���!");
    		model.addAttribute("url", "/diary?memberNum=");
    		return "/return/diaryAlert";
    	}
		diaryService.profileUpdate(mpRequest, memberNum, message);
		
		model.addAttribute("url", "/diary?memberNum=");
		return "/return/forward";
	}
	
	
}
