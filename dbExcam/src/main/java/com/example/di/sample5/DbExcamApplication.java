package com.example.di.sample5;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@SpringBootApplication
public class DbExcamApplication {

	public static void main(String[] args) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans5.xml");
		Account acc = context.getBean("Account", Account.class);
		acc.info();
	}
}

// °èÁÂ¹øÈ£ 1001, ÀÌ¸§: È«±æµ¿, ÀÜ¾×: 100000
