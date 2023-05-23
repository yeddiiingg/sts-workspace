package sec03.ex01;

import java.awt.image.DataBufferDouble;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberServlet
 */

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
		PrintWriter out = resp.getWriter();
		MemberDAO dao = new MemberDAO();
		List<MemberVO> list = dao.listmembers();
		String command = req.getParameter("command");

		
		if (command != null && command.equals("addMember")) {
			int _custid = Integer.parseInt(req.getParameter("custid"));	
			String _name = req.getParameter("name");
			String _identy = req.getParameter("identy");
			String _address = req.getParameter("address");
			String _phone = req.getParameter("phone");
			
			MemberVO vo = new MemberVO();
			vo.setCustid(_custid);
			vo.setName(_name);
			vo.setIdenty(_identy);
			vo.setAddress(_address);
			vo.setPhone(_phone);
			dao.addMember(vo);
		}else if(command != null && command.equals("delMember")) {
			int _custid = Integer.parseInt(req.getParameter("custid"));	
			
			dao.delMember(_custid);
		}
		
		out.print("<html><body>");
		out.print("<table border = 1 ><tr align='center' bgcolor='#ff69b4'> ");
		out.print("<td>고객번호</td><td>이름</td><td>주민번호</td><td>주소</td><td>핸드폰</td>");
		
		for(int i = 0; i<list.size();i++) {
			MemberVO memberVO = (MemberVO)list.get(i);
			int custid = memberVO.getCustid();
			String name = memberVO.getName();
			String identy = memberVO.getIdenty();
			String address = memberVO.getAddress();
			String phone = memberVO.getPhone();
		
			out.print("<tr><td>"+custid+"</td><td>"+name+"</td><td>"+identy+"</td><td>"+address+"</td><td>"+phone+
					"</td><td>"+"<a href='/chap07/madang?command=delMember&custid="+custid+"'>삭제</a></td></tr>");
			
		}
		out.print("</table>");
		out.print("<a href='/chap07/member.html'>새 회원 등록</a></body></html>");
		
	}

	public MemberServlet() {
        super();
    }
		
}
