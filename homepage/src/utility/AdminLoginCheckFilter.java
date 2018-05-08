package utility;

import java.io.IOException;
 
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
 
public class AdminLoginCheckFilter implements Filter {
	//상속은 오버라이딩을 원하는 것만 할 수 있으나 구현 객체는 인터페이스는 모두 오버라이딩 해야한다.
    public void init(FilterConfig arg0) throws ServletException {
    }
    //요청과 응답 중간에 호출되는 doFilter메소드
    public void doFilter(ServletRequest request, ServletResponse response, 
            FilterChain chain)
    throws IOException, ServletException {
        
        // Filter가 요청 중간에서 request 객체를 추출합니다.
        HttpServletRequest httpRequest = (HttpServletRequest)request;
 
        // 새로운 세션을 생성하지않고 request 객체에서 기존의 세션 반환
        HttpSession session = httpRequest.getSession(false);
        
        // 로그인 하지 않았다고 가정
        boolean login = false;
        
        if (session != null) { // session 객체가 생성되어 있는지 확인
            // 로그인을 했으면서 관리자인지 확인합니다.
            if (session.getAttribute("id") != null 
                    && session.getAttribute("grade").equals("A")) {
                login = true;  // 관리자라면
            }
        }
        
        // 정상적으로 로그인이 되었다면 요청 페이지로 이동합니다.
        if (login) {
            chain.doFilter(request, response); //요청 페이지로 이동시킴
        } else {
            // 로그인이 안되었다면 로그인 페이지로 이동
        	// forward와 같은 기능임(servlet의 forward)->요청과 응답을 loginform까지 가져갈 수 있다.
        	// MVC에서 계속 나올것. 반드시 외우기
            RequestDispatcher dispatcher = 
                request.getRequestDispatcher("/member/loginForm.jsp");
            dispatcher.forward(request, response);
        }
    }
 
    public void destroy() {
    }
}