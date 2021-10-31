package com.tripdiary.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tripdiary.service.WriteService;
import com.tripdiary.vo.TagCmd;
import com.tripdiary.vo.WriteCmd;


@Controller
public class WriteController {
	
	private WriteService writeService;
	
	@Autowired
	public WriteController(WriteService writeService) {
		this.writeService = writeService;
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeForm(HttpSession session, Model model) {
		if(session.getAttribute("id") == null) {
			model.addAttribute("msg", "로그인 후 이용해주세요.");
			model.addAttribute("url", "/signIn");
			return "/return/alert";
		}
		return "/write";
	}
	
    @RequestMapping(value="/write", method=RequestMethod.POST) 
    public String write(MultipartHttpServletRequest mpRequest, WriteCmd writeCmd,TagCmd tagCmd, Model model) throws Exception {
    	//대표 사진이 없다면 재요청
    	if(mpRequest.getFile("thumbnail").getOriginalFilename().equals("")) {
    		model.addAttribute("msg", "대표 사진을 등록해주세요.");
    		return "/return/historyback";
    	}
    	writeService.write(writeCmd,tagCmd, mpRequest);
    	model.addAttribute("msg", "새로운 일기를 작성하였습니다.");
		model.addAttribute("url", "/diary?memberNum=");
		return "/return/writeAlert";
    }
    
	@RequestMapping(value = "/writeUpdate", method = RequestMethod.GET)
	public String writeUpdate(Model model, int boardNum) {
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", writeService.getBoard(boardNum));
		model.addAttribute("tag", writeService.getTag(boardNum));
		return "/writeUpdate";
	}
	
    @RequestMapping(value="/writeUpdate", method=RequestMethod.POST) 
    public String writeUpdate(MultipartHttpServletRequest mpRequest, WriteCmd writeCmd,TagCmd tagCmd, Model model) throws Exception {
    	writeService.writeUpdate(writeCmd,tagCmd, mpRequest);
    	model.addAttribute("msg", "일기를 수정하였습니다.");
		model.addAttribute("url", "/diary?memberNum=");
		return "/return/writeAlert";
    }
    
}
