package kr.co.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class TestAdvice {
	// @Around 일때 반드시 Object 파라미타는 반드시 ProceedingJoinPoint 반드시 throws Throwable 날려줌
	@Around("execution(* kr.co.service.TestService*.*(..))")
	public Object startLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("before");
		long t1 = System.currentTimeMillis();
		
		Object result = pjp.proceed();
		
		long t2 = System.currentTimeMillis();
		
		System.out.println(t2-t1);
		System.out.println("after");
		return result;
		
		
	}

}
