package kh.bookday.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginValidator implements HandlerInterceptor {
	
	@Autowired
	private HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("인터셉터 동작 확인");

		String loginID = (String)session.getAttribute("loginID");
		if(loginID != null) return true;
		
		response.sendRedirect("error");
		return false;
		
	}

}
