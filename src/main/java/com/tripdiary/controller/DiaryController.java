package com.tripdiary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tripdiary.service.DiaryService;
import com.tripdiary.util.PageCalc;
import com.tripdiary.vo.GetEmblemCmd;
import com.tripdiary.vo.PageVO;

@Controller
public class DiaryController {
	
	private DiaryService diaryService;
	private PageCalc pageCalc;
	private PageVO pageVO;
	
	@Autowired
	public DiaryController(DiaryService diaryService, PageCalc pageCalc, PageVO pageVO) {
		this.diaryService = diaryService;
		this.pageCalc = pageCalc;
	    this.pageVO = pageVO;
	}

	
	@RequestMapping(value = "/diary", method = RequestMethod.GET)
	public String diary(Model model, int memberNum, String pageNum) throws Exception {
		int currentPage = 1;
		int articleCount = diaryService.getArticleCount(memberNum);
		if (pageNum != null) {
	         currentPage = Integer.parseInt(pageNum);
	    }
	    pageVO = pageCalc.pageCalc(currentPage, articleCount);
	    pageVO.setMemberNum(memberNum);
		
		model.addAttribute("diaryBoardList", diaryService.getBoardList(pageVO));
		model.addAttribute("page",pageVO);
		model.addAttribute("mapCmd", diaryService.getMap(memberNum));
		model.addAttribute("calendar", diaryService.getDate(memberNum));
		model.addAttribute("profile", diaryService.getProfile(memberNum));
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
    	// 상태메세지가 비어있다면 반환
    	if(message.equals("")) {
    		model.addAttribute("msg", "상태메세지를 입력해주세요!");
    		model.addAttribute("url", "/diary?memberNum=");
    		return "/return/diaryAlert";
    	}
		diaryService.profileUpdate(mpRequest, memberNum, message);
		model.addAttribute("url", "/diary?memberNum=");
		return "/return/forward";
	}
	
	
}
