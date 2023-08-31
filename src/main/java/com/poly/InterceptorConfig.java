package com.poly;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.poly.interceptor.GloballInterceptor;

public class InterceptorConfig implements WebMvcConfigurer {
	@Autowired
	GloballInterceptor globallnterceptor;
//	
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(globallnterceptor)
//		.addPathPatterns("/**")
//		.excludePathPatterns("/rest/**","/admin/**");
//	}

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**");
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(globallnterceptor).addPathPatterns("/**").excludePathPatterns("/rest/**", "/admin/**",
				"/assets/**", "/assetss/**");
	}

}
