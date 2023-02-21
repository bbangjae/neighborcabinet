package com.neighborCabinet.project;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// 프로젝트 외부 경로 접근 설정 
// 상품 이미지를 외부 폴더에 저장하고 출력하기 위해 필요
@Configuration
public class WebConfig implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///F:/neighborcabinet/neighborCabinet/uploads/",
				"file:////uploads/");
													// upload 폴더 경로 설정 (동일한 이름 /images 사용)
	}
}
