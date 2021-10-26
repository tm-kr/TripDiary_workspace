package com.tripdiary.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tripdiary.vo.BoardVo;


@Controller
public class WriteController {
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeForm() {
		return "/write";
	}
	
    @RequestMapping(value="/write", method=RequestMethod.POST) 
    public String write(BoardVo boardVo, MultipartHttpServletRequest mpRequest, HttpSession session) throws Exception {
    	System.out.println(boardVo.getPlace());
    	System.out.println(boardVo.getMember_num());
    	System.out.println((Integer)session.getAttribute("member_num"));
       return "/write";
    }
    
}
