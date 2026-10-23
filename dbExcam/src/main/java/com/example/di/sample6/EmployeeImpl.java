package com.example.di.sample6;

public class EmployeeImpl implements Employee{
	private String num;
	private String name;
	private Department department;
	
	
	
	public EmployeeImpl(String num, String name, Department department) {
		super();
		this.num = num;
		this.name = name;
		this.department = department;
	}



	@Override
	public void info() {
		System.out.println(String.format("사번: %s, 사원명: %s, 부서명: %s, 부서위치: %s", num, name, department.getName(), department.getLoc()));
		
	}

	
}
