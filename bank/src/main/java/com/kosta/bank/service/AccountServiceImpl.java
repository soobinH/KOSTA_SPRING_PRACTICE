package com.kosta.bank.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosta.bank.dao.AccountDao;
import com.kosta.bank.dto.Account;
import com.kosta.bank.exc.BankException;
import com.kosta.bank.exc.ERR_CODE;

@Service
public class AccountServiceImpl implements AccountService {
	
	private AccountDao accountDao;

	
	
	public AccountServiceImpl(AccountDao accountDao) {
		super();
		this.accountDao = accountDao;
	}

	@Override
	public void makeAccount(Account acc) throws Exception {
		if(accountDao.selectAccount(acc.getId())!= null) throw new BankException(ERR_CODE.DOUBLEID); 
		accountDao.insertAccount(acc);

	}

	@Override
	public Account deposit(String id, Integer money) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Account withdraw(String id, Integer money) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Account accountInfo(String id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Account> allAccountInfo() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Account transfer(String sid, String rid, Integer money) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean checkAccountId(String id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
