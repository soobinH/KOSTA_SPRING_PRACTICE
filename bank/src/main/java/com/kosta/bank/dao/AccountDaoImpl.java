package com.kosta.bank.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kosta.bank.dto.Account;

public class AccountDaoImpl implements AccountDao {
	
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertAccount(Account acc) throws Exception {
		sqlSession.insert("mapper.account.insertAccount",acc);

	}

	@Override
	public void updateAccount(Account acc) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Account selectAccount(String id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.account.selectAccount", id);
	}

	@Override
	public List<Account> selectAccountList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Account transfer(String sid, String rid, Integer money) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
