package sec01.ex01;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet({"/mem.do" })
public class MemberController extends HttpServlet {
	MemberDAO memberDAO;
	
	public void init() {
		memberDAO = new MemberDAO();
		System.out.println("DAO 실행");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			doHandle(request,response);
		} catch (ServletException | IOException | SQLException | NamingException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			doHandle(request,response);
		} catch (ServletException | IOException | SQLException | NamingException e) {
			e.printStackTrace();
		}
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, NamingException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");	
		List<MemberVO> membersList = memberDAO.listMembers();
		// 바인딩 (key -value 쌍으로 값을 묶어주는 역할)
		request.setAttribute("membersList", membersList);
		// 포워딩 (바인딩한 값을 다른 페이지로 전달하는 역할)
		RequestDispatcher dispatch = request.getRequestDispatcher("/test1/listmembers.jsp");
		dispatch.forward(request, response);
		}

}
