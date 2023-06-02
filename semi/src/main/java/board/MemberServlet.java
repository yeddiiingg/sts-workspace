package board;

import java.awt.image.DataBufferDouble;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/madang")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	doHandle(req,resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req,resp);
	}
	
	private void doHandle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		resp.setContentType("text/html; charset=euc-kr");
		MemberDAO dao = new MemberDAO();
		List memberlist = dao.listmembers();
		
		String command = req.getParameter("command");

		
		if (command != null && command.equals("addMember")) {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String main = req.getParameter("main");
			Date date = req.getParameter("date");
			
			MemberVO vo = new MemberVO();
			vo.setId(id);
			vo.setName(name);
			vo.setMain(main);
			vo.setDate(date);
			dao.addMember(vo);
		}else if(command != null && command.equals("delMember")) {
			String id = Integer.parseInt(req.getParameter("custid"));	
			
			dao.delMember(id);
		}
		
		// 조회된 회원 정보를 ArrayList 객체에 저장 후 request에 바인딩한다.
		req.setAttribute("memberlist", memberlist);
		
		// 바인딩한 request를 view 서블릿으로 포워딩
		RequestDispatcher dispatch = req.getRequestDispatcher("view");
		dispatch.forward(req, resp);
	}
}
