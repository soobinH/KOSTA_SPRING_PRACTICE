package com.example.di.sample5;

public class AccountImpl implements Account {
	private String id;
	private String name;
	private Integer balance;
	
	
	
	public AccountImpl(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public void setBalance(Integer balance) {
		this.balance = balance;
	}



	@Override
	public void info() {
		System.out.println("∞Ë¡Àπ¯»£: "+ id + " ¿Ã∏ß: " + name + " ¿‹æ◊: " + balance);

	}

}
