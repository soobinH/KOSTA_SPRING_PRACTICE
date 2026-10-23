package com.example.di.sample6;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@SpringBootApplication
public class DbExcamApplication {

	public static void main(String[] args) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans6.xml");
		Employee emp = context.getBean("employee", Employee.class);
		emp.info();
	}
}

// 사번: 1001, 이름: 홍길동, 부서명: 영업부, 부서위치: 여의도
