package com.site.ex;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@EnableAspectJAutoProxy
@SpringBootApplication
public class S1109Application {

	public static void main(String[] args) {
		SpringApplication.run(S1109Application.class, args);
	}

}
