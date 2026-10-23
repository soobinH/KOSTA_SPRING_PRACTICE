package com.kosta.bank.dao;

import java.util.List;

import com.kosta.bank.dto.Account;

public interface AccountDao {
	void insertAccount(Account acc) throws Exception;
	void updateAccount(Account acc) throws Exception;
	Account selectAccount(String id)throws Exception;
	List<Account> selectAccountList() throws Exception;
	Account transfer(String sid, String rid, Integer money) throws Exception;

}
