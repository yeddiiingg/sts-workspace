<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%!
	String name = "쫄라맨";
	public String gteName(){return name;}
%>

<%
	String age = request.getParameter("age");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스립트릿 연슴</title>
</head>
<body>
<%-- JSP 주석 --%>
	<h1><%=name %>님의 나이는 <%=age %>입니다.</h1>
	<h1>키는 <%="50cm" %>입니다.</h1>
	<h1>사람이 될때까지 남은 년수는 <%=20-Integer.parseInt(age) %>년 입니다.</h1>
</body>
</html>