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
			model.addAttribute("msg", "�α��� �� �̿����ּ���.");
			model.addAttribute("url", "/signIn");
			return "/return/alert";
		}
		return "/write";
	}
	
    @RequestMapping(value="/write", method=RequestMethod.POST) 
    public String write(MultipartHttpServletRequest mpRequest, WriteCmd writeCmd,TagCmd tagCmd, Model model) throws Exception {
    	//��ǥ ������ ���ٸ� ���û
    	if(mpRequest.getFile("thumbnail").getOriginalFilename().equals("")) {
    		model.addAttribute("msg", "��ǥ ������ ������ּ���.");
    		return "/return/historyback";
    	}
    	writeService.write(writeCmd,tagCmd, mpRequest);
    	model.addAttribute("msg", "���ο� �ϱ⸦ �ۼ��Ͽ����ϴ�.");
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
    	model.addAttribute("msg", "�ϱ⸦ �����Ͽ����ϴ�.");
		model.addAttribute("url", "/diary?memberNum=");
		return "/return/writeAlert";
    }
    
}
