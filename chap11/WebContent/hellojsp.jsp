<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%!
	String name = "�Ϳ��"; // ���� ����
	public String getName(){ return name;} //getter(������) ����
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ù JSP</title>
</head>
<body>
	<h2>�� ���� JSP ��!!!!</h2>
	<img src="images/sad.jpg">
	<h3><%=name %> ������</h3>

</body>
</html>