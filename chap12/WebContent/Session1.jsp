<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	//session ��ü�� nameŰ�� ���ε� �� value���� ������ �´�.
	String name = (String)session.getAttribute("name"); 
	
	// session ��ü�� ageŰ�� 20�̶�� value�� ���ε� �ϰ� �ִ�.
	session.setAttribute("age", 20);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	�̸��� <%=name %>�Դϴ�.<br/>
	<a href='/chap12/Session2.jsp'>�ι�° �������� �̵� </a>
	
</body>
</html>