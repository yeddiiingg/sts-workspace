<%@page import="com.mycom.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("id"); 
	String upass = request.getParameter("ps"); 
	
	UserDAO dao = new UserDAO();
	int code = dao.login(uid, upass);
	if (code == 1){
		out.print("���̵� �������� �ʽ��ϴ�.");
	}else if(code == 2){
		out.print("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
	}else{
		session.setAttribute("id", uid);
		response.sendRedirect("main.jsp");
	}
%>
