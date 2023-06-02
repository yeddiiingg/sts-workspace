package sec01.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ajax1")
public class AjaxTest1 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String result = "";
		result = "<main><coalra>"+"<name>코알라</name>"
				+"<info1>여기도 쿨쿨, 저기도 쿨쿨.아침이 되었는데도, 코알라들은 아직도 자고 있네요.</info1>"
				+"<info2>이제 슬슬 일어나 볼까?</info2>"
				+"<img>http://localhost:8090/chap16/images/coalra.png</img>"
				+"</coalra></main>";
		
		System.out.println(result);
		
		out.print(result);

	}
}
