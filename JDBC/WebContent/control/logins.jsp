<%@page import="com.company.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	request.setCharacterEncoding("EUC-KR");
	response.setContentType("text/html; charset=EUC-KR");
	
	String uid = request.getParameter("id");
	String upw = request.getParameter("ps");
	
	UserDAO dao = new UserDAO();
	int code = dao.login(uid, upw);
	if(code == 1){
		out.print("존재하지 않는 아이디입니다.");
	}else if(code == 2){
		out.print("비밀번호가 일치하지 않습니다");
	}else{
		session.setAttribute("id", uid); //바인딩..
		response.sendRedirect("../index.html");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>