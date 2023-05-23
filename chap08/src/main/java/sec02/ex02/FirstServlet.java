package sec02.ex02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/disfirst")
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html; charset=euc-kr");
		request.setCharacterEncoding("euc-kr");
		// request객체에 address의 값으로 value 바인딩
		// redirect 방식으로는 서블릿에서 바인딩한 데이터를 다른 서블릿으로 전송 불가능..
		request.setAttribute("address", "서울시 관악구");
		
		// 두번째 서블릿에 디스패치 이용해서 데이터 전송.
		RequestDispatcher dispatch = request.getRequestDispatcher("bindsecond");
		dispatch.forward(request, response);
	}
}
