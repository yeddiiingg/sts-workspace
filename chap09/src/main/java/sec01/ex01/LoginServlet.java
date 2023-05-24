package sec01.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; //ㅎ로호허ㅗ호

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setContentType("text/html; charset=euc-kr");
		PrintWriter out = resp.getWriter();
		String uid = req.getParameter("u_id");
		String upw = req.getParameter("u_pw");
		// hidden 속성으로 전송된 값을 가지고옴
		String uadd = req.getParameter("u_add");
		String ugen = req.getParameter("u_gen");
		
		String data = "아이디 : "+uid;
		data += "<br>";
		data += "패스워드 : "+upw;
		data += "<br>";
		data += "주소 : "+uadd;
		data += "<br>";
		data += "성별 : "+ugen;
		out.print(data);
	}
}
