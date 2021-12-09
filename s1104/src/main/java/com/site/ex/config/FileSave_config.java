package com.site.ex.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class FileSave_config implements WebMvcConfigurer {
	
	@Override  // 특정 url로 들어오는 부분을  로컬드라이브로 연결해주는 메소드
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**").addResourceLocations("file:///c:/fileSave/");
		
	}

}
