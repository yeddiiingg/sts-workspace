package sec01.ex01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/gogodan")
public class gogodanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; //자바에서 서블릿을 순서대로 나열하기 위해


	public void init(ServletConfig config) throws ServletException {
		System.out.println("이닛이닛");
	}


	public void destroy() {
		System.out.println("뿌셔뿌셔");
	}

// HttpServletRequest request : 웹 브라우저에서 전송한 정보를 톰캣에 넘겨주는 역할
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");  //1
		// 요청에대한 응답에 써내려갈 내용을 담는 객체 생성
		PrintWriter output = response.getWriter(); //2
		
//		String user_dan = request.getParameter("user_dan");
//		int num = Integer.parseInt(user_dan);
		
		int num = Integer.parseInt(request.getParameter("user_dan"));
		
		String data = "<html>";
		data += "<style>"
				+ "tbody tr:nth-child(2n) {"
				+ "background-color : pink;"
				+ "}"
				+ "tbody tr:nth-child(2n+1) {"
				+ "background-color : white;"
				+ "}"
				+"</style>";
		
		data += "<body>";
		output.print("<table border=1 width=800 align=center>");
		output.print("<tr align=center>");
		output.print("<td colspan=2 >" +num + "단 출력</td>");
		output.print("</tr>");
		
		for(int i=1; i<10; i++) {
			output.print("<tr align=center background-color=pink>");
			output.print("<td width=400 background-color=pink>");
			output.print(num +"*"+i);
			output.print("</td>");
			output.print("<td width=400>");
			output.print(num*i);
			output.print("</td>");
			output.print("</tr>");
			data += "<br/>";
		}
		output.print("</table>");
		data += "</body>";
		data += "</html>";
		
		output.print(data);
		
		

		
	}

}
