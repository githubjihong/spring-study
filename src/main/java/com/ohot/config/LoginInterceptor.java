package com.ohot.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//인증정보 가져오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		//인증 정보가 없는 경우이거나 anoymouseUser 인경우 로그인 화면으로 이동
        if (auth == null || !auth.isAuthenticated() || auth instanceof AnonymousAuthenticationToken) {
        	
        	String loginUrl = request.getContextPath() + "/login";
        	response.sendRedirect(loginUrl);
            
        	return false;
        }
        
        return true;
	}
}
