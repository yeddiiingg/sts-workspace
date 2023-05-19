package sec01.ex01;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 쇼핑몰 : 상품관리, 상품검색, 관리페이지. 

public class FirstServlet extends HttpServlet{
	// 서블릿의 생명주기 : init(), doXXX(), destroy()
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet 메서드 호출");
	}

	@Override
	public void destroy() {
		System.out.println("destroy 메서드 호출");
	}

	@Override
	public void init() throws ServletException {
		System.out.println("init 메서드 호출");
	}
	
}
