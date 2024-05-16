package com.ohgiraffers.dosirak.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        // 상품 이미지 경로 추가
        registry.addResourceHandler("/product/**")
                .addResourceLocations("file:///C:/Dosirak/original/productUpload/");

        // 고객 파일 경로 추가
        registry.addResourceHandler("/customer/**")
                .addResourceLocations("file:///C:/Dosirak/original/customer/");

        // 리뷰 파일 경로 추가
        registry.addResourceHandler("/review/**")
                .addResourceLocations("file:///C:/Dosirak/original/review/");

    }


}
