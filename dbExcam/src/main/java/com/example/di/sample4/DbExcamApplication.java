package com.example.di.sample4;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@SpringBootApplication
public class DbExcamApplication {

	public static void main(String[] args) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans4.xml");
		MessageBean bean = context.getBean("messageBean", MessageBean.class);
		bean.sayHello();
	}
}
