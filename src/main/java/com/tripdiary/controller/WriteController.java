package com.tripdiary.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tripdiary.service.WriteService;
import com.tripdiary.vo.MapCmd;
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
    public String write(WriteCmd writeCmd,TagCmd tagCmd, MapCmd mapCmd, Model model, MultipartHttpServletRequest mpRequest) throws Exception {
    	System.out.println(mapCmd.getMemberNum());
    	//대표 사진이 없다면 재요청
    	if(mpRequest.getFile("thumbnail").getOriginalFilename().equals("")) {
    		model.addAttribute("msg", "대표 사진을 등록해주세요.");
    		return "/return/historyback";
    	}
    	writeService.write(writeCmd,tagCmd,mapCmd, mpRequest);
    	model.addAttribute("msg", "새로운 일기를 작성하였습니다.");
		model.addAttribute("url", "/diary?memberNum=");
		return "/return/diaryAlert";
    }
    
	@RequestMapping(value = "/writeUpdate", method = RequestMethod.GET)
	public String writeUpdate(HttpSession session,Model model, int boardNum) {
		WriteCmd board = writeService.getBoard(boardNum);
		int memberNum = (int) session.getAttribute("memberNum");
		
		//작성자인지 검사
    	if(memberNum != board.getMemberNum()) {
    		model.addAttribute("msg", "작성자만 수정이 가능합니다.");
    		return "/return/historyback";
    	}
		
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", board);
		model.addAttribute("tag", writeService.getTag(boardNum));
		return "/writeUpdate";
	}
	
    @RequestMapping(value="/writeUpdate", method=RequestMethod.POST) 
    public String writeUpdate(MultipartHttpServletRequest mpRequest, WriteCmd writeCmd,TagCmd tagCmd, Model model) throws Exception {
    	writeService.writeUpdate(writeCmd,tagCmd, mpRequest);
    	model.addAttribute("msg", "일기를 수정하였습니다.");
		model.addAttribute("url", "/diary?memberNum=");
		return "/return/diaryAlert";
    }
    
}
