package com.bestpricemarket.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bestpricemarket.domain.MemberVO;
import com.bestpricemarket.service.MemberService;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	//3-1. 서비스 처리 객체를 주입(DI)
	@Inject
	private MemberService service;
	
	private static final Logger l = LoggerFactory.getLogger(MemberController.class);
	
	/* 회원가입 처리하는 동작 */
	// http://localhost:8088/member/insert
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertGET() throws Exception {
		l.info("C: 회원가입 입력페이지 GET");
		return "/member/insertMember";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPOST(MemberVO vo) throws Exception{
				
		l.info("C: "+ vo);		
		service.insertMember(vo);		
		l.info("C: 회원가입 처리페이지 POST");		
		return "redirect:/member/login";
	}
	
	/* 로그인 기능 */
	// http://localhost:8088/member/login
	
	
}