<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%!
	String name = "�̶��";
	public String gteName(){return name;}
%>

<%
	String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����Ʈ�� ����</title>
</head>
<body>
<%-- JSP �ּ� --%>
	<h1><%=name %>���� ���̴� <%=age %>�Դϴ�.</h1>
	<h1>Ű�� <%="50cm" %>�Դϴ�.</h1>
	<h1>����� �ɶ����� ���� ����� <%=20-Integer.parseInt(age) %>�� �Դϴ�.</h1>
</body>
</html>