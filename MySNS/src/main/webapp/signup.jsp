<%@page import="com.mycom.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("id");
	String upass = request.getParameter("upass");
	String uname = request.getParameter("uname");
	
	UserDAO dao = new UserDAO();
	if (dao.exist(uid)){
		out.print("이미 가입된 회원입니다.");
		return;
	}
	if (dao.insert(uid, upass, uname)){
		session.setAttribute("id", uid);
		response.sendRedirect("main.jsp");
	}else{
		out.print("회원 가입중 오류가 발생하였습니다.");
	}
%>