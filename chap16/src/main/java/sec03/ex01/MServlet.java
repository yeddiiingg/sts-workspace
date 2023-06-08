package sec03.ex01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/MServlet")
public class MServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doHandle(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doHandle(request, response);
    }

    private void doHandle(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        MemberDAO dao = new MemberDAO();
        ArrayList<MemberVO> list = dao.listMembers();

        String result="";
        result = "<main>";
        for (int i=0; i<list.size(); i++) {
        	MemberVO m = list.get(i);
        	String id = m.getId();
        	String name = m.getName();
        	String pwd = m.getPwd();
        	String email = m.getEmail();
        	Date joinDate = m.getJoinDate();
        	
            result += "<info><id>" + id +"</id>"
            		+"<pwd>"+pwd+"</pwd>"
            		+"<name>"+name+"</name>"
            		+"<email>"+email+"</email>"
            		+"<joinDate>"+joinDate+"</joinDate>"+"</info>";

    }
        result += "</main>";
        
        out.print(result);
    }
}