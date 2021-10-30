package com.tripdiary.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		return "main";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) {
		/*container.put("LNG", "126.974884");
		container.put("ADDRESS", "서울특별시 종로구 청운동 효자로 12");
		container.put("ID", "1234");
		container.put("LAT", "37.576693");
		container.put("NAME", "국립고궁박물관");*/
		return "main";
	}
	
	@RequestMapping(value = "/pick", method = RequestMethod.GET)
	public String pick() {
		return "pick";
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about() {
		return "about";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin() {
		return "admin";
	}
	
	@RequestMapping(value = "/signIn", method = RequestMethod.GET)
	public String signIn(HttpSession session) {
		session.setAttribute("id", "tester");
		session.setAttribute("memberNum", 10);
		return "signIn";
	}
	
	@RequestMapping(value = "/signOut", method = RequestMethod.GET)
	public String signOut(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String myPage() {
		return "myPage";
	}
}
