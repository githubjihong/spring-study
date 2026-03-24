package com.ohot.config;

import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Bean
    public LocaleResolver localeResolver() {
        SessionLocaleResolver resolver = new SessionLocaleResolver();
        resolver.setDefaultLocale(Locale.KOREA); // 기본 로케일
        return resolver;
    }

    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
        interceptor.setParamName("lang"); // ex: ?lang=en
        return interceptor;
    }
    
    
    /* LoginInterceptor 설정 */
    @Bean
    public LoginInterceptor loginInterceptor() {
    	return new LoginInterceptor();
    }
    
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(localeChangeInterceptor());
        
        /*
        registry.addInterceptor(loginInterceptor())
        		.addPathPatterns("/shop/**")
        		.excludePathPatterns(
        				  "/shop/*.css"
        				, "/shop/*.js"
        				, "/shop/home"
        				, "/shop/*Ajax"
        		);
        */
        
        
    }
}
