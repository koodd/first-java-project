package com.site.ex.aop;

import java.io.PrintWriter;
import java.net.http.HttpResponse;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.bridge.MessageUtil;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.client.HttpStatusCodeException;

@Component
@Aspect
public class LogAspect {
	
	 @Autowired
	 HttpServletResponse response;
	 
	 @Autowired
	 HttpServletRequest request;
	 
	 @Autowired
	 HttpSession session;

	 Logger logger =  LoggerFactory.getLogger(LogAspect.class);
	    
	    //BookService의 모든 메서드 - Around는 시작전과 완료후 2번 실행
	    @Around("execution(* com.site.ex.service.BoardService.*(..))")
	    public Object logging(ProceedingJoinPoint joinPoint) throws Throwable {
	        System.out.println("session : "+session.getAttribute("session_id"));
	    	logger.info("start - " + joinPoint.getSignature().getDeclaringTypeName() + " / " + joinPoint.getSignature().getName());
	        Object result = joinPoint.proceed();
	        logger.info("finished - " + joinPoint.getSignature().getDeclaringTypeName() + " / " + joinPoint.getSignature().getName());
	        return result;
	    }
	    
	    //session정보가 없을때 login페이지로 이동
	    @Before("execution(* com.site.ex.service.EventService.*(..))")
	    public void sessionCheck(JoinPoint joinPoint) throws Throwable {
	    	System.out.println("sessionCheck : "+session.getAttribute("session_id"));
	    	Object result = ((ProceedingJoinPoint) joinPoint).proceed();
	    	if ((String) session.getAttribute("session_id") == null) {
	    		 //return "redirect:/member/login";
	    		response.setCharacterEncoding("UTF-8");
	    		response.setContentType("text/html; charset=UTF-8");
	    		PrintWriter writer;
				writer = response.getWriter();
				writer.print("<script>");
				writer.print("alert('로그인을 하셔야 접근이 가능합니다.');");
				writer.print("location.href='/member/login';");
				writer.print("</script>");
				writer.close();
	    		// 에러를 리턴할때 사용
	    		//throw new HttpStatusCodeException(HttpStatus.UNAUTHORIZED, "NO_LOGIN") {};
	        }
	    }
}
