<%@page import="com.company.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	request.setCharacterEncoding("EUC-KR");
	response.setContentType("text/html; charset=EUC-KR");
	
	UserDAO dao = new UserDAO();
	
	String join_id = request.getParameter("join_id");
	String join_pw1 = request.getParameter("join_pw1");
	String join_pw2 = request.getParameter("join_pw2");
	String join_name = request.getParameter("join_name");
	
	dao.join(join_id, join_pw1, join_name);
	response.sendRedirect("../index.html");
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