package com.site.ex.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class FileFolder_config implements WebMvcConfigurer {
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		//url /images/하위메뉴는 모두 c:/fileSave로 연결
		registry.addResourceHandler("/images/**").addResourceLocations("file:///c:/fileSave/");
	}
	

}
