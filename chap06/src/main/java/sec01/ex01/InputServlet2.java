package sec01.ex01;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/input2")
public class InputServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public void init(ServletConfig config) throws ServletException {
		System.out.println("이닛이닛");
	}


	public void destroy() {
		System.out.println("뿌셔뿌셔");
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// form 태그에서 전송된 데이터들의 name 속성 값을 저장
		// 반복자 cf)Iterator와의 차이점 : 단반향 / Hashtable과 함께 사용
		Enumeration enu = request.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String)(enu.nextElement());
			String[] values = request.getParameterValues(name);
			for (String s : values) {
				System.out.println(name+":"+s);
			}
		}
			
		}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		System.out.println("포스포스");
		// form 태그에서 전송된 데이터들의 name 속성 값을 저장
		// 반복자 cf)Iterator와의 차이점 : 단반향 / Hashtable과 함께 사용
		Enumeration enu = req.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String)(enu.nextElement());
			String[] values = req.getParameterValues(name);
			for (String s : values) {
				System.out.println(name+":"+s);
			}
		}
			
		}
	}
	

