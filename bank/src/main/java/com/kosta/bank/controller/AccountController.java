package com.kosta.bank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.bank.dto.Account;
import com.kosta.bank.service.AccountService;

@Controller
public class AccountController {
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value="/makeAccount", method=RequestMethod.GET)
	public String makeAccount() {
		return "makeaccount";
	}
	
	@RequestMapping(value="/makeAccount", method=RequestMethod.POST)
	public ModelAndView makeAccount(Account acc) {
		ModelAndView mav = new ModelAndView();
		try {
			accountService.makeAccount(acc);
			mav.addObject("acc",acc);
			mav.setViewName("accountInfo");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("error");
		}
		
		return mav;
	}

}
