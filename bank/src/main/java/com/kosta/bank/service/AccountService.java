package com.kosta.bank.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosta.bank.dto.Account;

@Service
public interface AccountService {
	void makeAccount(Account acc)throws Exception;
	Account deposit(String id, Integer money)throws Exception;
	Account withdraw(String id, Integer money) throws Exception;
	Account accountInfo(String id)throws Exception;
	List<Account> allAccountInfo() throws Exception;
	Account transfer(String sid, String rid, Integer money) throws Exception;
	boolean checkAccountId(String id) throws Exception;
	
}
