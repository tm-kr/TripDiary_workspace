package com.tripdiary.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tripdiary.service.WriteService;
import com.tripdiary.vo.WriteCmd;


@Controller
public class WriteController {
	
	private WriteService writeService;
	
	@Autowired
	public WriteController(WriteService writeService) {
		this.writeService = writeService;
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeForm() {
		return "/write";
	}
	
    @RequestMapping(value="/write", method=RequestMethod.POST) 
    public String write(WriteCmd writeCmd, MultipartHttpServletRequest mpRequest, HttpSession session) throws Exception {
    	writeService.write(writeCmd, mpRequest);
    	
       return "/write";
    }
    
}
