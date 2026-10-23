package com.example.di.sample1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DbExcamApplication {

	public static void main(String[] args) {
		
		MessageBean bean = new MessageBean();
		bean.sayHello("Spring");
	}

}
