package com.example.di.sample3;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@SpringBootApplication
public class DbExcamApplication {

	public static void main(String[] args) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("beans3.xml");
		MessageBean bean = context.getBean("messageBean", MessageBean.class);
		bean.sayHello("½ºÇÁ¸µ");
	}
}
