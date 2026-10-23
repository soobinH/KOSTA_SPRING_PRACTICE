package com.kosta.bank.dto;

import com.kosta.bank.exc.BankException;
import com.kosta.bank.exc.ERR_CODE;

public class Account {
	String id;
	String name;
	String type;
	Integer balance;
	String grade;
	
	public Account() {
		
	}
	
	public Account(String id, String name, int balance, String type, String grade) {
		this.id = id;
		this.name = name;
		this.balance = balance;
		this.type= type;
		this.grade = grade;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Integer getBalance() {
		return balance;
	}
	
	public void setBalance(Integer balance) {
		this.balance = balance;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public void deposit(Integer money)throws BankException{
		if(money <= 0) throw new BankException(ERR_CODE.DEPOSIT);
		balance += money;
	}
	
	public void withdraw(Integer money) throws BankException {
		if(balance < money) throw new BankException(ERR_CODE.WITHDRAW);
		balance -= money; 
	}
	
	public void transfer(int money) {
		balance += money;
	}
	
	@Override
	public String toString() {
		return String.format("怨꾩쥖踰덊샇: %s, �씠由�: %s, �옍�븸: %d, ���엯: %s, �벑湲�: %s", id, name, balance, type, grade);
	}

	
}
