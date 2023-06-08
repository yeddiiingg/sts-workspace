package sec02.ex02;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.mysql.cj.xdevapi.JsonParser;

@WebServlet("/json")
public class JsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("text/html; charset=utf-8");
		String jsonInfo = request.getParameter("info");
		try {
			JSONParser JsonParser = new JSONParser();
			JSONObject JSONObject = (org.json.simple.JSONObject) JsonParser.parse(jsonInfo);
			System.out.println("회원 정보 출력");
			System.out.println(JSONObject.get("name"));
			System.out.println(JSONObject.get("age"));
			System.out.println(JSONObject.get("gender"));
			System.out.println(JSONObject.get("nickname"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
