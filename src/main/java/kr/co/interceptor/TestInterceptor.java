package kr.co.interceptor;

import java.lang.reflect.Method;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class TestInterceptor extends HandlerInterceptorAdapter{
	//컨트롤러 작동전 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("preHandle");
		HandlerMethod method = (HandlerMethod)handler;
		Method methodObj = method.getMethod();
		System.out.println(methodObj);
		System.out.println(method.getBean());
		
		return true;
	}
	//컨트롤러 작동후 실행
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(" post");
		
		Map<String, Object> map = modelAndView.getModel();
		Object obj = map.get("hello"); //컨트롤러에서 헬로우로 저장된 hi가 들어감
		System.out.println(obj); //하이를 호출
		
		if (obj != null) {
			HttpSession session = request.getSession();
			session.setAttribute("go", obj); //go를 입력하면 obj에 있는 hi 가 호출됨
			response.sendRedirect("/board/list");
			
			
		}
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
	

}
