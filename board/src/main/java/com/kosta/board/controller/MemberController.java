package com.kosta.board.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.board.dto.Member;
import com.kosta.board.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ServletContext servletContext;
	
	@GetMapping("/member/login")
	public String login(@CookieValue(name="autoLogin", required=false,defaultValue="" ) String autoLogin, 
			@CookieValue(name="id", required=false,defaultValue="" ) String id,
			@CookieValue(name="password", required=false,defaultValue="" ) String password,
			Model model) {
		model.addAttribute("autoLogin", autoLogin);
		model.addAttribute("id", id);
		model.addAttribute("password", password);
		return "member/login";
	}
	
	@PostMapping("/member/login")
	public String login(@RequestParam("id") String id, 
			@RequestParam("password") String password, 
			@RequestParam(name="autoLogin", required=false) String autoLogin,
			Model model,
			HttpServletResponse response) {
		try {
			Member member = memberService.login(id, password);
			session.setAttribute("user", member);
			
			// 자동 로그인 쿠키 작업
			Cookie autoCookie = null;
			Cookie idCookie = null;
			Cookie passwordCookie = null;
			
			if(autoLogin == null || autoLogin.isEmpty()) {
				autoCookie = new Cookie("autoLogin", "");
				idCookie = new Cookie("id", "");
				passwordCookie = new Cookie("password", "");
			} else {
				autoCookie = new Cookie("autoLogin", autoLogin);
				idCookie = new Cookie("id", id);
				passwordCookie = new Cookie("password", password);
			}
			
			autoCookie.setPath("/board");
			idCookie.setPath("/board");
			passwordCookie.setPath("/board");
			
			response.addCookie(autoCookie);
			response.addCookie(idCookie);
			response.addCookie(passwordCookie);
			
			return "redirect:/article/list";
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("err", e.getMessage());
			return "common/error";
		}
	}
	
	@GetMapping("/member/logout")
	public String logout() {
		session.removeAttribute("user");
		return "redirect:/member/login";
	}
	
	@GetMapping("/member/join")
	public String join() {
		return "member/join";
	}
	

	@PostMapping("/member/join")
	public String join(
	        Member member,
	        @RequestParam(name="profileFile", required=false)
	        MultipartFile profile,
	        Model model) {
	
	    System.out.println("1. 회원가입 Controller 진입");
	
	    try {
	        System.out.println("2. 회원가입 Service 호출");
	
	        memberService.join(member, profile);
	
	        System.out.println("3. 회원가입 성공");
	
	        return "redirect:/member/login";
	
	    } catch(Exception e) {
	        e.printStackTrace();
	
	        model.addAttribute("err", e.toString());
	
	        return "common/error";
	    }
	}

}
