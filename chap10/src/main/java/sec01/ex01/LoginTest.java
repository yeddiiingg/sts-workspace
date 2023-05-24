package sec01.ex01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginTest extends HttpServlet {
	ServletContext context = null;
	List user_list = new ArrayList<>();

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setContentType("text/html; charset =euc-kr");
		context = getServletContext(); //context에 저장된 값이 서브릿으로 가요
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();  //리스너를 사용하기 위해 만든 객체
		
		String user_id = req.getParameter("user_id");
		String user_pw = req.getParameter("user_pw");
		LoginImpl loginUser = new LoginImpl(user_id,user_pw);
		
		if(session.isNew()) {  // 세션에 새로운게 들어왔다면
			session.setAttribute("loginUser", loginUser); //바인딩!서블릿에서 context로 넘겨주는애가 setAttribute
			user_list.add(user_id);							//loginUser라는 키를 통해 가져오는 것
			context.setAttribute("user_list", user_list);
		}
		
		out.println("<html><body>");
		out.println("접속 아이디 :"+loginUser.user_id+"<br/>");
		out.println("총 접속 인원 : "+LoginImpl.total);
		out.println("<br/>");
		
		List list = (List) context.getAttribute("user_list");
		for(int i=0; i<list.size(); i++) {
			out.println(list.get(i)+"<br/>");
		}
		
		out.println("<a href='logout?"+user_id+"'>로그아웃</a>");
		out.println("</body></html>");
	}

}
